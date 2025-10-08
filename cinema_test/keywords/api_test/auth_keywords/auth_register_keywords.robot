*** Settings ***

Resource    ../../../config/config.robot
Resource    ../../../resources/robot/base.robot


*** Variables ***


*** Keywords ***

Criar DataMass de Novo Usuário Dinâmico
    ${NAME}    First Name
    ${EMAIL}        Email
    ${PASSWORD}     Password
    ${DYNAMICPAYLOAD}=    Create Dictionary    
    ...    name=${NAME}    
    ...    email=${EMAIL}    
    ...    password=${PASSWORD}    
    RETURN    ${DYNAMICPAYLOAD}

Criar DataMass de Novo Usuário Estatico
    [Arguments]    ${testcase}    
    ${json}=       Importar JSON estático    user.json
    ${STATICPAYLOAD}    Set Variable    ${json["${testcase}"]}
    RETURN    ${STATICPAYLOAD}

Criar Novo Usuário
    [Arguments]    ${testcase}
    ${dynamic}=    Criar DataMass de Novo Usuário Dinâmico



    ${static}=     Criar DataMass de Novo Usuário Estatico    ${testcase}
    ${body}=    Copy Dictionary    ${dynamic}    #substitui os campos estáticos do json para o body do request, mantendo os dinâmicos (aleatórios)
    Set To Dictionary    ${body}    &{static}

    Log To Console    \nPayload: ${body}

    Create Session    CinemaApp    ${BASEURL}
    ${response}=    POST On Session    CinemaApp    /auth/register    json=${body}    expected_status=any
    
    Run Keyword If    '${testcase}' == 'user_valid'     #validação dos testes
    ...    Validar Sucesso No Cadastro    ${response}
    ...  ELSE IF    '${testcase}' != 'user_valid'
    ...    Validar Falha No Cadastro   ${response}
    
    Log    \nMensagem de status: ${response.json()}    console=True
    Log To Console    Status code: ${response.status_code}

Validar Sucesso No Cadastro
    [Arguments]    ${response}
    Run Keyword And Continue On Failure     Should Be Equal As Integers    ${response.status_code}    201

Validar Falha No Cadastro
    [Arguments]    ${response}
    Run Keyword And Continue On Failure     Should Be Equal As Integers    ${response.status_code}    400