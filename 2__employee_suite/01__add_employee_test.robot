*** Settings***
Documentation       This file contains test cases related to employee
...     records
Resource     ../Resource/base/common_fuctionalities.resource
Library     DataDriver      file=../test_data/Orange_data.xlsx      sheet_name=Valid_Employee_Test

Task Setup      Launch Browser And Navigate To Url
Test Teardown       Close Browser
Test Template       Add Valid Employee Template

*** Test Cases ***
TC_${test_case}

*** Keywords ***
Add Valid Employee Template
    [Arguments]     ${username}     ${password}     ${firstname}    ${middlename}   ${lastname}     ${expected_header}      ${expected_firstname}
    Input Text    name:username    ${username}
    Input Password    name:password     ${password}
    Click Element    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
    Click Element    xpath=//span[contains(normalize-space(),'PIM')]
    Click Element    link=Add Employee
    Input Text    name:firstName    ${firstname}
    Input Text    name:middleName    ${middlename}
    Input Text    name:lastName    ${lastname}
    Sleep    5s
    Click Element    xpath=//button[contains(normalize-space(),'Save')]
    Element Should Contain    xpath=//h6[contains(normalize-space(),'${firstname}')]      ${expected_header}
    Element Attribute Value Should Be    name:firstName    value    ${expected_firstname}