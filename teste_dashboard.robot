*** Settings ***
Resource    Resourcer/resourcer_dashboard.robot
Resource    Configuracao/location.robot
Test Setup     Abrir Site intranet
Test Teardown   Fechar o navegador
Test Tags       todos_dashboard

*** Test Cases ***
Caso de Teste 1: Acessando a tela de dashboard
    [Tags]    dashboard
    Dado fazendo login
    Quando entrar na tela dashboard verificar o texto do titulo Dashboard
    E verificar se a imagem de pizza do pagamento existe
    Então verificar se o grafico de boletos pagos existe

