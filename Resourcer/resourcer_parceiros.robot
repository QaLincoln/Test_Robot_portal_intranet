*** Settings ***
Resource        ../Configuracao/location.robot
Resource        ../Configuracao/banco.robot
Library         SeleniumLibrary
Library         DatabaseLibrary
Library         String
Library         Collections
#Force Tags      todos_usuario_intranet


*** Variables ***
#cCAMPOS
${CAMPO_ID}                 //input[@placeholder='Informe ID']
${CAMPO_CNPJ}               //input[contains(@aria-placeholder,'Informe o CNPJ')]
${CAMPO_RAZÃO_SOCIAL}       //input[contains(@aria-placeholder,'Informe a Razão Social')]
${CAMPO_NOME_FANT}          //input[contains(@aria-placeholder,'Informe o Nome')]

#BOTÕES
${APLICAR_FILTRO}       //button[@type='button'][contains(.,'Filtrar')]
${LIMPAR_FILTRO}        //button[@class='btn btn-secondary'][contains(.,'Limpar')]

#URL
${URL_CADASTRO}         http://localhost:8080/intranet-users/create


*** Keywords ***
Executar comando antes do teste
    Então deletar users_intranet
    Quando inserir dados na tabela usuario_intranet

Executar comando depois do teste
    Então deletar users_intranet

#Caso de teste 1
E deve conseguir filtrar por id
    Sleep    2
    Input Text                      locator=${CAMPO_ID}   text=70000
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=70000
    Element Text Should Be          //span[contains(.,'70000')]      70000
    Click Element                   locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible   locator=//span[contains(.,'70000')]

#Caso de teste 2
E deve conseguir filtrar por CNPJ
    Sleep    2
    Input Text                      locator=${CAMPO_CNPJ}    text=032.607.033-88
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=032.607.033-88
    Click Element                   locator=${LIMPAR_FILTRO}

#    Sleep    3
##Caso de teste 3
#E deve conseguir filtrar por permissão
#    Sleep    5
#    Click Element                   locator=//input[contains(@aria-placeholder,'Selecione Permissão')]
#    Click Element                   locator=//li[@class='multiselect-option'][contains(.,'CS')]
#    Click Element                   locator=${APLICAR_FILTRO}
#    Wait Until Page Contains        text=CS
#    Element Text Should Be          //td[contains(.,'CS')]      CS
#    Click Element                   locator=${LIMPAR_FILTRO}
#    #Wait Until Element Is Visible   locator=//td[contains(.,'60000')]
#    Sleep    2
#
