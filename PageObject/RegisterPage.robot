*** Settings ***
Library            SeleniumLibrary
Library            DateTime
Library            String

*** Variable ***
# REGISTER PAGE
${textRegistration}                xpath=//h1[contains(text(),'Registration')]
${fieldBusinessName}               id=user_merchant_name
${fieldFullName}                   id=user_full_name
${fieldBusinessEmail}              id=user_email
${fieldBusinessPhoneNumber}        id=user_phone
${fieldPassword}                   id=user_password
${fieldConfirmPassword}            id=user_password_confirmation
${buttonRegister}                  id=signup_btn
${notifSuccess}                    xpath=//span[contains(text(),'Please check your inbox.')]
${businessNameBlankMessage}        xpath=//div[contains(text(),"Merchant name can't be blank")]
# LOGIN PAGE
${textLogin}                       xpath=//h1[contains(text(),'Log In')]
${buttonLogin}                     xpath=//button[contains(text(),'Log me in')]
${wrongPasswordMessage}            xpath=//div[contains(text(),'Invalid email or password.')]
# REGISTER COMPLETION PAGE
${textCompleteYourRegis}           xpath=//p[contains(text(),'Accept payments safely with Midtrans')]
${textDescCompletion}              xpath=//p[contains(text(),'We are registered under the Bank of Indonesia and ')]
${buttonNext}                      xpath=//button[contains(text(),'Next')]


*** Keywords ***
# REGISTER PAGE
user is on Register Page
    Maximize Browser Window
    Go To                                                            ${REGISTERURL}
    Wait Until Element Is Visible                                    ${textRegistration}           timeout=30

user input bussines name
    [Arguments]    ${businessName}
    Wait Until Element Is Visible                                    ${fieldBusinessName}
    Input Text                                                       ${fieldBusinessName}          ${businessName}

user input full name
    [Arguments]    ${fullName}
    Wait Until Element Is Visible                                    ${fieldFullName}
    Input Text                                                       ${fieldFullName}              ${fullName}
    
user input business email
    [Arguments]    ${email}
    Wait Until Element Is Visible                                    ${fieldBusinessEmail}
    ${currentDate}       Get Current Date
    ${currentDate}       Convert Date                                ${currentDate}                result_format=%H%M%S
    Input Text                                                       ${fieldBusinessEmail}         ${currentDate}${email}

user input business phone number
    [Arguments]    ${phoneNumber}
    Scroll Element Into View                                         ${buttonRegister}
    Wait Until Element Is Visible                                    ${fieldBusinessPhoneNumber}
    ${currentDate}       Get Current Date
    ${currentDate}       Convert Date                                ${currentDate}                result_format=%H%M%S
    Input Text                                                       ${fieldBusinessPhoneNumber}   ${phoneNumber}${currentDate}

user input password register
    [Arguments]    ${password}
    Wait Until Element Is Visible                                    ${fieldPassword}
    Input Text                                                       ${fieldPassword}              ${password}

user input confirm password
    [Arguments]    ${confirmPassword}
    Wait Until Element Is Visible                                    ${fieldConfirmPassword}
    Input Text                                                       ${fieldConfirmPassword}       ${confirmPassword}

user click Register button
    Wait Until Element Is Visible                                    ${buttonRegister}
    click Element                                                    ${buttonRegister}

user Success Sign Up
    wait Until Element Is Visible                                    ${notifSuccess}               timeout=30

user can see Business Name Error Message
    wait Until Element Is Visible                                    ${businessNameBlankMessage}

user can see Sign Up Validation
    [Arguments]    ${validation}
    Run Keyword IF          '${validation}' == 'Blank Business Name'        user can see Business Name Error Message
    ...    ELSE IF          '${validation}' == 'Success Sign Up'            user Success Sign Up
    
# LOGIN PAGE
user is on Login Page
    Maximize Browser Window
    Go To                                                            ${LOGINURL}
    Wait Until Element Is Visible                                    ${textLogin}                  timeout=30
    
user input Email Address
    [Arguments]    ${email}
    Wait Until Element Is Visible                                    ${fieldBusinessEmail}
    Input Text                                                       ${fieldBusinessEmail}         ${email}
    
user input Password Login
    [Arguments]    ${password}
    Wait Until Element Is Visible                                    ${fieldPassword}
    Input Text                                                       ${fieldPassword}              ${password}

user click Log me in Button
    Wait Until Element Is Visible                                    ${buttonLogin}
    click Element                                                    ${buttonLogin}

user Success Sign In
    Wait Until Element Is Visible                                    ${buttonNext}                 timeout=30
    Element Should Be Enabled                                        ${textCompleteYourRegis}
    Element Should Be Enabled                                        ${textDescCompletion}
    Element Should Be Enabled                                        ${buttonNext}
    Location Should Be                                               https://dashboard.midtrans.com/

user can see Wrong Password Error Message
    Wait Until Element Is Visible                                    ${wrongPasswordMessage}
    
user can see Sign In Validation
    [Arguments]    ${validation}
    Run Keyword IF          '${validation}' == 'Wrong Password'        user can see Wrong Password Error Message
    ...    ELSE IF          '${validation}' == 'Success Sign In'       user Success Sign In