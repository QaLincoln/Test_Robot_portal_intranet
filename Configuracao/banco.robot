*** Settings ***
Library         DatabaseLibrary
Library         SeleniumLibrary
Library         String
Library         Collections

*** Variables ***
${DB_DRIVER}      psycopg2  # O driver PostgreSQL para Python
${DB_NAME}        parcelaconta_development
${DB_USER}        postgres
${DB_PASSWORD}    postgres
${DB_HOST}        localhost
${DB_PORT}        5432

*** Keywords ***
Conectar ao Banco de Dados
    Connect to Database    ${DB_DRIVER}    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}

Quando inserir Dados na tabela clientes
    [Documentation]    Insere dados na tabela de exemplo.
    Conectar ao Banco de Dados
    ${result}    Execute SQL String    INSERT INTO public.clients (id, cpf_cnpj, social_reason, fantasy, contact_name, email, active, phone_number, address_id, group_id, establishment_id, created_at, updated_at, status_caf, status_accreditation_id) VALUES(50000,032607033821,'TesteLincoln','teste', 'teste','teste@gmail.com', true,85985763075, 1, 1, 1, '2023-09-24', '2023-09-24' , 'APPROVED', 3)
#     Should Be Equal As Integers    ${result}    1

Então deletar cliente
    [Documentation]    Deleta dados
    Conectar ao Banco de Dados
    ${result}        Execute SQL String     DELETE FROM public.clients WHERE id=50000
#    Run Keyword And Ignore Error
#    Run Keyword If  "${result}" == "FAIL"  Log  A exclusão falhou, mas continuando o teste
#        ...  ELSE  Log  A exclusão foi bem-sucedida
#    Disconnect From Database

#Caso de Teste 6
Comparar Dados do Banco com totalizadores: Aceitos, Pendentes, Não_validados e Declinados
     [Documentation]    Insere dados na tabela de exemplo.
     Conectar ao Banco de Dados
     ${aceitos}          Query                SELECT COUNT(*) FROM clients WHERE status_accreditation_id = 3
     Log    Total number of records:${aceitos}

     ${Pendentes}        Query                SELECT COUNT(*) FROM clients WHERE status_accreditation_id = 2
     Log    Total number of records:${Pendentes}

     ${Não_validados}     Query               SELECT COUNT(*) FROM clients WHERE status_accreditation_id = 1
     Log    Total number of records:${Não_validados}

    ${Declinados}         Query               SELECT COUNT(*) FROM clients WHERE status_accreditation_id = 4
    Log    Total number of records:${Declinados}

#Converter abaixo tupla da lista
     ${valor1} =    Get From List          ${aceitos}          0        # Extrai a tupla da lista
     ${numero1} =    Convert To Integer    ${valor1[0]}    # Extrai o valor da tupla e converte para inteiro
     Log    Número como inteiro:${numero1}

     ${valor2} =    Get From List          ${Pendentes}         0        # Extrai a tupla da lista
     ${numero2} =    Convert To Integer    ${valor2[0]}    # Extrai o valor da tupla e converte para inteiro
     Log    Número como inteiro:${numero2}

     ${valor3} =    Get From List          ${Não_validados}         0        # Extrai a tupla da lista
     ${numero3} =    Convert To Integer    ${valor3[0]}    # Extrai o valor da tupla e converte para inteiro
     Log    Número como inteiro:${numero3}

     ${valor4} =    Get From List          ${Declinados}         0        # Extrai a tupla da lista
     ${numero4} =    Convert To Integer    ${valor4[0]}    # Extrai o valor da tupla e converte para inteiro
     Log    Número como inteiro:${numero4}

#Comparar valores do banco com a tela cadastro
    ${dynamic_number1} =    Get Text    (//h2[contains(@class,'fw-bold text-center text-black')])[1]    # Localiza o número dinâmico na página
    ${expected_number1} =    Set Variable    ${numero1}   # Número de referência a ser comparado
    Should Be Equal As Integers    ${dynamic_number1}    ${expected_number1}


    ${dynamic_number2} =    Get Text    (//h2[contains(@class,'fw-bold text-center text-black')])[2]    # Localiza o número dinâmico na página
    ${expected_number2} =    Set Variable    ${numero2}   # Número de referência a ser comparado
    Should Be Equal As Integers    ${dynamic_number2}    ${expected_number2}


    ${dynamic_number3} =    Get Text    (//h2[contains(@class,'fw-bold text-center text-black')])[3]    # Localiza o número dinâmico na página
    ${expected_number3} =    Set Variable    ${numero3}   # Número de referência a ser comparado
    Should Be Equal As Integers    ${dynamic_number3}    ${expected_number3}


    ${dynamic_number4} =    Get Text    (//h2[contains(@class,'fw-bold text-center text-black')])[4]    # Localiza o número dinâmico na página
    ${expected_number4} =    Set Variable    ${numero4}   # Número de referência a ser comparado
    Should Be Equal As Integers    ${dynamic_number4}    ${expected_number4}

    Pass Execution     message= Valores do banco estâo igual aos totalizadores!

############################################################################################################
#Quando inserir Dados na tabela usuario_intranet
#    [Documentation]    Insere dados na tabela de exemplo.
#    Conectar ao Banco de Dados
#    ${result}    Execute SQL String    INSERT INTO public.intranet_users(id, name, email, password_digest, active, role, remember_digest, phone, name_photo, created_at, updated_at, profile_users_id) VALUES (60000, 'TESTE_LINCOLN', 'LINCOLN_TESTE@GMAIL.COM', '$2a$12$p4eY.qhFmLrLpOqwi7tRQOAX9bCVWSxfoKWkZE6OXPeksD6cH9M0m', 'true', 'admin', null, '85985763075', null, '0001-01-01 00:00:00', '0001-01-01 00:00:00', 1)
#Então deletar users_intranet
#    [Documentation]    Deleta dados
#    Conectar ao Banco de Dados
#    ${result}        Execute SQL String     DELETE FROM public.intranet_users WHERE id=60000
#    Disconnect From Database
############################################################################################################
Quando inserir tabela partner_clients
    [Documentation]    Insere dados na tabela de exemplo.
    Conectar ao Banco de Dados
    ${result}    Execute SQL String    INSERT INTO public.partner_clients(id, partner_id, client_email, client_id, created_at, updated_at, active) VALUES (100000, 70000, 'teste_partner@gmail.com', '50000', '0001-01-01 00:00:00', '0001-01-01 00:00:00', 'true');
Então deletar partner_clients
    [Documentation]    Deleta dados
    Conectar ao Banco de Dados
    ${result}        Execute SQL String     DELETE FROM public.partner_clients WHERE id=100000
#    Disconnect From Database
############################################################################################################
Quando inserir dados na tabela usuario_intranet
    [Documentation]    Insere dados na tabela de exemplo.
    Conectar ao Banco de Dados
    ${result}    Execute SQL String     INSERT INTO public.intranet_users (id, name, email, phone, password_digest, active, role, created_at, updated_at, profile_users_id )VALUES (60000, 'LINK_TEST', 'LINK_TEST@GMAIL.COM', '85985763075', '$2a$12$IQjDl278SCiLUfHL1eRz7ucZWxvHUnoboUzYH0OgO02U9qmnqPnKK', 'TRUE', 'ADMIN', '2023-10-23 16:31:00.22457', '2023-10-23 16:31:00.22457', '5');
Então deletar users_intranet
    [Documentation]    Deleta dados
    Conectar ao Banco de Dados
    ${result}        Execute SQL String     DELETE FROM public.intranet_users WHERE id=60000
#    Disconnect From Database
#############################################################################################################
Quando inserir dados na tabela partners
    [Documentation]    Insere dados na tabela de exemplo.
    Conectar ao Banco de Dados
    ${result}    Execute SQL String         INSERT INTO public.partners(id, social_reason, fantasy, cpf_cnpj, email, phone_number, active, created_at, updated_at) VALUES (70000, 'EMPRESA_TESTE', 'LOJA_TESTE', '03260703388', 'LOJA_TESTE1@GMAIL.COM', '985763057', TRUE, '2023-09-01 09:37:29.933072', '2023-09-01 09:37:29.933072');
Então deletar partners
    [Documentation]    Deleta dados
    Conectar ao Banco de Dados
    ${result}        Execute SQL String     DELETE FROM public.partners WHERE id=70000