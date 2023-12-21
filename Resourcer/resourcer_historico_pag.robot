*** Settings ***
Library    SeleniumLibrary
Resource        ../Configuracao/banco.robot

*** Variables ***
${CAMPO_ID_PAG}             (//input[contains(@placeholder,'Informe ID')])[1]
${CAMPO_ID_CLIENTE}         (//input[contains(@placeholder,'Informe ID')])[2]
${CAMPO_CLIENTE}            //input[contains(@aria-placeholder,'Selecione o cliente')]
${CAMPO_STATUS}             (//input[@aria-placeholder='Selecione'])[1]
${CAMPO_METODO}             (//input[@aria-placeholder='Selecione'])[2]
${CAMPO_TID}                //input[contains(@placeholder,'Informe o código')]
${CAMPO_DATA_INIC}          (//input[contains(@placeholder,'DD/MM/AAAA')])[1]
${CAMPO_DATA_FINAL}         (//input[@placeholder='DD/MM/AAAA'])[2]
${APLICAR_FILTRO}           //button[@type='button'][contains(.,'Filtrar')]
${LIMPAR_FILTRO}            //button[@class='btn btn-secondary btn-responsive w-100'][contains(.,'Limpar')]
${URL_PARCEIROS}            http://localhost:8080/partners

*** Keywords ***

#Caso de teste 1
Então deve conseguir filtrar por id_pagamento
    Sleep    3
    Input Text                      locator=${CAMPO_ID_PAG}    text=5
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=5
    Element Text Should Be          (//td[contains(.,'5')])[1]     5
    Click Element                   locator=${LIMPAR_FILTRO}
    Sleep   2

#Caso de teste 2
 Então deve conseguir filtrar por id_cliente
    Sleep    3
    Input Text                      locator=${CAMPO_ID_CLIENTE}    text=2
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=2
    Element Text Should Be          (//td[contains(.,'2')])[1]     2
    Click Element                   locator=${LIMPAR_FILTRO}
    Sleep   2

Então deve conseguir filtrar por cliente
    Sleep    3
    Input Text                      locator=${CAMPO_CLIENTE}    text=GUILHERME MEDEIROS BECCO 930.055.553-72
    Click Element                   locator=//span[contains(.,'GUILHERME MEDEIROS BECCO 930.055.553-72')]
    Sleep    2
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=GUILHERME MEDEIROS BECCO
    Element Text Should Be          //td[contains(.,'GUILHERME MEDEIROS BECCO')]     GUILHERME MEDEIROS BECCO
    Click Element                   locator=${LIMPAR_FILTRO}
    Sleep   2

Então deve conseguir filtrar por status
    Sleep    3
    Input Text                      locator=${CAMPO_STATUS}         text=Pago
    Click Element                   locator=//li[contains(.,'Pago')]
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=Pago
    Element Text Should Be          //span[@class='status-container text-green'][contains(.,'Pago')]     Pago
    Click Element                   locator=${LIMPAR_FILTRO}
    Sleep   2

Então deve conseguir filtrar por método
    Sleep    2
    Click Element                   locator=${CAMPO_METODO}
    Click Element                   locator=//li[contains(.,'3DS')]
    Click Element                   locator=${CAMPO_ID_PAG}
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=3DS
    Element Text Should Be          (//td[contains(.,'3DS')])[1]     3DS
    Click Element                   locator=${LIMPAR_FILTRO}
    Sleep   2

##falta TID e Datas