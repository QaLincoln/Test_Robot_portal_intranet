*** Settings ***
Resource    Resourcer/resourcer_perceiros.robot
Resource    Configuracao/location.robot
Test Setup     Abrir Site intranet
Test Teardown   Fechar o navegador
Test Tags       todos_dashboard

*** Test Cases ***
Caso de Teste 1: Acessando a tela de Parceiros
    [Tags]    parceiros
    Executar comando antes do teste
    Dado fazendo login
    Quando entrar na tela parceiros     #puxa do arquivo../location.robot
    E deve conseguir filtrar por id

