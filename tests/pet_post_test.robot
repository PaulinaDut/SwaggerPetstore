*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Resource    ../variables/common_variables.robot
Resource    ../keywords/pet_keywords.robot


*** Test Cases ***
Add Pet Test
    Create Petstore Session
    ${resp}=    Add Pet    ${NEW_PET_ID}    ${NEW_PET_NAME}    ${PET_STATUS_A}
    Verify Pet Response    ${resp}    ${NEW_PET_ID}    ${NEW_PET_NAME}


Upload Pet Image Test
    Create Petstore Session
    File Should Exist     ${IMAGE_FILE}
    ${resp}=    Upload Pet Image    ${PET_ID}    ${IMAGE_FILE}    ${METADATA}
    Verify Upload Pet Image Response    ${resp}    ${UPLOAD_SUCCESS_MSG}

