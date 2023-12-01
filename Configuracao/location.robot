*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                           http://localhost:8080/auth/login
${URL_PARCEIROS}                 http://localhost:8080/partners
${URL_CADASTRO}                  http://localhost:8080/clients
${URL_USUARIO}                   http://localhost:8080/intranet-users
${OPEN/CLOSE}                    //img[contains(@alt,'Open/Close')]
${SIDEBAR_CADASTRO}              //span[contains(.,'Cadastros')]
${SIDEBAR_CADASTRO_CLIENTES}     class=text-itens-sidebar
${SIDEBAR_PARCEIROS}             //span[@class='text-itens-sidebar'][contains(.,'Parceiros')]
${SIDEBAR_USUARIO}               (//span[contains(@class,'text-itens-sidebar')])[3]


*** Keywords ***
Abrir Site intranet
    Open Browser            browser=firefox    ##Abrir browser no chromer
    Maximize Browser Window

Fechar o navegador
    Close Browser

#Caso de teste 1
Dado fazendo login

    Go To           url=${URL}
    Sleep    2
    Input Text      locator=//input[contains(@type,'text')]   text=RAFAEL.PINHEIRO@FIXPAY.COM.BR
    Input Text      locator=//input[contains(@type,'password')]   text=123456
    Click Element   locator=//button[@class='btn btn-primary w-100 fw-semibold'][contains(.,'Entrar')]
    Wait Until Page Contains       text=Bem-vindo ao intranet do Parcelaconta, RAFAEL PINHEIRO!
    Sleep    2

Quando entrar na tela cadastro_clientes
    Click Element                      locator=${OPEN/CLOSE}
    Click Element                      locator=${SIDEBAR_CADASTRO}
    Wait Until Element Is Visible      locator=${SIDEBAR_CADASTRO_CLIENTES}
    Click Element                      locator=${SIDEBAR_CADASTRO_CLIENTES}
    Wait Until Page Contains           text=Bem-vindo ao intranet do Parcelaconta, RAFAEL PINHEIRO!
    Wait Until Location Is             expected=${URL_CADASTRO}
    Sleep    2

Quando entrar na tela parceiros
    Click Element                      locator=${OPEN/CLOSE}
    Click Element                      locator=${SIDEBAR_CADASTRO}
    Wait Until Element Is Visible      locator=${SIDEBAR_PARCEIROS}
    Click Element                      locator=${SIDEBAR_PARCEIROS}
    Wait Until Page Contains           text=Bem-vindo ao intranet do Parcelaconta, RAFAEL PINHEIRO!
    Wait Until Location Is             expected=${URL_PARCEIROS}

Quando entrar na tela usuario_intranet
    Click Element                       locator=${OPEN/CLOSE}
    Click Element                       locator=${SIDEBAR_CADASTRO}
    Wait Until Element Is Visible       locator=${SIDEBAR_USUARIO}
    Click Element                       locator=${SIDEBAR_USUARIO}
    Wait Until Page Contains            text=Bem-vindo ao intranet do Parcelaconta, RAFAEL PINHEIRO!
    Wait Until Location Is              expected=${URL_USUARIO}
    Sleep    2



