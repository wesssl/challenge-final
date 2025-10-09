*** Settings ***

Resource    ../../../config/config.robot
Resource    ../../../resources/robot/base.robot
Resource    ../../../resources/robot/token.robot

*** Variables ***


*** Keywords ***


Escolher a Sessão
    [Arguments]    ${sessao}
 
    ${json_data}=    Importar JSON estático    reservations.json
    ${session_info}=    Get From Dictionary    ${json_data}    ${sessao}
    ${id}=    Get From Dictionary    ${session_info}    session
    RETURN    ${id}
 
Criar Payload da Reserva
    [Arguments]    ${testcase}
    ${letters}=    Create List    A    B    C    D    E    F    G
    ${randomrow}=    Evaluate    random.choice(${letters})    random

    ${randomnumber}=    Evaluate    random.randint(1, 8)    random

    ${id}=    Escolher a Sessão    ${testcase}

    &{seat_details}=    Create Dictionary    row=${randomrow}    number=${randomnumber}    type=full
    @{seats}=    Create List    ${seat_details}
    &{payload}=    Create Dictionary
    ...    session=${id}
    ...    seats=${seats}
    ...    paymentMethod=credit_card
    RETURN    ${payload}

Criar Payload Estático da Reserva
    [Arguments]    ${testcase}
    ${json_data}=    Importar JSON estático    reservations.json
    ${payload}=    Get From Dictionary    ${json_data}    ${testcase}
    RETURN    ${payload}

Validar Sucesso na Requisição
    [Arguments]    ${response}
    Run Keyword And Continue On Failure     Should Be Equal As Integers    ${response.status_code}    201

Validar Falha na Requisição
    [Arguments]    ${response}
    ${status_code}=    Convert To Integer    ${response.status_code}
    Run Keyword And Continue On Failure    Should Be Equal As Integers   ${response.status_code}    400


Criar Nova Reserva
    [Arguments]    ${testcase}
    
    IF    '${testcase}' == 'reservations01'
        ${body}=    Criar Payload da Reserva    ${testcase}
    ELSE IF    '${testcase}' == 'reservations02'
        ${body}=    Criar Payload Estático da Reserva    ${testcase}

    END

    Log To Console    \nPayload: ${body}
    
    
    Create Session    CinemaApp    ${BASEURL}

    ${BEARER}=    Gerar Novo Token
    ${headers}=    Create Dictionary    Authorization=Bearer ${BEARER}
    ${response}=    POST On Session    CinemaApp    /reservations    json=${body}    headers=${headers}    expected_status=any

    Run Keyword If   '${testcase}' == 'reservations01'
    ...    Validar Sucesso na Requisição    ${response}
    ...    ELSE IF    '${testcase}' == 'reservations02'
    ...    Validar Falha na Requisição    ${response}