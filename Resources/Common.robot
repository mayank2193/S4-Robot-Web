*** Settings ***
Library  SeleniumLibrary
Library  LambdaTestStatus.py

*** Variables ***
${BROWSER}          ${ROBOT_BROWSER}
&{lt_options}       browserName=safari    platformName=ios      name=RobotFramework Lambda Test    build=Robot Build real device   deviceName=iPhone.*    isRealMobile=True   w3c=Ture
${REMOTE_URL}       http://%{LT_USERNAME}:%{LT_ACCESS_KEY}@mobile-hub.lambdatest.com/wd/hub
${TIMEOUT}          30000

*** Keywords ***
Open test browser
    [Timeout]   ${TIMEOUT}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].${BROWSER}Options()    sys, selenium.webdriver
    Call Method    ${options}    set_capability    LT:Options    ${lt_options}
    Open Browser    https://lambdatest.github.io/sample-todo-app/
    ...    browser=${BROWSER}
    ...    remote_url=${REMOTE_URL}
    ...    options=${options}

Close test browser
    Run keyword if    '${REMOTE_URL}' != ''
    ...    Report Lambdatest Status
    ...    ${TEST_NAME}
    ...    ${TEST_STATUS}
    Close All Browsers