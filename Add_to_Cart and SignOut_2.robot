*** Settings ***
Documentation    verifying the new user account functionality
Library  SeleniumLibrary
Resource   MyKeywords.robot
Resource  Variables.robot
#Suite Setup  Get to login page
#Suite Teardown  Close All Browsers

*** Test Cases ***
Login to homepage
    Login user    ${USER_EMAIL}    ${USER_PASSWD}

Add to cart and sign out user and return to home page
    Adding item to cart sign out and back to homepage


