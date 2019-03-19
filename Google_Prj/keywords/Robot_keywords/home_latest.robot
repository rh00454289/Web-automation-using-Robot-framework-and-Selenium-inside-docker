*** Settings ***
Documentation     Suite description
#Resource          ../../testsuites/TC_Web_WS_latest.robot
Library           Selenium2Library
Library           OperatingSystem
Resource          ../../resources/WebUI/page_obj_latest.txt

*** Keywords ***
Open Browser and launch Google WebPage
    [Arguments]    ${BROWSER}
    #Firefox
    ${firefox options} =     Evaluate    sys.modules['selenium.webdriver'].firefox.webdriver.Options()    sys, selenium.webdriver
    Call Method    ${firefox options}   add_argument    -headless
    Create Webdriver    Firefox    firefox_options=${firefox options}
    Set Window Size    1500    1500
    Go To    https://www.google.com
    Capture Page Screenshot
