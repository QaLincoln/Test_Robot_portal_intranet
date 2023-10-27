*** Settings ***
Resource        ../Configuracao/location.robot
Resource        ../Configuracao/banco.robot
Library         SeleniumLibrary
Library         DatabaseLibrary
Library         String
Library         Collections
Library         OperatingSystem
Library         Dialogs
Library         Process
#Library         RPA.Excel
#Library    RPA.Desktop.Windows
#Library    RPA.Excel.Files


*** Variables ***
${CAMPO_ID}             //input[contains(@class,'form-control input input')]
${CAMPO_CLIENTES}       //input[contains(@aria-controls,'search-client-multiselect-options')]
${CAMPO_CPF}            //input[contains(@aria-controls,'search-cpf-multiselect-options')]
${CAMPO_STATUS}         //input[contains(@aria-controls,'search-status-multiselect-options')]
${CAMPO_DATA_I}         (//input[contains(@class,'reg')])[1]
${CAMPO_DATA_F}         (//input[contains(@class,'reg')])[2]
${APLICAR_FILTRO}       (//button[contains(@type,'button')])[3]
${LIMPAR_FILTRO}        //button[contains(@id,'limpar-filtros')]
#${FECHAR_JANELA}        taskkill /F /IM chrome.exe
${DOWNLOAD_PATH}         C:/Users/quems/Downloads/      # Substitua pelo caminho onde deseja salvar o arquivo
${ARQUIVO_PATH}          C:/Users/quems/Downloads/clients.xlsx
${NAME_FILE}             clients.xlsx    # Substitua pelo nome do arquivo esperado

*** Keywords ***

Executar comando antes do teste
    Então deletar partner_clients
    Então deletar cliente

Executar comando depois do teste
    Então deletar partner_clients
    Então deletar cliente

#Caso de teste 1
E deve consegui filtrar por id
    Sleep    5
    Wait Until Element Is Visible   locator=//span[contains(.,'TesteLincoln')]
    Input Text                      locator=${CAMPO_ID}   text=50000
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=50000
    Click Element                   locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible   locator=//span[contains(.,'TesteLincoln')]
    Sleep    2

#    Run                             ${FECHAR_JANELA}          #Fechar janela do browser quando terminar
#Caso de Teste 2
E deve consegui filtrar por cliente
    Sleep    5
    Click Element                       locator=${CAMPO_CLIENTES}
    Wait Until Element Is Visible       id=search-client-multiselect-option-teste
    Click Element                       id=search-client-multiselect-option-teste
    Click Element                       locator=${APLICAR_FILTRO}
    Sleep    2
    Element Text Should Be              //span[contains(.,'TesteLincoln')]     TESTELINCOLN       #compara se o locator e igual ao texto
    Click Element                       locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible       locator=(//span[contains(.,'326.070.338-21')])[2]
    Sleep    2
#    Run                                 ${FECHAR_JANELA}              #Fechar janela do browser quando terminar
#Caso de Teste 3
E deve consegui filtrar por cpf
    Sleep    5
    Click Element                       locator=${CAMPO_CPF}
    Wait Until Element Is Visible       id=search-cpf-multiselect-option-326.070.338-21
    Click Element                       id=search-cpf-multiselect-option-326.070.338-21
    Click Element                       locator=${APLICAR_FILTRO}
    Sleep    2
    Element Text Should Be              //td[contains(.,'TesteLincoln')]      TESTELINCOLN           #compara se o locator e igual ao texto
    Wait Until Page Contains            text=421.669.263-04
    Click Element                       locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible       locator=//span[contains(.,'TesteLincoln')]
    Sleep    2

#Caso de Teste 4
E deve consegui filtrar por status
    Sleep    5
    Click Element                       ${CAMPO_STATUS}
    Wait Until Element Is Visible       id=search-status-multiselect-option-3
    Click Element                       id=search-status-multiselect-option-3
    Click Element                       locator=${APLICAR_FILTRO}
    Sleep    2
    Element Text Should Be              (//td[contains(.,'ACEITO')])[4]      ACEITO           #compara se o locator e igual ao texto
    Wait Until Page Contains            text=ACEITO
    Click Element                       locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible       locator=//span[contains(.,'TesteLincoln')]
    Sleep    2
#Caso de Teste 5
E deve consegui filtrar por datas
    Sleep    5
    Click Element                       locator=${CAMPO_DATA_I}
    Click Element                       locator=//div[@class='dp__month_year_select'][contains(.,'out.')]                         #Calendario mês
    Click Element                       locator=//div[@class='dp__overlay_cell dp__overlay_cell_pad'][contains(.,'set.')]         #Escolher mês
    Click Element                       locator=//div[@class='dp__cell_inner dp__pointer dp__date_hover'][contains(.,'24')]       #Escolher dia
    Click Element                       locator=${CAMPO_DATA_F}
    Click Element                       locator=//div[@class='dp__month_year_select'][contains(.,'out.')]
    Click Element                       locator=//div[@class='dp__overlay_cell dp__overlay_cell_pad'][contains(.,'set.')]
    Click Element                       locator=//div[@class='dp__cell_inner dp__pointer dp__date_hover'][contains(.,'24')]
    Click Element                       locator=${APLICAR_FILTRO}
    Sleep    2
    Element Text Should Be              //span[contains(.,'24/09/2023')]      24/09/2023           #compara se o locator e igual ao texto
    Wait Until Page Contains            text=ACEITO
    Click Element                       locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible       locator=//span[contains(.,'TesteLincoln')]
    Sleep    2

#Caso de teste 7
Então deve consegui exporta arquivo   #Diretorio windons
    Sleep    2
    Click Element           locator=//button[@class='btn btn-secondary'][contains(.,'Exportar para Excel')]
    Sleep    2
    File Should Exist           ${ARQUIVO_PATH}
    ${status1}    Run Process    python    excel.py
    ${status2}    Should Exist                ${ARQUIVO_PATH}
    Log     O arquivo clients.xlsx existe na pasta




#    Run                                 ${FECHAR_JANELA}              #Fechar janela do browser quando terminar
#Contar linha da tabela 1 pagina
#    ${elementos}    Get WebElements    //table//tr
#    ${quantidade}    Get Length    ${elementos}
#    Log    Total de elementos na tabela: ${quantidade}

#run keyword And continue On failure
#pass execute if ${variavel}    message= texto a colocar