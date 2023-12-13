*** Settings ***
Resource        ../Configuracao/location.robot
Resource        ../Configuracao/banco.robot
Library         SeleniumLibrary
Library         DatabaseLibrary
Library         String
Library         Collections
#Suite Setup     Set Screenshot Directory  NONE
#Force Tags      todos_usuario_intranet


*** Variables ***
${CAMPO_ID}             //input[contains(@placeholder,'Informe o ID')]
${APLICAR_FILTRO}       //button[@type='button'][contains(.,'Filtrar')]
${LIMPAR_FILTRO}        //button[contains(.,'Limpar')]
${CAMPO_NOME}           //input[contains(@aria-placeholder,'Informe o Nome')]
${URL_CADASTRO}         http://localhost:8080/intranet-users/create

*** Keywords ***
Executar comando antes do teste
    Então deletar users_intranet
    Quando inserir dados na tabela usuario_intranet

Executar comando depois do teste
    Então deletar users_intranet

#Caso de teste 1
E deve conseguir filtrar por id
    Sleep    5
    Input Text                      locator=${CAMPO_ID}   text=60000
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=60000
    Element Text Should Be          //td[contains(.,'60000')]      60000
    Click Element                   locator=${LIMPAR_FILTRO}
    #Wait Until Element Is Visible   locator=//td[contains(.,'60000')]
    Sleep    2

#Caso de teste 2
E deve conseguir filtrar por nome
    Wait Until Element Is Visible    locator=${CAMPO_NOME}
    Input Text                      locator=${CAMPO_NOME}    text=LINK_TEST
    Click Element                   locator=//li[contains(.,'LINK_TEST')]
    sleep   1
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=LINK_TEST
    Element Text Should Be          (//td[contains(.,'LINK_TEST')])[1]      LINK_TEST
    Sleep    1
    Click Element                   locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible   locator=//td[contains(.,'60000')]
    Sleep    2

#Caso de teste 3
E deve conseguir filtrar por permissão
    Sleep    5
    Click Element                   locator=//input[contains(@aria-placeholder,'Selecione Permissão')]
    Click Element                   locator=//li[@class='multiselect-option'][contains(.,'CS')]
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=CS
    Element Text Should Be          //td[contains(.,'CS')]      CS
    Click Element                   locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible   locator=//td[contains(.,'60000')]
    Sleep    2

#Caso de teste 4
Então deve conseguir editar e excluir
    Sleep    5
    Click Element                   locator=//input[contains(@aria-placeholder,'Selecione Permissão')]
    Click Element                   locator=//li[@class='multiselect-option'][contains(.,'CS')]
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=CS
    Element Text Should Be          //td[contains(.,'CS')]      CS
    Click Element                   locator=//img[contains(@id,'usuario')][@src='/img/dropdown-rosa.b20ce917.svg']
    Click Element                   locator=//button[@class='botaoDrop'][contains(.,'Editar')]
    Sleep    2
    Input Text                      locator=//input[contains(@placeholder,'Editar nome')]       text=LINK_TEST2
    Click Element                   locator=//button[@type='button'][contains(.,'Salvar')]
    Sleep    5
    Wait Until Page Contains        text=Usuário editado!
    Input Text                      locator=${CAMPO_ID}   text=60000
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=60000
    Click Element                   locator=//img[contains(@id,'usuario')][@src='/img/dropdown-rosa.b20ce917.svg']
    Click Element                   locator=//button[@data-bs-toggle='modal'][contains(.,'Excluir')]
    Wait Until Page Contains        text=Essa ação não poderá ser desfeita
    Click Element                   locator=//button[contains(@id,'sim-excluir')]
#    Wait Until Page Contains        text=Usuario deletado!
    Sleep    2
    Input Text                      locator=${CAMPO_ID}   text=60000
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=Nenhum cliente encontrado.

#Caso de teste 5
E entrar na tela de cadastrar usuário
    Click Element                   locator=//button[@class='btn btn-primary btn-responsive'][contains(.,'Cadastrar usuário')]
    Wait Until Location Is          expected=${URL_CADASTRO}
