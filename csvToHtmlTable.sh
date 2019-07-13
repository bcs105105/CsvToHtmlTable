#!/bin/bash

genTable() {
    echo "<div>$1</div>"
    echo '<table width="1000" border="1">'

    while read line; do
        echo '<tr>'

        IFS=,
        for text in $line; do
            echo "<td>$text</td>"
        done

        echo '</tr>'
    done < $1

    echo '</table>'
    echo '<br />'
}

for file in "$@"; do
    htmlFile=${file%.csv}.html
    if [[ -f $htmlFile ]]; then
        echo -n > $htmlFile
    fi

    genTable $file >> $htmlFile
done
