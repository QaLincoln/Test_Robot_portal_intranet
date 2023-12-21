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
    Executar comando depois do teste

Caso de Teste 2: Acessando a tela de Parceiros
    [Tags]    cnpj
    Executar comando antes do teste
    Dado fazendo login
    Quando entrar na tela parceiros     #puxa do arquivo../location.robot
    E deve conseguir filtrar por CNPJ
    Executar comando depois do teste

Caso de Teste 3: Acessando a tela de Razão Social
    [Tags]    social
    Executar comando antes do teste
    Dado fazendo login
    Quando entrar na tela parceiros     #puxa do arquivo../location.robot
    E deve conseguir filtrar por Razão Social
    Executar comando depois do teste

Caso de Teste 4: Acessando a tela de Nome Fantasia
    [Tags]    nome
    Executar comando antes do teste
    Dado fazendo login
    Quando entrar na tela parceiros     #puxa do arquivo../location.robot
    E deve conseguir filtrar por Nome Fantasia
    Executar comando depois do teste