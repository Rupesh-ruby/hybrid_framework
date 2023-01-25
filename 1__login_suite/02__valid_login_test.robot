*** Settings ***
Documentation           This file contain test cases related to invalid login

Resource    ../Resource/base/common_fuctionalities.resource

Library         DataDriver      file=../test_data/Orange_data1.xlsx     sheet_name=valid_Login_Test

Test Setup      Launch Browser And Navigate to Url

Test Teardown       Close Browser
Test Template       valid Login Template

*** Test Cases ***

valid login test1   admin   admin123    Dashboard



*** Keywords ***


valid Login Template
    Input Text    name:username    Admin
    Input Password    name:password    admin123
    Click Button    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
    Element Should Contain   xpath=//p    Dashboard