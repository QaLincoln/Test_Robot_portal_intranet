*** Settings ***
Resource        Resourcer/resourcer_cadastro_clientes.robot
Resource        Configuracao/location.robot
Resource        Configuracao/banco.robot
Test Setup      Abrir Site intranet
Test Teardown   Fechar o navegador
Test Tags       todos_cadastro_Clientes
Library         OperatingSystem

*** Test Cases ***
Caso de Teste 1: Testando todos os filtros: Filtro por ID
    [Documentation]     Tela cadastro
    [Tags]    id
    Executar comando antes do teste
    Dado fazendo login      #puxa do arquivo../location.robo
    Quando entrar na tela cadastro_clientes     #puxa do arquivo../location.robot
    E deve consegui filtrar por id
    Executar comando depois do teste

#Caso de Teste 2: Testando todos os filtros: Filtro por Clientes
#    [Documentation]     Tela cadastro
#    [Tags]    clientes
#    Executar comando antes do teste
#    Dado fazendo login      #puxa do arquivo../location.robot
#    Quando entrar na tela cadastro_clientes     #puxa do arquivo../location.robot
#    E deve consegui filtrar por cliente
#    Executar comando depois do teste
#
#Caso de Teste 3: Testando todos os filtros: Filtro por CPF
#    [Documentation]     Tela cadastro
#    [Tags]    cpf
#    Executar comando antes do teste
#    Dado fazendo login          #puxa do arquivo../location.robot
#    Quando entrar na tela cadastro_clientes     #puxa do arquivo../location.robot
#    E deve consegui filtrar por cpf
#    Executar comando depois do teste
#
#Caso de Teste 4: Testando todos os filtros: Filtro por Status
#    [Documentation]     Tela cadastro
#    [Tags]    status
#    Executar comando antes do teste
#    Dado fazendo login          #puxa do arquivo../location.robot
#    Quando entrar na tela cadastro_clientes     #puxa do arquivo../location.robot
#    E deve consegui filtrar por status
#    Executar comando depois do teste
#
#Caso de Teste 5: Testando todos os filtros: Filtro por Datas
#    [Documentation]     Tela cadastro
#    [Tags]    datas
#    Executar comando antes do teste
#    Dado fazendo login          #puxa do arquivo../location.robot
#    Quando entrar na tela cadastro_clientes     #puxa do arquivo../location.robot
#    E deve consegui filtrar por datas
#    Executar comando depois do teste
#
#Caso de Teste 6: Testar totalizadores
#    [Documentation]     Tela cadastro
#    [Tags]    total
#    Dado fazendo login          #puxa do arquivo../location.robot
#    Quando entrar na tela cadastro_clientes     #puxa do arquivo../location.robot
#    Comparar Dados do Banco com totalizadores: Aceitos, Pendentes, Não_validados e Declinados
#
#Caso de Teste 7: Teste exportar arquivo excel
#    [Documentation]     Tela cadastro
#    [Tags]    arquivo
#    Dado fazendo login          #puxa do arquivo../location.robot
#    Quando entrar na tela cadastro_clientes     #puxa do arquivo../location.robot
#    Então deve consegui exporta arquivo
#
#Caso de Teste 8: Testando todos os filtros: Filtro por parceiro
#     [Documentation]     Tela cadastro
#     [Tags]    parceiros
#     Executar comando antes do teste
#     Dado fazendo login          #puxa do arquivo../location.robot
#     Quando entrar na tela cadastro_clientes     #puxa do arquivo../location.robot
#     E deve consegui filtrar por parceiro















#teste
#    Quando inserir Dados no Banco