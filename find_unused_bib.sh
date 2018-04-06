#!/bin/bash
#
# Search seec.bib for unused citation entries.
# May miss references with names that are used in other contexts in tex files,
# e.g., 'foo', if 'foo' appears as text, but not a latex citation.
#

REFS=($(grep -e "@" seec.bib | cut -d'{' -f 2 | cut -d',' -f1))
# echo ${REFS[@]}

for r in "${REFS[@]}"; do
	# echo $r
	# grep "$r" *.tex
	if ! grep -q "$r" ./*.tex; then
		echo "$r"
	fi
done
