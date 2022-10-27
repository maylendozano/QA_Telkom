*** Settings ***
Resource          ../Config/${env}.robot
Resource          ../TestScenario/RegisterTest.robot
Suite Setup       Open Browser    https://google.com    ${BROWSER}
Suite Teardown    Close Browser

*** Test Cases ***
Sign Up
    [Documentation]    this scenario is for positif and negatif Sign Up
    [Tags]             function    negative    positive
    [Template]         MidTrans Sign Up
    ${BLANK}           testzano    testzano@mailinator.com    81122   Za@123456    Za@123456    Blank Business Name
    testzano           testzano    testzano@mailinator.com    81122   Za@123456    Za@123456    Success Sign Up

Sign In
    [Documentation]    this scenario is for positif and negatif Sign In
    [Tags]             function    negative    positive
    [Template]         MidTrans Sign In
    zano001@mailinator.com    123456         Wrong Password
    zano001@mailinator.com    Zano@123456    Success Sign In