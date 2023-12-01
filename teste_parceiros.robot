*** Settings ***
Resource        Resourcer/resourcer_parceiros.robot
Resource        Configuracao/location.robot
Resource        Configuracao/banco.robot
Test Setup      Abrir Site intranet
Test Teardown   Fechar o navegador
Library         OperatingSystem
Test Tags       todos_usuario_intranet


*** Test Cases ***

Caso de Teste 1: Testando todos os filtros: Filtro por ID
    [Tags]    id_parceiro
    Executar comando antes do teste
    Dado fazendo login                         #puxa do arquivo../location.robot
    Quando entrar na tela parceiros
    E deve conseguir filtrar por id
    Executar comando depois do teste


#
Caso de Teste 2: Testando todos os filtros: Filtro por CNPJ
    [Tags]    cnpj_parceiro
    Executar comando antes do teste
    Dado fazendo login                         #puxa do arquivo../location.robot
    Quando entrar na tela parceiros
    E deve conseguir filtrar por CNPJ
    Executar comando depois do teste

#Caso de Teste 3: Testando todos os filtros: Filtro por permissão
#    [Tags]    permissão
#    Executar comando antes do teste
#    Dado fazendo login                         #puxa do arquivo../location.robot
#    E entrar na tela usuario_intranet
#    E deve conseguir filtrar por permissão
#    Executar comando depois do teste
#
