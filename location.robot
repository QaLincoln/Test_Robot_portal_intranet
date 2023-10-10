*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                           http://localhost:8080/auth/login
${URL_CADASTRO}                  http://localhost:8080/home/estabelicimentos
${SIDEBAR_CADASTRO}              //span[contains(.,'Cadastros')]
${SIDEBAR_CADASTRO_CLIENTES}     class=text-itens-sidebar


*** Keywords ***
Abrir Site intranet
    Open Browser            browser=chrome    ##Abrir browser no chromer
    Maximize Browser Window

Fechar o navegador
    Close Browser

#Caso de teste 1
Dado fazendo login

    Go To    url=${URL}
    Sleep    2
    Input Text    locator=//input[contains(@type,'text')]   text=RAFAEL.PINHEIRO@FIXPAY.COM.BR
    Input Text    locator=//input[contains(@type,'password')]   text=123456
    Click Element   locator=//button[@class='btn btn-primary w-100 fw-semibold'][contains(.,'Entrar')]
    Wait Until Page Contains       text=Bem-vindo ao intranet do Parcelaconta, RAFAEL PINHEIRO!

Quando entrar na tela cadastro_clientes
    Click Element    locator=${SIDEBAR_CADASTRO}
    Wait Until Element Is Visible    ${SIDEBAR_CADASTRO_CLIENTES}
    Click Element    ${SIDEBAR_CADASTRO_CLIENTES}
    Wait Until Page Contains       text=Bem-vindo ao intranet do Parcelaconta, RAFAEL PINHEIRO!
    Wait Until Location Is      expected=${URL_CADASTRO}



