*** Settings ***
Documentation    Suite description
Library  RequestsLibrary
Library  Collections

*** Variables ***
${baseURL}     http://restapi.demoqa.com
${baseAPI_URL}     https://reqres.in/
${City}        Hyderabad
${Page}        2


*** Test Cases ***
TestCase1: Verify GET_City_Details
    [Documentation]  Verify GET_City_Details
    [Tags]  GET_City_Details
    [Setup]
    GET_City_Details

TestCase2: Verify GET_List_of_Users
    [Documentation]  Verify GET_List_of_Users
    [Tags]  GET_List_of_Users
    [Setup]
    GET_List_of_Users

TestCase3: Verify GET_Single_Users_detail
    [Documentation]  Verify GET_Single_Users_detail
    [Tags]  GET_Single_Users_detail
    [Setup]
    GET_Single_Users_detail


TestCase4: Verify GET_Single_Users_NOT_Found
    [Documentation]  Verify GET_Single_Users_NOT_Found
    [Tags]  GET_Single_Users_NOT_Found
    [Setup]
    GET_Single_Users_NOT_Found



*** Keywords ***
GET_City_Details
    create session  mysession   ${baseURL}
    ${response}    get request  mysession  /utilities/weather/city/${City}
    #log to console  ${response.status_code}
    #log to console  ${response.content}
    #log to console  ${response.headers}

    #Validation
    ${status_code} =  convert to string  ${response.status_code}
    should be equal  ${status_code}   200

    ${body} =  convert to string  ${response.content}
    should contain  ${body}   Hyderabad

    ${contentTypeValue} =  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${contentTypeValue}   application/json
    delete all sessions

GET_List_of_Users
    create session  mysession  ${baseAPI_URL}
    ${response_ListUsers}     get request   mysession  /api/users?page=/${Page}
    #log to console  ${response_ListUsers.status_code}
    #log to console  ${response_ListUsers.content}
    #log to console  ${response_ListUsers.headers}

    #Validation
    ${status_code} =  convert to string  ${response_ListUsers.status_code}
    should be equal  ${status_code}   404

    #${body} =   convert to string  ${response_ListUsers.content}
    #should contain  ${body}   Lawson

    ${contentTypeValue} =  get from dictionary  ${response_ListUsers.headers}  Content-Type
    should be equal  ${contentTypeValue}   text/html; charset=utf-8

    ${ServerName} =  get from dictionary  ${response_ListUsers.headers}  server
    should be equal  ${ServerName}   cloudflare


GET_Single_Users_detail


GET_Single_Users_NOT_Found


