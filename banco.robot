*** Settings ***
Library           DatabaseLibrary

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

Inserir Dados no Banco
    [Documentation]    Insere dados na tabela de exemplo.
    Conectar ao Banco de Dados
    ${result}    Execute SQL String    INSERT INTO public.clients (id, cpf_cnpj, social_reason, fantasy, contact_name, email, active, phone_number, address_id, group_id, establishment_id, created_at, updated_at, status_caf, status_accreditation_id) VALUES(3000,032607033821,'TesteLincoln','teste', 'teste','teste@gmail.com', true,85985763075, 1, 1, 1, '2023-09-24', '2023-09-24' , 'APPROVED', 3)
#     Should Be Equal As Integers    ${result}    1

Deletar cliente
    [Documentation]    Deleta dados
    Conectar ao Banco de Dados
    ${result}       Execute SQL String     DELETE FROM public.clients WHERE id=3000
#    Run Keyword And Ignore Error
#    Run Keyword If  "${result}" == "FAIL"  Log  A exclusão falhou, mas continuando o teste
#        ...  ELSE  Log  A exclusão foi bem-sucedida
    Disconnect From Database
