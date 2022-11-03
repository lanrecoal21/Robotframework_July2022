*** Settings ***
Documentation    Variables for automation practice project

*** Variables ***
${URL}  http://automationpractice.com/index.php?
${BROWSER}  chrome
${APP_LOGO}  id:header_logo
${SHOPPING_CART}  class:shopping_cart
${HOMEPAGE_SIGNIN_BTN}  class:login
${LOGIN_USERNAME_FIELD}  name:email
${LOGIN_PASSWD_FIELD}  id:passwd
${LOGIN_BTN}  id:SubmitLogin
${LOGGEDIN_USER}  Dorice Mbonde
${USER_EMAIL}  ${EMPTY}
${USER_PASSWD}  ${EMPTY}
${FORGOT_PASSWORD_LINK}  xpath://*[@id="login_form"]/div/p[1]/a
${FORGOT_PASSWORD_EMAIL}  id:email
${RETRIEVE_PASSWORD_BTN}  xpath://*[@id="form_forgotpassword"]/fieldset/p/button/span
${CREATE_USER_EMAIL}  id:email_create
${CREATE_USER_BTN}  id:SubmitCreate
${USER_GENDER}  id:id_gender2
${USER_FIRSTNAME}  id:customer_firstname
${USER_LASTNAME}  id:customer_lastname
${NEW_USER_PASSWD}  name:passwd
${DOB_DAYS}  name:days
${DOB_MONTHS}  name:months
${DOB_YEARS}   name:years
${USER_ADDRESS}  id:address1
${USER_CITY}  id:city
${USER_STATE}  name:id_state
${USER_POSTCODE}  name:postcode
${USER_MOBILE}  id:phone_mobile
${ADD_ALIAS}  id:alias
${REGISTER_BTN}  xpath://span[text() = 'Register']
${MY_ADDRESSES}  xpath://span[text() = 'My addresses']
${NEW_ADDRESS}  xpath://span[text() = 'Add a new address']
${SAVE_BTN}  id:submitAddress
${DELET_ADD_BTN}  xpath://*[@id="center_column"]/div[1]/div/div[2]/ul/li[9]/a[2]/span
${CART_BTN}      xpath://*[@id="header"]/div[3]/div/div/div[3]/div/a/b
${WOMEN_CATEGORY}   xpath://*[@id="block_top_menu"]/ul/li[1]/a
${SELECT_ITEM}      xpath://*[@id="center_column"]/ul/li[2]/div/div[2]/h5/a
${ADD_ITEM_TO_CART}      xpath://*[@id="add_to_cart"]/button/span
${SIGN_OUT}         xpath://*[@id="header"]/div[2]/div/div/nav/div[2]/a
${RETURN_TO_HOMEPAGE}  xpath://*[@id="header_logo"]/a/img