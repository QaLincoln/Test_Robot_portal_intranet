*** Settings ***
Resource        ../Configuracao/location.robot
Library         SeleniumLibrary
Library         DatabaseLibrary
Library         String
Library         Collections

#Force Tags      todos_cadastro_Clientes

#Library         OperatingSystem

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

*** Keywords ***


#Caso de teste 1
E deve consegui filtrar por id
    Sleep    5
    Input Text                      locator=${CAMPO_ID}   text=300
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=3000
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










#    Run                                 ${FECHAR_JANELA}              #Fechar janela do browser quando terminar
#Contar linha da tabela 1 pagina
#    ${elementos}    Get WebElements    //table//tr
#    ${quantidade}    Get Length    ${elementos}
#    Log    Total de elementos na tabela: ${quantidade}

#run keyword And continue On failure
#pass execute if ${variavel}    message= texto a colocar