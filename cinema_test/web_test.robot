*** Settings ***

Resource    config/config.robot
Resource    resources/robot/base.robot

Resource    keywords/web_test/auth_keywords/auth_keywords.robot

*** Variables ***


*** Test Cases ***

CT-WEB-AUTH-001
    [Tags]    cadastro    web    valid
    Acessar URL    register
    Checkar se os elementos de cadastro estão visíveis
    ${payload}    Criar Massa de Dados Estática
    Preencher e submeter formulário    ${payload}
    Checkar se os Elementos de Aviso de Sucesso Estão Visíveis    Conta criada com sucesso!
    Close Browser

CT-WEB-AUTH-002
    [Tags]    cadastro    web    invalid
    Acessar URL    register
    Checkar se os elementos de cadastro estão visíveis
    ${payload}=    Criar Massa de Dados Estática


   Preencher e submeter formulário    ${payload}
   Checkar se os Elementos de Aviso de Falha Estão Visíveis    User already exists