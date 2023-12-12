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
    quando entrar na tela usuario_intranet
    E deve conseguir filtrar por id
    Executar comando depois do teste

Caso de Teste 2: Testando todos os filtros: Filtro por nome
    [Tags]    nome
    Executar comando antes do teste
    Dado fazendo login                         #puxa do arquivo../location.robot
    Quando entrar na tela usuario_intranet
    E deve conseguir filtrar por nome
    Executar comando depois do teste

Caso de Teste 3: Testando todos os filtros: Filtro por permissão
    [Tags]    permissão
    Executar comando antes do teste
    Dado fazendo login                         #puxa do arquivo../location.robot
    Quando entrar na tela usuario_intranet
    E deve conseguir filtrar por permissão
    Executar comando depois do teste

Caso de Teste 4: Testando editar e excluir
    [Tags]    editar/excluir
    Executar comando antes do teste
    Dado fazendo login                         #puxa do arquivo../location.robot
    Quando entrar na tela usuario_intranet
    Então deve conseguir editar e excluir

Caso de Teste 5: Cadastrar usuário
    [Tags]    cadastrar
    Dado fazendo login                         #puxa do arquivo../location.robot
    Quando entrar na tela usuario_intranet
    E entrar na tela de cadastrar usuário