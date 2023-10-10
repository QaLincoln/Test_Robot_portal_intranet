*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}  http://localhost:8080/auth/login


*** Keywords ***
#Caso de teste 1
Quando entrar na tela dashboard verificar o texto do titulo Dashboard
    Wait Until Page Contains    text=Dashboard

E verificar se a imagem de pizza do pagamento existe
    Page Should Contain Element  id=chart-cons-billets

Então verificar se o grafico de boletos pagos existe
      Page Should Contain Element    class=chart-canvas


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
