** Settings ***
Documentation     Testing the Collaborate Web Application
#Suite Setup         Open Browser and Login to Collaborate WebPage
#Test Teardown      Close Browser
Resource              ../../keywords/Robot_keywords/home_latest.robot
#Resource              ../../keywords/Robot_keywords/home_FT.robot
Library                 Selenium2Library
Library	              ImageHorizonLibrary
Resource             ../../resources/WebUI/TestData_latest.txt

*** Test Cases ***

Create workspace and add .JPG file
    Given Open Browser and launch Google WebPage    ${BROWSER}
