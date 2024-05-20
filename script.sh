#!/bin/bash

read -p "Введите слово, которое нужно заменить: " old_word
read -p "Введите новое слово: " new_word
read -p "Введите путь к директории с текстовыми файлами: " directory
touch ChangeLists.txt

for file in "$directory"/*.txt; do
    if grep -q "$old_word" "$file"; then
        sed -i "s/$old_word/$new_word/g" "$file"
        echo "$file" >> modified_files.txt
    fi
done

echo "Список измененных файлов сохранен в файле 'ChangeLists.txt'."
