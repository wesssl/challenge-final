*** Settings ***

Resource    ../../../config/config.robot
Resource    ../../../resources/robot/base.robot



*** Variables ***


*** Keywords ***

Criar Massa de Dados Estática
    ${NAME}    Set Variable    Wes Lima
    ${EMAIL}    Set Variable    email@email.com
    ${PASSWORD}    Set Variable    teste123
    ${payload}    Create Dictionary    name=${NAME}    email=${EMAIL}    password=${PASSWORD}
    RETURN    ${payload}

Criar Massa de Dados Dinâmica
    ${NAME}    FakerLibrary.Name
    ${EMAIL}    FakerLibrary.Email
    ${PASSWORD}    FakerLibrary.Password
    ${payload}    Create Dictionary    name=${NAME}    email=${EMAIL}    password=${PASSWORD}
    RETURN    ${payload}

Preencher e submeter formulário
    [Arguments]     ${payload}
    Fill Text    xpath=//*[@id="name"]    ${payload}[name]
    Fill Text    xpath=//*[@id="email"]     ${payload}[email]
    Fill Text    xpath=//*[@id="password"]     ${payload}[password]
    Fill Text    xpath=//*[@id="confirmPassword"]     ${payload}[password]
    Click        xpath=//*[@type="submit"]
    Sleep    5s



Checkar se os elementos de cadastro estão visíveis
    Wait For Elements State    xpath=//h1[text()='Cadastro']    visible    2
    Get Text    xpath=//h1[text()='Cadastro']    equals    Cadastro


Checkar se os Elementos de Aviso de Sucesso Estão Visíveis
    [Arguments]     ${aviso}
    ${element}    Set Variable    xpath=//div[text()='Conta criada com sucesso!']
    Wait For Elements State    ${element}   visible    3
    Get Text                   ${element}    equals     Conta criada com sucesso!

Checkar se os Elementos de Aviso de Falha Estão Visíveis
    [Arguments]     ${aviso}
    ${element}    Set Variable    xpath=//div[text()='User already exists']
    Wait For Elements State    ${element}   visible    3
    Get Text                   ${element}    equals     User already exists
