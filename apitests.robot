*** Settings ***
Documentation    Automate API responses for pet store
Library  RequestsLibrary
Library  JSONLibrary
Library  BuiltIn
Library  Collections

*** Test Cases ***
Get pets with status available
   [Documentation]  This test should get pets by status
   Create Session  My session    https://petstore.swagger.io/v2  verify=true
   ${response}=  GET On Session  My session  /pet/findByStatus?    params=status=available
   Status Should Be    200   ${response}

Get pets with status pending
   [Documentation]  This test should get pets by status
   Create Session  My session    https://petstore.swagger.io/v2  verify=true
   ${response}=  GET On Session  My session  /pet/findByStatus?    params=status=pending
   Status Should Be    200   ${response}

Get pets with status pending
   [Tags]  lanre
   [Documentation]  This test should get pets by status
   Create Session  My session    https://petstore.swagger.io/v2  verify=true
   ${response}=  GET On Session  My session  /pet/findByStatus?    params=status=
   Status Should Be    200   ${response}

Create a pet in pet store
   #[Tags]  lanre
   [Documentation]  This test should get pets by status
   ${body}=  Create Dictionary  id=0  name=monkey  status=available
   ${response}=  POST  https://petstore.swagger.io/v2/pet  json=${body}
   Log To Console    ${response}
   Status Should Be    200   ${response}

Update a pet
   #[Tags]  lanre
   [Documentation]  This test should get pets by status
   ${body}=  Create Dictionary  id=9223372036854775807  name=dog  status=available
   ${response}=  PUT  https://petstore.swagger.io/v2/pet  json=${body}
   Log To Console    ${response}
   Status Should Be    200   ${response}

Delete a pet
   #[Tags]  lanre
   [Documentation]  This test should get pets by status
   #Create Session  My session    https://petstore.swagger.io/v2  verify=true
   ${response}=  DELETE   https://petstore.swagger.io/v2/pet/9223372036854775807
   Status Should Be    200   ${response}
