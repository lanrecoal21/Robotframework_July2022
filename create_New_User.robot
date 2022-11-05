*** Settings ***
Documentation    verifying the new user account functionality
Library  SeleniumLibrary
Resource   MyKeywords.robot
Resource  Variables.robot
Suite Setup  Get to login page
Suite Teardown  Close All Browsers

*** Test Cases ***
Verify that user can create a new account
    Enter email for new user and click the create account button
    Enter firstname, lastname and password  Lola  Gold  testing
    Select user date of birth in days, months and Years
    Enter address, City, State, postcoode, mobile, alias and click on register

Add new address to user profile
    #[Tags]  lanre
    Enter user credentials to add address  ${USER_EMAIL}  ${USER_PASSWD}
    Add a new address and save
    [Teardown]  Delete Address and Close Browser

Verify that users that edit and change their current password
     [Tags]  lanre
    Login user  ${USER_EMAIL}  ${USER_PASSWD}
    Change password and save


*** Keywords ***
