*** Settings ***

Resource    config/config.robot
Resource    resources/robot/base.robot


Resource    keywords/api_test/auth_keywords/auth_register_keywords.robot
Resource    keywords/api_test/auth_keywords/auth_login_keywords.robot
Resource    keywords/api_test/auth_keywords/auth_me_keywords.robot  
Resource    keywords/api_test/movies_keywords/movies_keywords.robot
Resource    keywords/api_test/sessions_keywords/sessions_keywords.robot
Resource    keywords/api_test/reservations_keywords/reservations_keywords.robot


*** Variables ***


*** Test Cases ***

CT-AUTH-001
    [Tags]    auth    prioridade_alta    register    201
    Criar Novo Usuário    user_valid

CT-AUTH-002
    [Tags]    auth    register    400
    Criar Novo Usuário    user_repeated

CT-AUTH-003
    [Tags]    auth    prioridade_alta    login    200
    Fazer Login    login_valid

CT-AUTH-004
    [Tags]    auth    login    400
    Fazer Login    login_invalid

CT-AUTH-005
    [Tags]    auth    me    200
    Obter Informações do Usuário    token_valid

CT-AUTH-006
    [Tags]    auth    me   401
    Obter Informações do Usuário    token_notoken

CT-AUTH-007
    [Tags]    auth    403
    Obter Informações do Usuário    token_wrong


CT-MOVIES-001
    [Tags]    movies    prioridade_alta    200
    Obter Informações de Filmes

CT-MOVIES-006
    [Tags]    movies    prioridade_alta    200
    Obter Informação de Filme por ID    68d7221901f2a8b02b208588

CT-SESSIONS-001
    [Tags]    sessions    prioridade_alta    200
    Obter Informações de Sessões

CT-SESSIONS-008
    [Tags]    sessions    prioridade_alta    200
    Obter Informação de Sessão por ID    68d7221901f2a8b02b208588

 CT-RESERVATIONS-002
    [Tags]    reservations    prioridade_alta    200
    Criar Nova Reserva   reservations01

CT-RESERVATIONS-003
    [Tags]    reservations    prioridade_alta    200
    Criar Nova Reserva   reservations02