#!/bin/bash
# Para usar, leia o README.md
i=0 # Variável de Contador
while read linha; do # Lê o arquivo de wordlist linha por linha
   resposta=$(curl -s -o /dev/null -w "%{http_code}" $1/$linha/) # Captura o valor da resposta HTTP da página 
   if [ $resposta == 200 ]; then # Valida o valor recebido da resposta e caso seja 200 (página existente) apresenta o link encontrado na tela
        echo "......:.....::| $1/$linha | DISCOVERED | CODE:200 OK |::......:....."
        if [ $i == 0 ]; then # Caso receba uma resposta 200, seta o contador com o valor 1
            let "i=i+1"
        fi
   fi
   
done < $2 

if [ $i == 0 ]; then # Ao rodar toda a wordlist e não encontrar nenhum link válido exibe a mensagem abaixo
    echo "......:.....::| Nenhum link foi localizado |::......:....."
fi
