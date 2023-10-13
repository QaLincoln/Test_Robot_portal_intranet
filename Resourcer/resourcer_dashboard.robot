*** Settings ***
Library    SeleniumLibrary
#Force Tags      todos_dashboard


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



