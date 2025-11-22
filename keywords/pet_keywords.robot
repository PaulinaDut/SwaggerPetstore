*** Settings ***
Library    RequestsLibrary
Resource   ../variables/common_variables.robot

*** Keywords ***
Create Petstore Session
    Create Session    petstore    ${BASE_URL}

Get Pet By Id
    [Arguments]    ${id}
    ${response}=    GET On Session    petstore    /pet/${id}
    [Return]    ${response}

Verify Pet Response
    [Arguments]    ${response}    ${expected_id}    ${expected_name}
    Should Be Equal As Integers    ${response.status_code}    200
    Should Be Equal As Integers    ${response.json()["id"]}    ${expected_id}
    Should Be Equal As Strings     ${response.json()["name"]}    ${expected_name}

Add Pet
    [Arguments]    ${id}    ${name}=${NEW_PET_NAME}    ${status}=${PET_STATUS}
    ${body}=    Create Dictionary    id=${id}    name=${name}    status=${status}
    ${resp}=    POST On Session    petstore    /pet    json=${body}
    [Return]    ${resp}
