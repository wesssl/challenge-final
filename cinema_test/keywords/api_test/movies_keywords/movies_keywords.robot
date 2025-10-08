*** Settings ***

Resource    ../../../config/config.robot
Resource    ../../../resources/robot/base.robot
Resource    ../../../resources/robot/token.robot




*** Variables ***


*** Keywords ***

Obter Informações de Filmes

    Create Session    CinemaApp    ${BASEURL}
    ${response}    GET On Session    CinemaApp    /movies    expected_status=any
    Validar Sucesso na Requisição    ${response}
    Validar se Response é JSON    ${response}

Obter Informação de Filme por ID
    [Arguments]    ${id}
    Create Session    CinemaApp    ${BASEURL}
    ${response}    GET On Session    CinemaApp    /movies/${id}    expected_status=any
    Validar Sucesso na Requisição    ${response}
    Validar se Response é JSON    ${response}

Validar Sucesso na Requisição
    [Arguments]    ${response}
    Run Keyword And Continue On Failure     Should Be True    ${response.status_code}    [200]

Validar Falha na Requisição
    [Arguments]    ${response}
    ${status_code}=    Convert To Integer    ${response.status_code}
    Run Keyword And Continue On Failure    Should Be True    ${response.status_code} in [400]

Validar se Response é JSON
    [Arguments]    ${response}
    Evaluate    json.loads('''${response.content}''')    json