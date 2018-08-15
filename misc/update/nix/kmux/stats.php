<?php
// kmux stats for "monitor" pane
require_once realpath(dirname(dirname(dirname(dirname(__DIR__)))) . DIRECTORY_SEPARATOR . 'bootstrap.php');
 
// use app\models\Settings;
use nzedb\Category;
use nzedb\db\DB;
use nzedb\Nfo;
use nzedb\NZB;
// use nzedb\utility\Misc;
 
$pdo = new DB();
$db_name = DB_NAME;
// $pdotype = DB_SYSTEM;

// ============ Perform the queries ===============
echo "Running DB queries for monitor stats";

// TODO read settings table params to make queries more accurate
$nfo_todo = $pdo->query(sprintf('SELECT COUNT(*) AS cnt FROM releases WHERE nzbstatus = %d AND nfostatus BETWEEN -8 AND -1', NZB::NZB_ADDED));
$nfo_todo = $nfo_todo[0]['cnt'];
$nfo_total = $pdo->query(sprintf('SELECT COUNT(*) AS cnt FROM releases WHERE nzbstatus = %d AND nfostatus = %d', NZB::NZB_ADDED, Nfo::NFO_FOUND)); 
$nfo_total = $nfo_total[0]['cnt'];
 
$book_todo = $pdo->query(sprintf('SELECT COUNT(*) AS cnt FROM releases WHERE nzbstatus = %d AND categories_id = %d AND bookinfo_id IS NULL', NZB::NZB_ADDED, Category::BOOKS_EBOOK));
$book_todo = $book_todo[0]['cnt'];
$book_total = $pdo->query(sprintf('SELECT COUNT(*) AS cnt FROM releases WHERE nzbstatus = %d AND categories_id = %d', NZB::NZB_ADDED, Category::BOOKS_EBOOK));
$book_total = $book_total[0]['cnt'];
 
$console_todo = $pdo->query(sprintf('SELECT COUNT(*) AS cnt FROM releases WHERE nzbstatus = %d AND categories_id BETWEEN %d AND %d AND consoleinfo_id IS NULL', NZB::NZB_ADDED, Category::GAME_ROOT, Category::GAME_OTHER));
$console_todo = $console_todo[0]['cnt'];
$console_total = $pdo->query(sprintf('SELECT COUNT(*) AS cnt FROM releases WHERE nzbstatus = %d AND categories_id BETWEEN %d AND %d', NZB::NZB_ADDED, Category::GAME_ROOT, Category::GAME_OTHER));
$console_total = $console_total[0]['cnt'];
 
$movie_todo = $pdo->query(sprintf('SELECT COUNT(*) AS cnt FROM releases WHERE nzbstatus = %d AND categories_id BETWEEN %d AND %d AND imdbid IS NULL', NZB::NZB_ADDED, Category::MOVIE_ROOT, Category::MOVIE_OTHER));
$movie_todo = $movie_todo[0]['cnt'];
$movie_total = $pdo->query(sprintf('SELECT COUNT(*) AS cnt FROM releases WHERE nzbstatus = %d AND categories_id BETWEEN %d AND %d', NZB::NZB_ADDED, Category::MOVIE_ROOT, Category::MOVIE_OTHER));
$movie_total = $movie_total[0]['cnt'];
 
$music_todo = $pdo->query(sprintf('SELECT COUNT(*) AS cnt FROM releases WHERE nzbstatus = %d AND categories_id IN (%d, %d, %d) AND musicinfo_id IS NULL', NZB::NZB_ADDED, Category::MUSIC_MP3, Category::MUSIC_LOSSLESS, Category::MUSIC_OTHER));
$music_todo = $music_todo[0]['cnt'];
$music_total = $pdo->query(sprintf('SELECT COUNT(*) AS cnt FROM releases WHERE nzbstatus = %d AND categories_id IN (%d, %d, %d)', NZB::NZB_ADDED, Category::MUSIC_MP3, Category::MUSIC_LOSSLESS, Category::MUSIC_OTHER));
$music_total = $music_total[0]['cnt'];
 
$pcgame_todo = $pdo->query(sprintf('SELECT COUNT(*) AS cnt FROM releases WHERE nzbstatus = %d AND categories_id = %d AND gamesinfo_id = 0', NZB::NZB_ADDED, Category::PC_GAMES));
$pcgame_todo = $pcgame_todo[0]['cnt'];
$pcgame_total = $pdo->query(sprintf('SELECT COUNT(*) AS cnt FROM releases WHERE nzbstatus = %d AND categories_id = %d', NZB::NZB_ADDED, Category::PC_GAMES));
$pcgame_total = $pcgame_total[0]['cnt'];
 
$tv_todo = $pdo->query(sprintf('SELECT COUNT(*) AS cnt FROM releases WHERE nzbstatus = %d AND categories_id BETWEEN %d AND %d AND categories_id != %d AND videos_id = 0 AND tv_episodes_id BETWEEN -3 AND 0 AND size > 1048576', NZB::NZB_ADDED, Category::TV_ROOT, Category::TV_OTHER, Category::TV_ANIME));
$tv_todo = $tv_todo[0]['cnt'];
$tv_total = $pdo->query(sprintf('SELECT COUNT(*) AS cnt FROM releases WHERE nzbstatus = %d AND categories_id BETWEEN %d AND %d AND categories_id != %d AND size > 1048576', NZB::NZB_ADDED, Category::TV_ROOT, Category::TV_OTHER, Category::TV_ANIME));
$tv_total = $tv_total[0]['cnt'];
 
$xxx_todo = $pdo->query(sprintf('SELECT COUNT(*) AS cnt FROM releases WHERE nzbstatus = %d AND categories_id BETWEEN %d AND %d AND xxxinfo_id = 0', NZB::NZB_ADDED, Category::XXX_ROOT, Category::XXX_OTHER));
$xxx_todo = $xxx_todo[0]['cnt'];
$xxx_total = $pdo->query(sprintf('SELECT COUNT(*) AS cnt FROM releases WHERE nzbstatus = %d AND categories_id BETWEEN %d AND %d', NZB::NZB_ADDED, Category::XXX_ROOT, Category::XXX_OTHER));
$xxx_total = $xxx_total[0]['cnt'];
 
// $releases_now = $pdo->query(sprintf('SELECT TABLE_ROWS AS cnt FROM information_schema.TABLES WHERE database_name = %s AND table_name = "releases"', $db_name));
$releases_now = $pdo->query(sprintf('SELECT TABLE_ROWS AS cnt FROM information_schema.TABLES WHERE table_name = "releases"')); // InnoDB only
$releases_now = $releases_now[0]['cnt'];
$work_remaining_now = $pdo->query('SELECT COUNT(*) AS cnt from releases r left join categories c on c.ID = r.categories_id where (r.passwordstatus between -6 and -1) or (r.haspreview = -1 and c.disablepreview = 0)'); // OLD
$work_remaining_now = $work_remaining_now[0]['cnt'];
// $total_work_now = $work_remaining_now + $book_todo + $console_todo + $music_todo + $movie_todo + $pcgame_todo + $tv_todo + $xxx_todo;
$additional_releases_now = $releases_now - $book_total - $console_total - $movie_total - $music_total - $pcgame_total - $tv_total - $xxx_total;

$tmpvar = $pdo->query(sprintf('SELECT adddate AS newestrelease,LEFT(searchname,40) as newestrelname FROM releases ORDER BY id DESC LIMIT 1'));
$newestrelname = $tmpvar[0]['newestrelname'];
$newestrelease = $tmpvar[0]['newestrelease'];
  
// ========== Clear pane and write stats ==========
passthru('clear');
printf("\033[1;33mkmux Monitor Running\n");
printf("\n\033[1;33m"); 
$mask = "%16s %10s %11s \n";
printf($mask, "Category", "In Process", "In Database");
printf($mask, "===============", "==========", "===========\033[0m");
printf($mask, "NFO's","$nfo_todo","$nfo_total");
printf($mask, "Books","$book_todo","$book_total");
printf($mask, "Console","$console_todo","$console_total");
printf($mask, "Movie","$movie_todo","$movie_total");
printf($mask, "Audio","$music_todo","$music_total");
printf($mask, "PC","$pcgame_todo","$pcgame_total");
printf($mask, "TV","$tv_todo","$tv_total");
printf($mask, "XXX","$xxx_todo","$xxx_total");
printf($mask, "Additional Proc","$work_remaining_now","$additional_releases_now");
printf("\n");
printf("\033[1;31m$releases_now\033[0m releases in your database.\n");
// printf("\033[1;31m$total_work_now\033[0m releases left to postprocess.");
printf("\n");
printf("Newest Release: $newestrelname\n");
printf("  was added at: $newestrelease\n");
printf("\n");

?>
