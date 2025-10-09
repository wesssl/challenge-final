*** Settings ***

Resource    ../../../config/config.robot
Resource    ../../../resources/robot/base.robot
Resource    ../../../resources/robot/token.robot




*** Variables ***


*** Keywords ***

Obter Informações do Usuário
    [Arguments]    ${testcase}

    ${BEARER}=    Set Variable    ''


    IF    '${testcase}' == 'token_valid'
        ${BEARER}=    Gerar Novo Token
    ELSE IF    '${testcase}' == 'token_wrong'
        ${BEARER}=    Set Variable    Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4ZTU2YWY5OTVmMDVjMTY5NGQ5NTY4YyIsImlhdCI6MTc2MDAzODk2MSwiZXhwIjoxNzYwMTI1MzYxfQ.jhaVhMuWOnN0WeNS3V_YVd6F-prsCj8euouz2LN2GP6
    ELSE IF     '${testcase}' == 'token_notoken'
        ${BEARER}=    Set Variable    ''
    END

    Create Session    CinemaApp    ${BASEURL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${BEARER}
    ${response}=    GET On Session        CinemaApp    /auth/me    headers=${headers}    expected_status=any
    Run Keyword If    '${testcase}' == 'token_valid'     #validação dos testes
    ...    Validar Sucesso na Requisição    ${response}
    ...  ELSE IF    '${testcase}' == 'token_notoken'
    ...    Validar Falha 401 na Requisição   ${response}
    ...  ELSE IF    '${testcase}' == 'token_wrong'
    ...    Validar Falha 403 na Requisição   ${response}
    
    Log    \nMensagem de status: ${response.json()}    console=True
    Log To Console    Status code: ${response.status_code}


Validar Sucesso na Requisição
    [Arguments]    ${response}
    Run Keyword And Continue On Failure     Should Be Equal As Integers    ${response.status_code}    200

Validar Falha 401 na Requisição
    [Arguments]    ${response}
    Run Keyword And Continue On Failure     Should Be Equal As Integers    ${response.status_code}    401
 
 Validar Falha 403 na Requisição
    [Arguments]    ${response}
    Run Keyword And Continue On Failure     Should Be Equal As Integers    ${response.status_code}    403