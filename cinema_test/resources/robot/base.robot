*** Settings ***

Library    Browser
Resource    ../../config/config.robot

*** Variables ***


*** Keywords ***


Acessar URL
    [Arguments]     ${url}=
    New Browser     browser=chromium    headless=false

    New Page        ${BASEURLWEB}${url}
