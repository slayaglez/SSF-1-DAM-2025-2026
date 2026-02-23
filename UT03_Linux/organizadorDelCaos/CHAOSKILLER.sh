#!/bin/bash

mkdir IMGS DOCS VACIOS TXTS

for archivo in *
do
    [[ -d "$archivo" ]] && continue

	echo "====>>> $archivo"
	if [[ "$archivo" == *.jpg ]]; then
		mv $archivo IMGS/
    elif [[ "$archivo" == *.png ]]; then
		mv $archivo IMGS/
    elif [[ "$archivo" == *.gif ]]; then
		mv $archivo IMGS/
    elif [[ "$archivo" == *.txt ]]; then
		mv $archivo TXTS/
	elif [[ "$archivo" == *.docx ]]; then
		mv $archivo DOCS/
    elif [[ "$archivo" == *.odt ]]; then
		mv $archivo DOCS/
    elif [[ ! -s "$archivo" ]]; then
		mv $archivo VACIOS/
	fi
done