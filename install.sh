#!/bin/bash

# --- Ссылка на ваш основной скрипт в репозитории ---
MAIN_SCRIPT_URL="https://raw.githubusercontent.com/anvar-moscow/antenka_ipv4/main/script_proxy"
MAIN_SCRIPT_NAME="script_proxy"

# --- Загрузка основного скрипта ---
echo "Загрузка основного скрипта из репозитория..."
if command -v curl &> /dev/null; then
    curl -s -o "$MAIN_SCRIPT_NAME" "$MAIN_SCRIPT_URL"
elif command -v wget &> /dev/null; then
    wget -q -O "$MAIN_SCRIPT_NAME" "$MAIN_SCRIPT_URL"
else
    echo "Ошибка: ни curl, ни wget не установлены."
    exit 1
fi

# Проверка загрузки
if [ ! -f "$MAIN_SCRIPT_NAME" ]; then
    echo "Не удалось загрузить основной скрипт. Проверьте ссылку."
    exit 1
fi

# --- Запуск основного скрипта (с правами root) ---
chmod +x "$MAIN_SCRIPT_NAME"
sudo ./"$MAIN_SCRIPT_NAME"

# --- Удаление временного файла (опционально) ---
rm -f "$MAIN_SCRIPT_NAME"