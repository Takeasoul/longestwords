#!/bin/bash

set -e  # Завершить скрипт при ошибке

 

PACKAGE_NAME="longest-words"

VERSION="1.0"

ARCH="amd64"

 

echo "Создание структуры для .deb пакета..."

mkdir -p ${PACKAGE_NAME}-${VERSION}/DEBIAN

mkdir -p ${PACKAGE_NAME}-${VERSION}/usr/bin

 

echo "Копирование бинарника..."

cp usr/bin/longest_words ${PACKAGE_NAME}-${VERSION}/usr/bin/


 

echo "Сборка .deb пакета..."

dpkg-deb --build ${PACKAGE_NAME}-${VERSION}

echo "Пакет создан: ${PACKAGE_NAME}-${VERSION}.deb"
