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

 

echo "Создание control файла..."

echo "Package: ${PACKAGE_NAME}" > ${PACKAGE_NAME}-${VERSION}/DEBIAN/control
echo "Version: ${VERSION}" >> ${PACKAGE_NAME}-${VERSION}/DEBIAN/control
echo "Architecture: ${ARCH}" >> ${PACKAGE_NAME}-${VERSION}/DEBIAN/control
echo "Maintainer: KIRIKITA <odenter2003@gmail.com>" >> ${PACKAGE_NAME}-${VERSION}/DEBIAN/control
echo "Description: Программа для нахождения самых длинных слов в каждой фразе текста" >> ${PACKAGE_NAME}-${VERSION}/DEBIAN/control


 

echo "Сборка .deb пакета..."

dpkg-deb --build ${PACKAGE_NAME}-${VERSION}

echo "Пакет создан: ${PACKAGE_NAME}-${VERSION}.deb"
