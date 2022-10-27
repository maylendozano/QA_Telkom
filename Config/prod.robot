*** Settings ***
Documentation     A resource for global
Library           SeleniumLibrary      10        run_on_failure=Capture Page Screenshot
Library           String
Library           BuiltIn

*** Variable ***
${BROWSER}                  chrome
${BLANK}
${REGISTERURL}              https://dashboard.midtrans.com/register
${LOGINURL}                 https://dashboard.midtrans.com/login
