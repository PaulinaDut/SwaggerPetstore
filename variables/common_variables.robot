*** Variables ***
#GET Find Pet By Id
${BASE_URL}      https://petstore.swagger.io/v2
${PET_ID}        123456
${PET_NAME}      Simona

#POST Add Pet
${NEW_PET_ID}        123456
${NEW_PET_NAME}      Simona
${PET_STATUS_A}    available

#GET Pet By Status
${PET_STATUS_P}    pending
${PET_STATUS_S}    sold

#POST Upload Pet Image
${METADATA}             My test image
${IMAGE_FILE}           ${CURDIR}/resources/images/testimage.jpg
${UPLOAD_SUCCESS_MSG}   File uploaded