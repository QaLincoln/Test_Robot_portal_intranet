*** Settings ***
Library    SeleniumLibrary
Resource        ../Configuracao/banco.robot
Library         Process
Library         DatabaseLibrary
Library         OperatingSystem

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
${EXPORTAR_EXCEL}           //button[contains(@id,'exportar')]
#ARQUIVO
${DOWNLOAD_PATH}            C:/Users/quems/Downloads/      # Substitua pelo caminho onde deseja salvar o arquivo
${ARQUIVO_PATH}             C:/Users/quems/Downloads/pagamentos.xlsx
${NAME_FILE}                pagamentos.xlsx    # Substitua pelo nome do arquivo esperado


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

Então deve conseguir filtrar por tid
    Sleep    2
    Input Text                      locator=${CAMPO_TID}       text=10462304181049013967
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=10462304181049013967
    Element Text Should Be          //td[contains(.,'10462304181049013967')]     10462304181049013967
    Click Element                   locator=${LIMPAR_FILTRO}
    Sleep   2

Então deve conseguir filtrar por data
      Sleep    5
      Click Element                       locator=${CAMPO_DATA_INIC}
      Click Element                       locator=(//div[contains(@class,'dp__month_year_select')])[1]                            #Calendario mês
      Click Element                       locator=//div[@class='dp__overlay_cell dp__overlay_cell_pad'][contains(.,'abr.')]       #Escolher mês
      Click Element                       locator=//div[@class='dp__cell_inner dp__pointer dp__date_hover'][contains(.,'18')]    #Escolher dia
      Click Element                       ${CAMPO_DATA_FINAL}
      Click Element                       locator=(//div[contains(@class,'dp__month_year_select')])[1]
      Click Element                       locator=//div[@class='dp__overlay_cell dp__overlay_cell_pad'][contains(.,'abr.')]
      Click Element                       locator=//div[@class='dp__cell_inner dp__pointer dp__date_hover'][contains(.,'18')]
      Click Element                       locator=${APLICAR_FILTRO}
      Wait Until Page Contains            text=18/04/2023 - 13:57
      Click Element                       locator=${LIMPAR_FILTRO}
      Wait Until Page Does Not Contain    text=18/04/2023 - 13:57
      Sleep    2

Então deve consegui exportar arquivo   #Diretorio windons
    Sleep    2
    Click Element                       locator=${EXPORTAR_EXCEL}
    Sleep    5
    ${status1}    Run Process    python    excel_historico.py
    ${status2}    Should Exist                ${ARQUIVO_PATH}
    Log     O arquivo pagamentos.xlsx existe na pasta
    Remove File     ${ARQUIVO_PATH}
    File Should Not Exist           ${ARQUIVO_PATH}
    Sleep    3