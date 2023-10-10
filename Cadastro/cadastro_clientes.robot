*** Settings ***
Resource        cadastro_clientes_resourcer.robot
Resource        ../location.robot
Resource        ../banco.robot
Test Setup      Abrir Site intranet
Test Teardown   Fechar o navegador
Test Tags       todos

*** Test Cases ***

Caso de Teste 1: Testando todos os filtros: Aba Aceitos - Fazer filtro por ID
    [Tags]    id
    Dado fazendo login      #puxa do arquivo../location.robot
    Inserir Dados no Banco      #Cria um cliente no banco
    Quando entrar na tela cadastro_clientes     #puxa do arquivo../location.robot
    E deve consegui filtrar por id
    Deletar cliente
#    Então verificar se o grafico de boletos pagos existe
Caso de Teste 2: Testando todos os filtros: Aba Aceitos - Fazer filtro por Clientes
    [Tags]    clientes
    Dado fazendo login      #puxa do arquivo../location.robot
    Inserir Dados no Banco      #Cria um cliente no banco
    Quando entrar na tela cadastro_clientes     #puxa do arquivo../location.robot
    E deve consegui filtrar por cliente
    Deletar cliente
Caso de Teste 3: Testando todos os filtros: Aba Aceitos - Fazer filtro por CPF
    [Tags]    cpf
    Dado fazendo login          #puxa do arquivo../location.robot
    Inserir Dados no Banco      #Cria um cliente no banco
    Quando entrar na tela cadastro_clientes     #puxa do arquivo../location.robot
    E deve consegui filtrar por cpf
    Deletar cliente