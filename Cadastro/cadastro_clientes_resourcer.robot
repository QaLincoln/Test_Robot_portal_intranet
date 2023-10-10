*** Settings ***
Library         SeleniumLibrary
#Library         OperatingSystem

*** Variables ***
${CAMPO_ID}             //input[contains(@class,'form-control input input')]
${CAMPO_CLIENTES}       //input[contains(@aria-controls,'search-client-multiselect-options')]
${CAMPO_CPF}            //input[contains(@aria-controls,'search-cpf-multiselect-options')]
${APLICAR_FILTRO}       //button[contains(@id,'aplicar-filtro')]
${LIMPAR_FILTRO}        //button[contains(@id,'limpar-filtros')]
#${FECHAR_JANELA}        taskkill /F /IM chrome.exe

*** Keywords ***


#Caso de teste 1
E deve consegui filtrar por id
    Sleep    5
    Input Text                      locator=${CAMPO_ID}   text=3000
    Click Element                   locator=${APLICAR_FILTRO}
    Wait Until Page Contains        text=3000
    Click Element                   locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible   locator=//span[contains(.,'2557')]
    Sleep    2
#    Run                             ${FECHAR_JANELA}          #Fechar janela do browser quando terminar
#Caso de Teste 2
E deve consegui filtrar por cliente
    Sleep    5
    Click Element                       locator=${CAMPO_CLIENTES}
    Wait Until Element Is Visible       id=search-client-multiselect-option-teste
    Click Element                       id=search-client-multiselect-option-teste
    Click Element                       locator=${APLICAR_FILTRO}
    Element Text Should Be              //td[contains(.,'TesteLincoln')]      TESTELINCOLN       #compara se o locator e igual ao texto
    Click Element                       locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible       locator=//span[contains(.,'2557')]
    Sleep    2
#    Run                                 ${FECHAR_JANELA}              #Fechar janela do browser quando terminar
#Caso de Teste 3
E deve consegui filtrar por cpf
    Sleep    5
    Click Element                       locator=${CAMPO_CPF}
    Wait Until Element Is Visible       id=search-cpf-multiselect-option-326.070.338-21
    Click Element                       id=search-cpf-multiselect-option-326.070.338-21
    Click Element                       locator=${APLICAR_FILTRO}
    Element Text Should Be              //td[contains(.,'TesteLincoln')]      TESTELINCOLN           #compara se o locator e igual ao texto
    Wait Until Page Contains            text=421.669.263-04
    Click Element                       locator=${LIMPAR_FILTRO}
    Wait Until Element Is Visible       locator=//span[contains(.,'2555')]
    Sleep    2
#    Run                                 ${FECHAR_JANELA}              #Fechar janela do browser quando terminar

#E verificar se a imagem de pizza do pagamento existe
#    Page Should Contain Element  id=chart-cons-billets
#
#Então verificar se o grafico de boletos pagos existe
#    Page Should Contain Element    class=chart-canvas


#    Go To    url=${URL}
#    Sleep    2
#    Input Text    locator=//input[contains(@type,'text')]   text=RAFAEL.PINHEIRO@FIXPAY.COM.BR
#    Input Text    locator=//input[contains(@type,'password')]   text=123456
#    Click Element   locator=//button[@class='btn btn-primary w-100 fw-semibold'][contains(.,'Entrar')]
#    Wait Until Page Contains       text=Bem-vindo ao intranet do Parcelaconta, RAFAEL PINHEIRO!
#    Title Should Be    Konia Tecnologia | DevOps, Desenvolvimento de Software e IA, Modern Work    ## Verificando se o texto titulo esta visivel
#    Element Should Be Visible      ${BTS_Agendar_reunião}                    ## Verificando se href esta visivel
#Quando ele clicar no menu "Quem Somos"
#    Click Element    locator=${MENU_QUEM_SOMOS}
#
#Então na página deve ter Quem Somos
#    Wait Until Page Contains    text=${TITLE_QUEM_SOMOS}
