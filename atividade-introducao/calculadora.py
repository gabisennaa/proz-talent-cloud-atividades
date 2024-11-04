def calculadora():
    while True:
        print("Selecione uma operação:")
        print("1: Soma")
        print("2: Subtração")
        print("3: Multiplicação")
        print("4: Divisão")
        print("0: Sair")
        
        opcao = input("Digite o número para a operação correspondente: ")
        
        if opcao == '0':
            print("Saindo do programa. Até logo!")
            break
        
        if opcao not in ['1', '2', '3', '4']:
            print("Essa opção não existe. Tente novamente.")
            continue
        
        try:
            primeiro_valor = float(input("Digite o primeiro valor: "))
            segundo_valor = float(input("Digite o segundo valor: "))
        except ValueError:
            print("Por favor, insira apenas números.")
            continue
        
        if opcao == '1':
            resultado = primeiro_valor + segundo_valor
            print(f"O resultado da soma é: {resultado}")
        elif opcao == '2':
            resultado = primeiro_valor - segundo_valor
            print(f"O resultado da subtração é: {resultado}")
        elif opcao == '3':
            resultado = primeiro_valor * segundo_valor
            print(f"O resultado da multiplicação é: {resultado}")
        elif opcao == '4':
            if segundo_valor == 0:
                print("Erro: Não é possível dividir por zero.")
            else:
                resultado = primeiro_valor / segundo_valor
                print(f"O resultado da divisão é: {resultado}")

calculadora()