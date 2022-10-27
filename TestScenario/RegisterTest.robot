*** Settings ***
Resource      ../PageObject/RegisterPage.robot

*** Keywords ***
Midtrans Sign Up
    [Arguments]    ${businessName}    ${fullName}    ${email}    ${phoneNumber}    ${password}    ${confirmPassword}    ${validation}
    GIVEN user is on Register Page
    WHEN user input bussines name    ${businessName}
    AND user input full name    ${fullName}
    AND user input business email    ${email}
    AND user input business phone number    ${phoneNumber}
    AND user input password register    ${password}
    AND user input confirm password    ${confirmPassword}
    AND user click Register button
    THEN user can see Sign Up Validation    ${validation}

Midtrans Sign In
    [Arguments]    ${email}    ${password}    ${validation} 
    GIVEN user is on Login Page
    WHEN user input Email Address    ${email}
    AND user input Password Login    ${password}
    AND user click Log me in Button
    THEN user can see Sign In Validation    ${validation}