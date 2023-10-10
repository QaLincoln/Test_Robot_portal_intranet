*** Settings ***
Resource    login_resourcer.robot
Test Setup    Abrir Site

*** Test Cases ***
Caso de Teste 1: Acessando o localhost e fazendo login
    [Tags]    site
    Dado abrir site intranet
    Quando digitar email e senha corretos
    E clicar em entrar
    Então deve aparecer

