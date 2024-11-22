def calcular_idade():

    nome = input("Digite seu nome completo: ")

    while True:
        try:
            ano_nascimento = int(input("Digite o ano de nascimento (entre 1922 e 2021): "))
            
            if 1922 <= ano_nascimento <= 2021:
                break
            else:
                print("Ano inválido. Por favor, insira um ano entre 1922 e 2021.")
        except ValueError:
            print("Erro: Por favor, insira um número válido para o ano.")
    
    idade = 2022 - ano_nascimento
    
    print(f"{nome}, você completou ou completará {idade} anos em 2022.")

calcular_idade()
