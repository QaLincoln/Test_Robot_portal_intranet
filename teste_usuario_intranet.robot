*** Settings ***
Resource        Resourcer/resourcer_usuario_intranet.robot
Resource        Configuracao/location.robot
Resource        Configuracao/banco.robot
Test Setup      Abrir Site intranet
Test Teardown   Fechar o navegador
Library         OperatingSystem
Test Tags       todos_usuario_intranet


*** Test Cases ***

Caso de Teste 1: Testando todos os filtros: Filtro por ID
    [Tags]    id
    Executar comando antes do teste
    Dado fazendo login                         #puxa do arquivo../location.robot
    E entrar na tela usuario_intranet
    E deve consegui filtrar por id
    Executar comando depois do teste