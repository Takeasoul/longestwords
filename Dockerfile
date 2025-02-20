# Используем официальный образ Ubuntu
FROM ubuntu:latest

# Устанавливаем зависимости и необходимое ПО
RUN apt-get update && \
    apt-get install -y \
    g++ \
    make \
    libc6 \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Копируем .deb файл в контейнер
COPY ./longest-words-1.0.deb /tmp/longest-words-1.0.deb

# Устанавливаем .deb пакет
RUN dpkg -i /tmp/longest-words-1.0.deb && \
    apt-get install -f

# Устанавливаем рабочую директорию
WORKDIR /usr/bin

# Указываем команду для запуска с параметрами
ENTRYPOINT ["longest_words"]
CMD ["Тестовая фраза длинна", "тест фр длин", "тест тест тест"]
