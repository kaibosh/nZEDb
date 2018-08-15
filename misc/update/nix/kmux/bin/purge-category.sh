# echo "--------------- Delete Minimum size by Category ---------------------"
# 48 hours allows release to be properly categorised before size based deletion
# echo "Delete Minimum size in Console "
php $TEST_PATH/Release/delete_releases.php categoryid=equals=1010 size=smaller=2097152 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=1020 size=smaller=2097152 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=1030 size=smaller=2097152 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=1040 size=smaller=2097152 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=1050 size=smaller=2097152 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=1060 size=smaller=2097152 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=1070 size=smaller=2097152 adddate=bigger=48 ignore #   
php $TEST_PATH/Release/delete_releases.php categoryid=equals=1080 size=smaller=2097152 adddate=bigger=48 ignore #   
php $TEST_PATH/Release/delete_releases.php categoryid=equals=1110 size=smaller=2097152 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=1120 size=smaller=2097152 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=1130 size=smaller=2097152 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=1140 size=smaller=2097152 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=1180 size=smaller=2097152 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=1999 size=smaller=2097152 adddate=bigger=48 ignore # 
# echo "Delete Minimum size in Movies "
# php $TEST_PATH/Release/delete_releases.php categoryid=equals=2010 size=smaller=209715200 ignore 
# php $TEST_PATH/Release/delete_releases.php categoryid=equals=2020 size=smaller=2097152 ignore 
# php $TEST_PATH/Release/delete_releases.php categoryid=equals=2030 size=smaller=41943040 ignore
# php $TEST_PATH/Release/delete_releases.php categoryid=equals=2040 size=smaller=62914560 ignore
# php $TEST_PATH/Release/delete_releases.php categoryid=equals=2050 size=smaller=52428800 ignore
# php $TEST_PATH/Release/delete_releases.php categoryid=equals=2060 size=smaller=52428800 ignore
# php $TEST_PATH/Release/delete_releases.php categoryid=equals=2070 size=smaller=52428800 ignore
# echo "Delete Minimum size in Audio "
php $TEST_PATH/Release/delete_releases.php categoryid=equals=3010 size=smaller=15728640 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=3020 size=smaller=52428800 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=3030 size=smaller=1048576 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=3040 size=smaller=134217728 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=3060 size=smaller=10485760 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=3999 size=smaller=10485760 adddate=bigger=48 ignore # 
# echo "Delete Minimum size in PC "
php $TEST_PATH/Release/delete_releases.php categoryid=equals=4010 size=smaller=1048576 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=4020 size=smaller=20971520 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=4030 size=smaller=10485760 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=4040 size=smaller=1048576 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=4050 size=smaller=1048576 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=4060 size=smaller=1048576 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=4070 size=smaller=1048576 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=4999 size=smaller=1048576 adddate=bigger=48 ignore # 
# echo "Delete Minimum size in TV "
php $TEST_PATH/Release/delete_releases.php categoryid=equals=5010 size=smaller=20971520 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=5020 size=smaller=104857600 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=5030 size=smaller=41943040 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=5040 size=smaller=62914560 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=5999 size=smaller=20971520 adddate=bigger=48 ignore # 
# echo "Delete Minimum size in X  "
php $TEST_PATH/Release/delete_releases.php categoryid=equals=6010 size=smaller=52428800 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=6020 size=smaller=52428800 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=6030 size=smaller=52428800 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=6040 size=smaller=52428800 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=6050 size=smaller=52428800 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=6060 size=smaller=52428800 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=6070 size=smaller=52428800 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=6080 size=smaller=52428800 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=6090 size=smaller=52428800 adddate=bigger=48 ignore # 
php $TEST_PATH/Release/delete_releases.php categoryid=equals=6999 size=smaller=52428800 adddate=bigger=48 ignore # 

# echo " ================== Inline Category Size Purge Fin ================== "
