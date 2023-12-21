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
#BOTÔES
${APLICAR_FILTRO}       //button[contains(.,'Filtrar')]
${LIMPAR_FILTRO}        //button[contains(.,'Limpar')]
${EXPORTAR_EXCEL}       //button[contains(.,'Exportar')]

#CAMPOS
${CAMPO_ID}             //input[contains(@placeholder,'INFORME O ID')]
${CAMPO_CLIENTES}       //input[@aria-placeholder='SELECIONE O CLIENTE']
${CAMPO_CPF}            //input[contains(@aria-placeholder,'Selecione o CPF')]
${CAMPO_STATUS}         //input[contains(@aria-placeholder,'SELECIONE O STATUS')]
${CAMPO_DATA_I}         (//input[contains(@class,'reg')])[1]
${CAMPO_DATA_F}         (//input[contains(@class,'reg')])[2]
${CAMPO_PARCEIRO}       //input[contains(@aria-placeholder,'SELECIONE O PARCEIRO')]

#SELEÇAO
${LIST_LOJATESTE}        //li[contains(.,'LOJA_TESTE')]


#ARQUIVO
${DOWNLOAD_PATH}         C:/Users/quems/Downloads/      # Substitua pelo caminho onde deseja salvar o arquivo
${ARQUIVO_PATH}          C:/Users/quems/Downloads/clientes.xlsx
${NAME_FILE}             clientes.xlsx    # Substitua pelo nome do arquivo esperado

*** Keywords ***

Executar comando antes do teste
    Então deletar partner_clients
    Então deletar partners
    Então deletar cliente
    Então deletar partners
    Quando inserir Dados na tabela clientes      #Cria um cliente no banco
    Quando inserir dados na tabela partners
    Quando inserir tabela partner_clients


Executar comando depois do teste
    Então deletar partner_clients
    Então deletar partners
    Então deletar cliente

#Caso de teste 1
E deve consegui filtrar por id
    Wait Until Element Is Visible   locator=//span[@class='h2 d-block mb-0 titulo'][contains(.,'Clientes')]
    Input Text                      locator=${CAMPO_ID}   text=50000
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=50000
    Click Element                   locator=${LIMPAR_FILTRO}
    Sleep    2
    Wait Until Element Is Visible       locator=//td[contains(.,'TesteLincoln')]

#Caso de Teste 2
E deve consegui filtrar por cliente
    Sleep    2
    Click Element                       locator=${CAMPO_CLIENTES}
    Wait Until Element Is Visible       locator=//li[contains(.,'TesteLincoln')]
    Click Element                       locator=//li[contains(.,'TesteLincoln')]
    Click Element                       locator=${APLICAR_FILTRO}
    Sleep    2
    Element Text Should Be              //span[contains(.,'TesteLincoln')]     TESTELINCOLN       #compara se o locator e igual ao texto
    Click Element                       locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible       locator=(//span[contains(.,'326.070.338-21')])[2]

#Caso de Teste 3
E deve consegui filtrar por cpf
    Sleep    2
    #Click Element                       locator=${CAMPO_CPF}
    Input Text                          locator=${CAMPO_CPF}    text=326.070.338-21
    Click Element                       locator=(//span[contains(.,'326.070.338-21')])[2]                   #    Click Element                       locator=${APLICAR_FILTRO}
    Click Element                       locator=${APLICAR_FILTRO}
    Wait Until Page Contains            text=326.070.338-21
    Element Text Should Be              //td[contains(.,'TesteLincoln')]      TESTELINCOLN           #compara se o locator e igual ao texto
    Click Element                       locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible       locator=//td[contains(.,'TesteLincoln')]

#Caso de Teste 4
E deve consegui filtrar por status
    Sleep    2
    Click Element                       ${CAMPO_STATUS}
    Click Element                       locator=//li[contains(.,'Aceitos')]
    Click Element                       locator=${CAMPO_ID}
    Click Element                       locator=${APLICAR_FILTRO}
    Sleep    1
    #Element Text Should Be              (//td[contains(.,'ACEITO')])[4]      ACEITO           #compara se o locator e igual ao texto
    Wait Until Page Contains            text=Aceito
    Click Element                       locator=${LIMPAR_FILTRO}
    Wait Until Page Contains             text=TesteLincoln

#Caso de Teste 5
E deve consegui filtrar por datas
    Sleep    5
    Click Element                       locator=${CAMPO_DATA_I}
    Click Element                       locator=(//div[contains(@class,'dp__month_year_select')])[1]                            #Calendario mês
    Click Element                       locator=//div[@class='dp__overlay_cell dp__overlay_cell_pad'][contains(.,'set.')]       #Escolher mês
    Click Element                       locator=//div[@class='dp__cell_inner dp__pointer dp__date_hover'][contains(.,'24')]     #Escolher dia
    Click Element                       locator=${CAMPO_DATA_F}
    Click Element                       locator=(//div[contains(@class,'dp__month_year_select')])[1]
    Click Element                       locator=//div[@class='dp__overlay_cell dp__overlay_cell_pad'][contains(.,'set.')]
    Click Element                       locator=//div[@class='dp__cell_inner dp__pointer dp__date_hover'][contains(.,'24')]
    Click Element                       locator=${APLICAR_FILTRO}
    Sleep    2
    #Element Text Should Be              //span[contains(.,'24/09/2023')]      24/09/2023           #compara se o locator e igual ao texto
    Wait Until Page Contains            text=24/09/2023
    Click Element                       locator=${LIMPAR_FILTRO}
    Wait Until Page Does Not Contain    text=24/09/2023
    Sleep    2

#Caso de teste 7
Então deve consegui exporta arquivo   #Diretorio windons
    Sleep    2
    Click Element                       locator=${EXPORTAR_EXCEL}
    Sleep    1
    #File Should Exist           ${ARQUIVO_PATH}
    ${status1}    Run Process    python    excel.py
    ${status2}    Should Exist                ${ARQUIVO_PATH}
    Log     O arquivo clients.xlsx existe na pasta
    Remove File     ${ARQUIVO_PATH}
    File Should Not Exist           ${ARQUIVO_PATH}
    Sleep    3
    

#Caso de teste 8
E deve consegui filtrar por parceiro
    Click Element                        locator=${CAMPO_PARCEIRO}
#    Click Element                        locator=${LIST_LOJATESTE}
#    Click Element                        locator=${APLICAR_FILTRO}
#    Wait Until Element Is Visible        locator=//td[contains(.,'LOJA_TESTE')]
#    Element Text Should Be              //td[contains(.,'LOJA_TESTE')]      LOJA_TESTE

#    Run                                 ${FECHAR_JANELA}              #Fechar janela do browser quando terminar
#Contar linha da tabela 1 pagina
#    ${elementos}    Get WebElements    //table//tr
#    ${quantidade}    Get Length    ${elementos}
#    Log    Total de elementos na tabela: ${quantidade}

#run keyword And continue On failure
#pass execute if ${variavel}    message= texto a colocar