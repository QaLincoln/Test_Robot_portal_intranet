*** Settings ***
Resource        cadastro_clientes_resourcer.robot
Resource        ../location.robot
Resource        ../banco.robot
Test Setup      Abrir Site intranet
Test Teardown   Fechar o navegador
Test Tags       todos

*** Test Cases ***

Caso de Teste 1: Testando todos os filtros: Filtro por ID
    [Documentation]     Tela cadastro
    [Tags]    id
    Dado fazendo login      #puxa do arquivo../location.robot
    Quando inserir Dados no Banco      #Cria um cliente no banco
    E entrar na tela cadastro_clientes     #puxa do arquivo../location.robot
    E deve consegui filtrar por id
    Então deletar cliente
#    Então verificar se o grafico de boletos pagos existe
Caso de Teste 2: Testando todos os filtros: Filtro por Clientes
    [Documentation]     Tela cadastro
    [Tags]    clientes
    Dado fazendo login      #puxa do arquivo../location.robot
    Quando inserir Dados no Banco      #Cria um cliente no banco
    E entrar na tela cadastro_clientes     #puxa do arquivo../location.robot
    E deve consegui filtrar por cliente
    Então deletar cliente
Caso de Teste 3: Testando todos os filtros: Aba Aceitos - Filtro por CPF
    [Documentation]     Tela cadastro
    [Tags]    cpf
    Dado fazendo login          #puxa do arquivo../location.robot
    Quando inserir Dados no Banco      #Cria um cliente no banco
    E entrar na tela cadastro_clientes     #puxa do arquivo../location.robot
    E deve consegui filtrar por cpf
    Então deletar cliente
Caso de Teste 4: Testando todos os filtros: Aba Aceitos - Filtro por Status
    [Documentation]     Tela cadastro
    [Tags]    status
    Dado fazendo login          #puxa do arquivo../location.robot
    Quando inserir Dados no Banco      #Cria um cliente no banco
    E entrar na tela cadastro_clientes     #puxa do arquivo../location.robot
    E deve consegui filtrar por status
    Então deletar cliente
Caso de Teste 5: Testando todos os filtros: Aba Aceitos - Filtro por Datas
    [Documentation]     Tela cadastro
    [Tags]    datas
    Dado fazendo login          #puxa do arquivo../location.robot
    Quando inserir Dados no Banco      #Cria um cliente no banco
    E entrar na tela cadastro_clientes     #puxa do arquivo../location.robot
    E deve consegui filtrar por datas
    Então deletar cliente
Caso de Teste 6: Testar totalizadores
    [Documentation]     Tela cadastro
    [Tags]    total
    Dado fazendo login          #puxa do arquivo../location.robot
    E entrar na tela cadastro_clientes     #puxa do arquivo../location.robot
    Comparar Dados do Banco com totalizadores: Aceitos, Pendentes, Não_validados e Declinados
#Caso de Teste 7: Testar exportar para excel
#     [Documentation]     Tela cadastro
#     [Tags]    total












#teste
#    Quando inserir Dados no Banco