*** Settings ***
Library    RequestsLibrary
Resource   ../variables/common_variables.robot
Library    OperatingSystem

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

Get Pets By Status
    [Arguments]    ${status}
    &{params}=     Create Dictionary    status=${status}
    ${response}=    GET On Session    petstore    /pet/findByStatus    params=${params}
    [Return]        ${response}

Verify Pet Status
    [Arguments]    ${response}    ${expected_status}
    Should Be Equal As Integers    ${response.status_code}    200
    @{pets}=    Set Variable    ${response.json()}
    Should Not Be Empty    ${pets}
    FOR    ${pet}    IN    @{pets}
        Log To Console    Checking pet id: ${pet["id"]}, status=${pet["status"]}
        Should Be Equal As Strings    ${pet["status"]}    ${expected_status}
    END

Verify Invalid Pet Status
    [Arguments]    ${response}
    Should Be Equal As Integers    ${response.status_code}    200
    @{pets}=    Set Variable    ${response.json()}
    Should Be Empty    ${pets}

Upload Pet Image
    [Arguments]    ${pet_id}    ${file_path}    ${metadata}
    ${files}=    Create Dictionary    file=@${file_path}
    ${data}=     Create Dictionary    additionalMetadata=${metadata}
    ${response}=    POST On Session    petstore    /pet/${pet_id}/uploadImage
    ...    files=${files}
    ...    data=${data}
    RETURN    ${response}

Verify Upload Pet Image Response
    [Arguments]    ${response}    ${expected_message_part}=File uploaded
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    To Json    ${response.content}
    Should Be Equal As Integers    ${body["code"]}    200
    Should Contain                 ${body["message"]}    ${expected_message_part}
    Log To Console                 Response message: ${body["message"]}

