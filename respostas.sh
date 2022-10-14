#!/bin/bash

exec 1> respostas.log

arquivo="$1"
if [ -z "$arquivo" ]; then
    echo -e "\nERRO: Informe o arquivo contendo os dados para a análise.\n"
    exit 1
fi

echo -e "\n-----------------------------------------------------------------------------"
echo -e "\n                   Exercício resolvido em: $(date +%F\ %T)" 
echo -e "\n-----------------------------------------------------------------------------\n"

# 1. Quantidade de atrasos de uma dada companhia passada como parâmetro;
echo -e "*** 1. Quantidade de atrasos de uma dada companhia passada como parâmetro ***"
echo -e "\n Informe o código da companhia aérea cuja quantidade de atrasos deve ser calculada: \n"
read companhia
echo -e "Atrasos de partida: $(grep $(echo -e $companhia) $arquivo| awk -F ',' '{print $16}'| grep -v '^0.0'|awk -F "," '$1>0{c++} END{print c}')"
echo -e "Atrasos de chegada: $(grep $(echo -e $companhia) $arquivo| awk -F ',' '{print $15}'| grep -v '^0.0'|awk -F "," '$1>0{c++} END{print c}')"
	
# 2. Voo com maior atraso na chegada;
echo -e "--------------------------------------------------------------------------"
echo "*** 2. Voo com maior atraso na chegada ***"
echo "Número do voo com maior atraso na chegada e o seu respectivo atraso:"
sort -t"," -k15,15gr $arquivo | cut -d"," -f10,15 | head -n 1

# 3. Voo com maior atraso na saída;
echo -e "--------------------------------------------------------------------------"
echo "*** 3. Voo com maior atraso na saída ***"
echo "Número do voo com maior atraso na saída e o seu respectivo atraso:"
sort -t "," -k16,16gr $arquivo | cut -d "," -f10,16 | head -n 1

# 4. Voo mais longo;
echo -e "--------------------------------------------------------------------------"
echo "*** 4. Voo mais longo ***"
echo "Número do voo mais longo e o seu respectivo tempo de voo:"
sort -t, -n -r -k14 $arquivo| head -1| cut -d, -f10,14

# 5. Quantidade de voos redirecionados;
echo -e "--------------------------------------------------------------------------"
echo "*** 5. Quantidade de voos redirecionados ***"
echo -e  "Foram redirecionados $(cut -d, -f24 $arquivo|grep 1|wc -l) voos."

# 6. Tempo de atraso total para a companhia Delta Air Lines;
echo -e "--------------------------------------------------------------------------"
echo "*** 6. Tempo de atraso total para a companhia Delta Air Lines ***"
awk -F"," -f delta.awk $arquivo

# 7. Tempo total de atrasos para a decolagem de vôos no aeroporto JFK;
echo -e "--------------------------------------------------------------------------"
echo "*** 7. Tempo total de atrasos para a decolagem de vôos no aeroporto JFK ***"
grep JFK $arquivo| awk -F "," '{if ($16>0) print $16}'| sum| cut -d ' ' -f 1

echo -e "\n--------------------------------------------------------------------------"
echo -e "          Os resultados foram salvos no arquivo respostas.log"
echo -e "--------------------------------------------------------------------------\n"

