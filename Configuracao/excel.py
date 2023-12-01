import  os

pasta = 'C:/Users/quems/Downloads/'

# Nome do arquivo que você deseja verificar
nome_do_arquivo = 'clients.xlsx'

# Verifica se o arquivo existe na pasta
caminho_completo = os.path.join(pasta, nome_do_arquivo)

if os.path.exists(caminho_completo):
    print(f'O arquivo {nome_do_arquivo} existe na pasta {pasta}.')
else:
    print(f'O arquivo {nome_do_arquivo} não existe na pasta {pasta}.')


#Rodar o arquivo
#    ${status}    Run Process    python    excel.py
##    Should Be Equal As Integers    ${status.rc}    0
#    Log     ${status}