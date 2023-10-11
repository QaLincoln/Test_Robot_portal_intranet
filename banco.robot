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

Quando inserir Dados no Banco
    [Documentation]    Insere dados na tabela de exemplo.
    Conectar ao Banco de Dados
    ${result}    Execute SQL String    INSERT INTO public.clients (id, cpf_cnpj, social_reason, fantasy, contact_name, email, active, phone_number, address_id, group_id, establishment_id, created_at, updated_at, status_caf, status_accreditation_id) VALUES(3000,032607033821,'TesteLincoln','teste', 'teste','teste@gmail.com', true,85985763075, 1, 1, 1, '2023-09-24', '2023-09-24' , 'APPROVED', 3)
#     Should Be Equal As Integers    ${result}    1

Então deletar cliente
    [Documentation]    Deleta dados
    Conectar ao Banco de Dados
    ${result}        Execute SQL String     DELETE FROM public.clients WHERE id=3000
#    Run Keyword And Ignore Error
#    Run Keyword If  "${result}" == "FAIL"  Log  A exclusão falhou, mas continuando o teste
#        ...  ELSE  Log  A exclusão foi bem-sucedida
    Disconnect From Database

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
     Disconnect From Database
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