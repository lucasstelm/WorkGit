#!/bin/bash

arquivo="$1"
if [ -z "$arquivo" ]; then
    echo -e "\nERRO: Informe o arquivo de dados como parâmetro.\n"
    exit 1
fi

echo -e "\n-----------------------------------------------------------------------------"
echo -e "\n                   Exercício resolvido em: $(date +%F\ %T)" 
echo -e "\n-----------------------------------------------------------------------------\n"

# 1. Quantidade de atrasos de uma dada companhia passada como parâmetro;
echo -e "*** 1. Quantidade de atrasos de uma dada companhia passada como parâmetro ***"

echo -e "Atrasos de partida: $(grep $(echo -e $arquivo) 2006-sample.csv| awk -F "," '$16>0{c++} END{print c+0}')"
echo -e "Atrasos de chegada: $(grep $(echo -e $arquivo) 2006-sample.csv| awk -F "," '$15>0{c++} END{print c+0}')"


# 2. Voo com maior atraso na chegada;
echo -e "--------------------------------------------------------------------------"
echo "*** 2. Voo com maior atraso na chegada ***"


# 3. Voo mais longo;
echo -e "--------------------------------------------------------------------------"
echo "*** 3. Voo mais longo ***"


# 4. Quantidade de voos redirecionados;
echo -e "--------------------------------------------------------------------------"
echo "*** 4. Quantidade de voos redirecionados ***"

# 5. Voo com maior atraso na saída;
echo -e "--------------------------------------------------------------------------"
echo "*** 5. Voo com maior atraso na saída ***"


# 6. Tempo de atraso total para a companhia Delta Air Lines;
echo -e "--------------------------------------------------------------------------"
echo "*** 6. Tempo de atraso total para a companhia Delta Air Lines ***"


# 7. Tempo total de atrasos para a decolagem de vôos no aeroporto JFK;
echo -e "--------------------------------------------------------------------------"
echo "*** 7. Tempo total de atrasos para a decolagem de vôos no aeroporto JFK ***"

