*** Settings ***

Resource    ../../config/config.robot

*** Variables ***

${TOKEN}    

*** Keywords ***

Gerar Novo Token
    Create Session    CinemaApp    ${BASEURL}
    ${body}=    Create Dictionary    email=example@example.com    password=password123
    ${response}=    POST On Session    CinemaApp    /auth/login    json=${body}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    ${authorization}=    Set Variable    ${json['data']['token']}
    ${TOKEN}=    Set Variable    ${authorization}
    RETURN    ${TOKEN}

Log do Bearer Token
    ${TOKEN}    Gerar Novo Token
    Log To Console    ${TOKEN}

