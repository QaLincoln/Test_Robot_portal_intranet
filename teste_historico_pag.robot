*** Settings ***
Resource    Resourcer/resourcer_historico_pag.robot
Resource    Configuracao/location.robot
Test Setup     Abrir Site intranet
Test Teardown   Fechar o navegador
Test Tags       todos_historico_pag

*** Test Cases ***
Caso de Teste 1: Acessando a tela de Historico e filtrar por id_pagamento
    [Tags]    id
    Dado fazendo login
    Quando entrar na tela historico_pagamento     #puxa do arquivo../location.robot
    Então deve conseguir filtrar por id_pagamento

Caso de Teste 2: Acessando a tela de Historico e filtrar por id_cliente
    [Tags]    id_cliente
    Dado fazendo login
    Quando entrar na tela historico_pagamento     #puxa do arquivo../location.robot
    Então deve conseguir filtrar por id_cliente

Caso de Teste 3: Acessando a tela de Historico e filtar por cliente
    [Tags]    cliente
    Dado fazendo login
    Quando entrar na tela historico_pagamento     #puxa do arquivo../location.robot
    Então deve conseguir filtrar por cliente

Caso de Teste 4: Acessando a tela de Historico e filtar por status
    [Tags]    status
    Dado fazendo login
    Quando entrar na tela historico_pagamento     #puxa do arquivo../location.robot
    Então deve conseguir filtrar por status

Caso de Teste 5: Acessando a tela de Historico e filtar por método
    [Tags]    metodo
    Dado fazendo login
    Quando entrar na tela historico_pagamento     #puxa do arquivo../location.robot
    Então deve conseguir filtrar por método