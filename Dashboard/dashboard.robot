*** Settings ***
Resource    dashboard_resourcer.robot
Resource    ../location.robot
Test Setup    Abrir Site intranet

*** Test Cases ***
Caso de Teste 1: Acessando a tela de dashboard
    [Tags]    dashboard
    Dado fazendo login
    Quando entrar na tela dashboard verificar o texto do titulo Dashboard
    E verificar se a imagem de pizza do pagamento existe
    Então verificar se o grafico de boletos pagos existe

