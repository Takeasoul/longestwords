#!/bin/bash

set -e  # Завершить скрипт при ошибке

 

echo "Сборка проекта..."

make -C src

mkdir -p usr/bin

mv src/longest_words usr/bin/

echo "Сборка завершена!"

