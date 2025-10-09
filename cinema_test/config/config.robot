*** Settings ***

Library    RequestsLibrary
Library    Collections
Library    FakerLibrary
Library    OperatingSystem
Library    JSONLibrary
Library    String
Library    Browser



*** Variables ***

${BASEURL}    http://localhost:4173/api/v1
${BASEURLWEB}    http://localhost:4173/

*** Keywords ***

Importar JSON estático
    [Arguments]    ${nome_arquivo}
    ${data}=     Load JSON From File    ${EXECDIR}/resources/json/${nome_arquivo}
    RETURN    ${data}
