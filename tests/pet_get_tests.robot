*** Settings ***
Library    RequestsLibrary
Resource    ../variables/common_variables.robot
Resource    ../keywords/pet_keywords.robot


*** Test Cases ***
Find Pet By Id
    Create Petstore Session
    ${resp}=     Get Pet By Id    ${PET_ID}
    Verify Pet Response    ${resp}    ${PET_ID}    ${PET_NAME}

 Find Available Pets
    Create Session    petstore    ${BASE_URL}
    ${resp}=     Get Pets By Status    ${PET_STATUS_A}
    Verify Pet Status    ${resp}   ${PET_STATUS_A}


Find Pending Pets
    Create Session    petstore    ${BASE_URL}
    ${resp}=     Get Pets By Status    ${PET_STATUS_P}
    Verify Pet Status    ${resp}   ${PET_STATUS_P}


Find Sold Pets
    Create Session    petstore    ${BASE_URL}
    ${resp}=     Get Pets By Status    ${PET_STATUS_S}
    Verify Pet Status    ${resp}   ${PET_STATUS_S}

