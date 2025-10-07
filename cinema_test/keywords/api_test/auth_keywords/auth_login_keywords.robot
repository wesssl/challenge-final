*** Settings ***

Resource    ../../../config/config.robot
Resource    ../../../resources/robot/base.robot
Resource    ../../../resources/robot/token.robot



*** Variables ***


*** Keywords ***

Fazer Login
    [Arguments]    ${testcase}
    ${body}=    Create Dictionary

    ${body}=    Criar DataMass de Login Estático    ${testcase}

    Create Session    CinemaApp    ${BASEURL}
    ${response}=    POST On Session    CinemaApp    /auth/login    json=${body}    expected_status=any
    
    Run Keyword If    '${testcase}' == 'login_valid'     #validação dos testes
    ...    Validar Sucesso No Login    ${response}
    ...  ELSE IF    '${testcase}' != 'login_valid'
    ...    Validar Falha No Login   ${response}
    
Criar DataMass de Login Estático
    [Arguments]    ${testcase}    
    ${json}=       Importar JSON estático    login.json
    ${testcase_data}    Set Variable    ${json["${testcase}"]}

    ${payload_login}=    Create Dictionary    
    ...    email=${testcase_data["email"]}    
    ...    password=${testcase_data["password"]}
    RETURN    ${payload_login}

Validar Sucesso No Login
    [Arguments]    ${response}
    Run Keyword And Continue On Failure     Should Be Equal As Integers    ${response.status_code}    200

Validar Falha No Login
    [Arguments]    ${response}
    Run Keyword And Continue On Failure     Should Be Equal As Integers    ${response.status_code}    400