*** Settings ***
Resource        resourcer_usuario_intranet.robot
Resource        ../location.robot
Resource        ../banco.robot
Test Setup      Abrir Site intranet
Test Teardown   Fechar o navegador
Test Tags       todos

*** Test Cases ***

Caso de Teste 1: Testando todos os filtros: Filtro por ID
    Dado fazendo login                         #puxa do arquivo../location.robot
    E entrar na tela usuario_intranet
    Quando inserir Dados no Banco usuario_intranet
    E deve consegui filtrar por id
    Então deletar cliente usuario_intranet