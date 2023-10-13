*** Settings ***
Resource        ../Configuracao/location.robot
Library         SeleniumLibrary
Library         DatabaseLibrary
Library         String
Library         Collections
#Force Tags      todos_usuario_intranet


*** Variables ***
${CAMPO_ID}             //input[contains(@placeholder,'Informe o ID')]
${APLICAR_FILTRO}       //button[contains(.,'Aplicar filtros')]
${LIMPAR_FILTRO}        //button[contains(.,'Limpar filtros')]

*** Keywords ***


#Caso de teste 1
E deve consegui filtrar por id
    Sleep    5
    Input Text                      locator=${CAMPO_ID}   text=4000
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=4000
    Sleep    2
    Click Element                   locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible   locator=//td[contains(.,'TESTE_LINCOLN')]
    Sleep    2