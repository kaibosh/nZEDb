<?php

namespace nzedb;

use nzedb\db\Settings;
use nzedb\ReleaseComments;


class DnzbFailures
{
	/**
	 * @var \nzedb\db\Settings
	 */
	public $pdo;

	/**
	 * @var \nzedb\ReleaseComments
	 */
	public $rc;

	/**
	 * @var array $options Class instances.
	 */
	public function __construct(array $options = [])
	{
		$defaults = [
			'Settings' => null
		];
		$options += $defaults;

		$this->pdo = ($options['Settings'] instanceof Settings ? $options['Settings'] : new Settings());
		$this->rc = new ReleaseComments(['Settings' => $this->pdo]);
	}

	/**
	 * @note Read failed downloads count for requested guid
	 *
	 * @param string $relId
	 *
	 * @return array|bool
	 */
	public function getFailedCount($relId)
	{
		$result = $this->pdo->query(sprintf('SELECT failed AS num FROM dnzb_failures WHERE releaseid = %s', $relId));
		if (is_array($result) && !empty($result)) {
			return $result[0]['num'];
		}
		return false;
	}

	/**
	 * Get a count of failed releases for pager. used in admin manage failed releases list
	 */
	public function getCount()
	{
		$res = $this->pdo->queryOneRow("SELECT count(id) AS num FROM dnzb_failures");
		return $res["num"];
	}

	/**
	 * Get a range of releases. used in admin manage list
	 *
	 * @param $start
	 * @param $num
	 *
	 * @return array
	 */
	public function getFailedRange($start, $num)
	{
		if ($start === false) {
			$limit = '';
		} else {
			$limit = ' LIMIT ' . $start . ',' . $num;
		}

		return $this->pdo->query("SELECT r.*, concat(cp.title, ' > ', c.title) AS category_name
 									FROM releases r
 									RIGHT JOIN dnzb_failures df ON df.releaseid = r.id
 									LEFT OUTER JOIN category c ON c.id = r.categoryid
 									LEFT OUTER JOIN category cp ON cp.id = c.parentid
 									ORDER BY postdate DESC" . $limit
		);
	}

	/**
	 * Retrieve alternate release with same or similar searchname
	 *
	 * @param string $guid
	 * @param string $searchname
	 * @param string $userid
	 * @return string
	 */
	public function getAlternate($guid, $searchname, $userid)
	{
		$rel = $this->pdo->queryOneRow(sprintf('SELECT id FROM releases WHERE guid = %s', $this->pdo->escapeString($guid)));

		$this->pdo->queryInsert(sprintf("INSERT IGNORE INTO dnzb_failures (userid, releaseid) VALUES (%d, %d)",
				$userid,
				$rel['id']
			)
		);

		$this->updateFailed($rel['id']);
		$this->postComment($rel['id'], $userid);

		$alternate = $this->pdo->queryOneRow(sprintf('SELECT * FROM releases r
			WHERE r.searchname %s
			AND r.id NOT IN (SELECT releaseid FROM dnzb_failures WHERE userid = %d)',
				$this->pdo->likeString($searchname),
				$userid
			)
		);
		return $alternate;
	}

	/**
	 * @note  Post comment for the release if that release has no comment for failure.
	 *        Only one user is allowed to post comment for that release, rest will just
	 *        update the failed count in dnzb_failures table
	 *
	 * @param $relid
	 * @param $uid
	 */
	public function postComment($relid, $uid)
	{
		$text = 'This release has failed to download properly. It might fail for other users too.
		This comment is automatically generated.';
		$dbl = $this->pdo->queryOneRow(sprintf('SELECT text FROM release_comments WHERE releaseid = %d', $relid));
		if ($dbl['text'] != $text) {
			$this->rc->addComment($relid, $text, $uid, '');
		}
	}

	/**
	 * @note Update count of failed downloads for release id
	 *
	 * @param string $relId
	 */
	public function updateFailed($relId)
	{
			$this->pdo->queryExec(
					sprintf('UPDATE dnzb_failures SET failed = failed + 1 WHERE releaseid = %s', $relId)
			);
	}
}