*** Settings ***
Library    RequestsLibrary
Resource    ../variables/common_variables.robot
Resource    ../keywords/pet_keywords.robot


*** Test Cases ***
Negative Test Invalid Status
    Create Session    petstore    https://petstore.swagger.io/v2
    ${resp}=    Get Pets By Status    new
    Verify Invalid Pet Status    ${resp}
