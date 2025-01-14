run_all_in_parallel:
	make -j test_Windows_10_edge_latest test_safari_latest test_Windows_10_chrome_latest
	
test_Windows_10_edge_latest:
	robot  --output NONE --report NONE --log NONE --variable browserName:MicrosoftEdge --variable version:latest --variable ROBOT_BROWSER:Edge Tests/sample_test.robot
test_safari_latest:
	robot  --output NONE --report NONE --log NONE --variable browserName:Safari --variable version:latest --variable ROBOT_BROWSER:Safari Tests/sample_test.robot 
test_Windows_10_chrome_latest:
	robot  --output NONE --report NONE --log NONE --variable browserName:Chrome --variable version:latest --variable ROBOT_BROWSER:Chrome Tests/sample_test.robot 