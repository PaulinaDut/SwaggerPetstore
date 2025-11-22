*** Settings ***
Library    RequestsLibrary
Resource    ../variables/common_variables.robot
Resource    ../keywords/pet_keywords.robot


*** Test Cases ***
AddPet
    Create Petstore Session
    ${resp}=    Add Pet    ${NEW_PET_ID}    ${NEW_PET_NAME}    ${PET_STATUS}
    Verify Pet Response    ${resp}    ${NEW_PET_ID}    ${NEW_PET_NAME}