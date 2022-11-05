*** Settings ***
Documentation    Variables and keywords for automation practice project
Library  SeleniumLibrary
Library  FakerLibrary
Resource  Variables.robot

*** Keywords ***
Check homepage logo and add to cart
   Open Browser  ${URL}  ${BROWSER}
   Maximize Browser Window
   Wait Until Element Is Visible    ${APP_LOGO}   10s
   Wait Until Element Is Visible    ${SHOPPING_CART}  10s
   Capture Page Screenshot

Login user
     [Arguments]  ${username}  ${password}
     Open Browser  ${URL}  ${BROWSER}
     Maximize Browser Window
     Wait And Click Element   ${HOMEPAGE_SIGNIN_BTN}
     Wait And Input Text   ${LOGIN_USERNAME_FIELD}    ${username}
     Wait And Input Text    ${LOGIN_PASSWD_FIELD}    ${password}
     Wait And Click Element  ${LOGIN_BTN}
     Page Should Contain  ${LOGGEDIN_USER}

Enter user credentials to add address
     [Arguments]  ${username}  ${password}
     Wait And Input Text   ${LOGIN_USERNAME_FIELD}    ${username}
     Wait And Input Text    ${LOGIN_PASSWD_FIELD}    ${password}
     Wait And Click Element  ${LOGIN_BTN}

Login with incorrect username
     [Arguments]  ${username}  ${password}
     Open Browser  ${URL}  ${BROWSER}
     Maximize Browser Window
     Wait And Click Element    ${HOMEPAGE_SIGNIN_BTN}
     Wait And Input Text    ${LOGIN_USERNAME_FIELD}    ${username}
     Wait And Input Text    ${LOGIN_PASSWD_FIELD}    ${password}
     Wait And Click Element  ${LOGIN_BTN}
     Page Should Not Contain  ${LOGGEDIN_USER}

Login with incorrect password
     [Arguments]  ${username}  ${password}
     Open Browser  ${URL}  ${BROWSER}
     Maximize Browser Window
     Wait And Click Element    ${HOMEPAGE_SIGNIN_BTN}
     Wait And Input Text    ${LOGIN_USERNAME_FIELD}    ${username}
     Wait And Input Text   ${LOGIN_PASSWD_FIELD}    ${password}
     Wait And Click Element   ${LOGIN_BTN}
     Page Should Not Contain  ${LOGGEDIN_USER}

Retrieve User Password
   [Arguments]  ${forgotPassword_link}  ${emailAddress_field}   ${emailAddress}   ${retirevePassword_btn}
   Wait And Click Element   ${forgotPassword_link}
   Wait And Input Text    ${emailAddress_field}   ${emailAddress}
   Wait And Click Element   ${retirevePassword_btn}
   Wait Until Page Contains   A confirmation email has been sent to your address: ${emailAddress}  10s

Get to login page
     Open Browser  ${URL}  ${BROWSER}
     Maximize Browser Window
     Wait And Click Element    ${HOMEPAGE_SIGNIN_BTN}

Wait And Click Element
   [Documentation]  Wait for element to be enabled before clicking
   [Arguments]  ${selector}  ${timeouts}=10s
   Wait Until Element Is Enabled    ${selector}
   Click Element  ${selector}

Wait And Input Text
   [Documentation]  Wait for element to be enabled before inputing text
   [Arguments]  ${selector}  ${text}  ${timeouts}=10s
   Wait Until Element Is Enabled    ${selector}
   Input Text  ${selector}  ${text}

Enter email for new user and click the create account button
    ${email}=  FakerLibrary.email
    log  ${email}
    Set Test Variable    ${email}
    Wait And Input Text  ${CREATE_USER_EMAIL}   ${email}
    Wait And Click Element  ${CREATE_USER_BTN}

Enter firstname, lastname and password
    [Arguments]  ${firstname}  ${lastname}  ${password}
    Wait And Input Text   ${USER_FIRSTNAME}  ${firstname}
    Wait And Input Text   ${USER_LASTNAME}  ${lastname}
    Wait And Input Text   ${NEW_USER_PASSWD}  ${password}

Select user date of birth in days, months and Years
    Sleep    5
    Select From List By Index    ${DOB_DAYS}  10
    Sleep    5
    Select From List By Index    ${DOB_MONTHS}  9
    Sleep    5
    Select From List By Value    ${DOB_YEARS}  1990

Enter address, City, State, postcoode, mobile, alias and click on register
     Wait And Input Text   ${USER_ADDRESS}  Testing street
     Wait And Input Text   ${USER_CITY}  Chicago
     Select From List By Label  ${USER_STATE}  Illinois
     Wait And Input Text  ${USER_POSTCODE}  00000
     Wait And Input Text   ${USER_MOBILE}  123456789
     Wait And Input Text   ${ADD_ALIAS}  QA House
     Wait And Click Element  ${REGISTER_BTN}
     Wait Until Page Contains    Lola Gold

Modify Address
     Wait And Input Text   ${USER_ADDRESS}  Testing street
     Wait And Input Text   ${USER_CITY}  Atlanta
     Select From List By Label  ${USER_STATE}  Georgia
     Wait And Input Text  ${USER_POSTCODE}  11111
     Wait And Input Text   ${USER_MOBILE}  123456789
     Wait And Input Text   ${ADD_ALIAS}  Testing House
     Wait And Click Element  ${SAVE_BTN}
     #Wait Until Page Contains    Lola Gold

Add a new address and save
   Wait And Click Element  ${MY_ADDRESSES}
   Wait And Click Element  ${NEW_ADDRESS}
   Modify Address
   Wait Until Page Contains  Testing House

Delete Address and Close Browser
    Wait And Click Element  ${DELET_ADD_BTN}
    Handle Alert  Accept
    Page should Not Contain   Testing House
    Close Browser

Change password and save
    Wait And Click Element    ${EDIT_PERSONAL_INFO_BTN}
    Wait And Input Text    ${CURRENT_PASSWORD}    testing
    Wait And Input Text   ${LOGIN_PASSWD_FIELD}  testingupdate
    Wait And Input Text  ${CONFIRM_PASSWORD}  testingupdate
    Wait And Click Element    ${SAVE_NEW_PASSWORD}
    Wait Until Page Contains     Your personal information has been successfully updated.
    Close Browser

