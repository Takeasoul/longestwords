#!/bin/bash

set -e  # Завершить скрипт при ошибке

 

echo "Запуск тестов..."

./usr/bin/longest_words <<< "Пример текста" | grep "Пример"

if [ $? -ne 0 ]; then

  echo "Тест не пройден!"

  exit 1

fi

 

echo "Все тесты пройдены успешно!"
