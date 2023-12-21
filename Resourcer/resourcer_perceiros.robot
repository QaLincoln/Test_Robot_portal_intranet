*** Settings ***
Library    SeleniumLibrary
Resource        ../Configuracao/banco.robot
#Suite Setup     Set Screenshot Directory  NONE
#Force Tags      todos_dashboard


*** Variables ***
${CAMPO_ID}             //input[@placeholder='Informe ID']
${CAMPO_CNPJ}           //input[contains(@aria-placeholder,'Informe o CNPJ')]
${CAMPO_R_SOCIAL}       //input[contains(@aria-placeholder,'Informe a Razão Social')]
${CAMPO_N_FANTASIA}     //input[contains(@aria-placeholder,'Informe o Nome Fantasia')]
${APLICAR_FILTRO}       //button[@type='button'][contains(.,'Filtrar')]
${LIMPAR_FILTRO}        //button[@class='btn btn-secondary'][contains(.,'Limpar')]
${URL_PARCEIROS}        http://localhost:8080/partners

*** Keywords ***
Executar comando antes do teste
#    Então deletar partners_clients
    Então deletar partners
    Quando inserir dados na tabela partners

Executar comando depois do teste
    Então deletar partners_clients
    Então deletar partners

#Caso de teste 1
E deve conseguir filtrar por id
    Sleep    3
    Input Text                      locator=${CAMPO_ID}   text=70000
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=70000
    Element Text Should Be          //td[contains(.,'70000')]      70000
    Sleep    2
    Click Element                   locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible   locator=//td[contains(.,'70000')]
    Sleep    2

#Caso de teste 2
E deve conseguir filtrar por CNPJ
    Wait Until Element Is Visible    locator=${CAMPO_CNPJ}
    Input Text                      locator=${CAMPO_CNPJ}    text=03.260.703/3881-11
    Click Element                   locator=//li[contains(.,'03.260.703/3881-11')]
    sleep   1
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=03.260.703/3881-11
    Element Text Should Be          (//td[contains(.,'03.260.703/3881-11')])[1]      03.260.703/3881-11
    Sleep    1
    Click Element                   locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible   locator=//td[contains(.,'70000')]
    Sleep    2

#Caso de teste 3
E deve conseguir filtrar por Razão Social
    Wait Until Element Is Visible    locator=${CAMPO_R_SOCIAL}
    Input Text                       locator=${CAMPO_R_SOCIAL}    text=EMPRESA_TESTE
    Click Element                    locator=//li[contains(.,'EMPRESA_TESTE')]
    sleep   1
    Click Element                    locator=${APLICAR_FILTRO}
    Wait Until Page Contains         text=EMPRESA_TESTE
    Element Text Should Be           (//td[contains(.,'EMPRESA_TESTE')])[1]      EMPRESA_TESTE
    Sleep    1
    Click Element                    locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible    locator=//td[contains(.,'70000')]
    Sleep    2

#Caso de teste 4
E deve conseguir filtrar por Nome Fantasia
    Sleep    2
    Click Element                   locator=${CAMPO_N_FANTASIA}
    Input Text                       locator=${CAMPO_N_FANTASIA}    text=LOJA_TESTE
    Click Element                    locator=//li[contains(.,'LOJA_TESTE')]
    sleep   1
    Click Element                    locator=${APLICAR_FILTRO}
    Wait Until Page Contains         text=LOJA_TESTE
    Element Text Should Be           (//td[contains(.,'LOJA_TESTE')])[1]      LOJA_TESTE
    Sleep    1
    Click Element                    locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible    locator=//td[contains(.,'70000')]
    Sleep    2
