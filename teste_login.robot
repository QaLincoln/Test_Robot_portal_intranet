*** Settings ***
Resource    Resourcer/resourcer_login.robot
Test Setup    Abrir Site
Test Teardown   Fechar o navegador
Test Tags       todos_login

*** Test Cases ***
Caso de Teste 1: Acessando o localhost e fazendo login
    [Tags]    site
    Dado abrir site intranet
    Quando digitar email e senha corretos
    E clicar em entrar
    Então deve aparecer

