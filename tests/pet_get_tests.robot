*** Settings ***
Library    RequestsLibrary
Resource    ../variables/common_variables.robot
Resource    ../keywords/pet_keywords.robot


*** Test Cases ***
Find Pet By Id
    Create Petstore Session
    ${resp}=    Get Pet By Id    ${PET_ID}
    Verify Pet Response    ${resp}    ${PET_ID}    ${PET_NAME}
