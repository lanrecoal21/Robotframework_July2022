*** Settings ***
Documentation    Validate application homepage and login page
Library  SeleniumLibrary
Resource   resources/MyKeywords.robot
Resource  resources/Variables.robot
Suite Teardown  Close All Browsers

*** Test Cases ***
Verify logo and Add to cart are displayed
     #[Tags]  lanre
     Check homepage logo and add to cart


Valid Login
     #[Tags]  lanre
     Login user  ${USER_EMAIL}  ${USER_PASSWD}


Invalid Login1
     #[Tags]  lanre
     Login with incorrect username   lanre@gmail.com  testing


Invalid Login2
    #[Tags]  lanre
     Login with incorrect password   lanre_april@gmail.com   testi


Valid error messages for incorrect login
    #[Tags]  lanre
    [Template]  Verify error messages for different invalid login scenarios
    #username               password   error messages
    lanre_april@gmail.com   test      Invalid password.
    lanre@gmail.com         testing   Invalid email address.
    ${EMPTY}                Testing   An email address required.

Verify that users can retrieve forgotten password
    [Tags]  lanre
    [Setup]  Get to login page
    Retrieve User Password  ${FORGOT_PASSWORD_LINK}  ${FORGOT_PASSWORD_EMAIL}  lanre_april@gmail.com  ${RETRIEVE_PASSWORD_BTN}


*** Keywords ***
Verify error messages for different invalid login scenarios
  [Arguments]  ${username}  ${password}  ${errormessage}
   Open Browser  ${URL}  ${BROWSER}
   Maximize Browser Window
   Click Element    ${HOMEPAGE_SIGNIN_BTN}
   Input Text    ${LOGIN_USERNAME_FIELD}  ${username}
   Input Text    ${LOGIN_PASSWD_FIELD}     ${password}
   Click Element  ${LOGIN_BTN}
   Page Should Contain  ${errormessage}
