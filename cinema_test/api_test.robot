*** Settings ***

Resource    config/config.robot
Resource    resources/robot/base.robot


Resource    keywords/api_test/auth_keywords/auth_register_keywords.robot
Resource    keywords/api_test/auth_keywords/auth_login_keywords.robot
Resource    keywords/api_test/auth_keywords/auth_me_keywords.robot  


*** Variables ***


*** Test Cases ***

CT-AUTH-001
    [Tags]    register    valid    201
    Criar Novo Usuário    user_valid

CT-AUTH-002
    [Tags]    register    repeated    400
    Criar Novo Usuário    user_repeated

CT-AUTH-003
    [Tags]    login    valid    200
    Fazer Login    login_valid

CT-AUTH-004
    [Tags]    login    invalid    400
    Fazer Login    login_invalid

CT-AUTH-005
    [Tags]    user_info    valid    with_token    200
    Obter Informações do Usuário    token_valid

CT-AUTH-006
    [Tags]    user_info    invalid    without_token    401
    Obter Informações do Usuário    token_invalid

CT-AUTH-007
    [Tags]    user_info    invalid    with_wrong_token    403
    Obter Informações do Usuário    token_wrong


