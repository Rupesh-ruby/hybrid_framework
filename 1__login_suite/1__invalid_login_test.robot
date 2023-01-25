*** Settings ***
Documentation       This file contains test cases related to invalid login
Resource    ../Resource/base/common_fuctionalities.resource
Library     DataDriver      file=../test_data/Orange_data.xlsx      sheet_name=Invalid_Login_Test
Task Setup   Launch Browser And Navigate To Url
Test Teardown       Close Browser
Test Template       Invalid Login Template
*** Test Cases ***
TC1
*** Keywords ***
Invalid Login Template
    [Arguments]     ${username}     ${password}     ${expected_error}
    Input Text    name:username    ${username}
    Input Password    name:password    ${password}
    Click Element    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
    Element Should Contain    xpath=//p[contains(@class,'oxd-alert')]      ${expected_error}