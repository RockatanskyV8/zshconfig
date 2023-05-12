#!/bin/zsh

single_line_pattern=$1
multi_line_pattern=$2
folder=$3

for file in $folder/*.txt; do
    nome_arquivo="Nome do arquivo $file;";
    msma_linha=$(rg -IN "$single_line_pattern" "$file" | sed -E 's/^\s+|\s+$//g' | tr '\n' ';' | tr -s ' ' | tr -d ':');
    diff_linha=$(rg -INA 1 "$multi_line_pattern" "$file" | grep -v '^--$' | awk 'NR%2==0 {print p, $0} {p=$0}' | sed -E 's/^\s+|\s+$//g' | tr '\n' ';' | tr -s ' ' | tr -d ':');
    echo "$nome_arquivo $msma_linha $diff_linha" >> $folder/infos.txt;
done

