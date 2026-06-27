#!/bin/bash
set -e

echo "=== Установка Docker ==="
if ! command -v docker &> /dev/null; then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    rm get-docker.sh
else
    echo "Docker уже установлен"
fi

echo "=== Клонирование репозитория ==="
if [ ! -d "/opt/shvirtd-example-python" ]; then
    git clone https://github.com/irbis36/shvirtd-example-python.git /opt/shvirtd-example-python
else
    echo "Репозиторий уже существует"
fi

echo "=== Запуск проекта ==="
cd /opt/shvirtd-example-python
docker compose up -d --build

echo "=== Проект запущен ==="
docker ps -a
