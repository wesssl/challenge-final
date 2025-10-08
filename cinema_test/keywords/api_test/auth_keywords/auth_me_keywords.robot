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
    ELSE IF    '${testcase}' == 'token_valid'
        ${BEARER}=    Set Variable    '34u83873894'
    END

    Create Session    CinemaApp    ${BASEURL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${BEARER}
    ${response}=    GET On Session        CinemaApp    /auth/me    headers=${headers}    expected_status=any
    Run Keyword If    '${testcase}' == 'token_valid'     #validação dos testes
    ...    Validar Sucesso na Requisição    ${response}
    ...  ELSE IF    '${testcase}' != 'token_valid'
    ...    Validar Falha na Requisição   ${response}
    
    Log    \nMensagem de status: ${response.json()}    console=True
    Log To Console    Status code: ${response.status_code}


Validar Sucesso na Requisição
    [Arguments]    ${response}
    Run Keyword And Continue On Failure     Should Be Equal As Integers    ${response.status_code}    200

Validar Falha na Requisição
    [Arguments]    ${response}
    ${status_code}=    Convert To Integer    ${response.status_code}
    Run Keyword And Continue On Failure    Should Be True    ${status_code} in [400, 401]