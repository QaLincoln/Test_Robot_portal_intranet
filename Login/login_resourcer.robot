*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}  http://localhost:8080/auth/login


*** Keywords ***
Abrir Site
    Open Browser    browser=chrome    ##Abrir browser no chromer
    Maximize Browser Window

Fechar o navegador
    ##Capture Page Screenshot
    Close Browser

##Caso de teste 1
Dado abrir site intranet
    Go To    url=${URL}
Quando digitar email e senha corretos
    Input Text    locator=//input[contains(@type,'text')]   text=RAFAEL.PINHEIRO@FIXPAY.COM.BR
    Input Text    locator=//input[contains(@type,'password')]   text=123456
E clicar em entrar
    Click Element   locator=//button[@class='btn btn-primary w-100 fw-semibold'][contains(.,'Entrar')]
Então deve aparecer
    Wait Until Page Contains       text=Bem-vindo ao intranet do Parcelaconta, RAFAEL PINHEIRO!
#    Title Should Be    Konia Tecnologia | DevOps, Desenvolvimento de Software e IA, Modern Work    ## Verificando se o texto titulo esta visivel
#    Element Should Be Visible      ${BTS_Agendar_reunião}                    ## Verificando se href esta visivel
#Quando ele clicar no menu "Quem Somos"
#    Click Element    locator=${MENU_QUEM_SOMOS}
#
#Então na página deve ter Quem Somos
#    Wait Until Page Contains    text=${TITLE_QUEM_SOMOS}
