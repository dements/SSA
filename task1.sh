#/bin/bash

# 1. Найти все системные группы и получить толь их уникальные имена и id
awk -F: '{if ($1 ~ /sudo|root|bin|adm|www-data|sasl/) print $1,$3}' /etc/group

# 2.Найти все файлы и директории, который имеют права для доступа соответствующих user и group (к примеру root)
find . -user dementiev

# 3. Найти все скрипты (или любой другой тип файлов на ваш выбор) в указанной директории и ее поддиректориях
find /var/* -type f -name *.log

# 4. Выполнить рекурсивный поиск слов или фразы для определенного типа файлов
sudo find /var/* -type f -name *.log -exec grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" {} +

# 5. Рекурсивно изменить права доступа к файлу в заданной директории
chmod -R 0777 /home/dementiev/task1.sh

# 6. Сравнить рекурсивно две директории и отобразить только отличающиеся файлы
diff -r /home/dementiev /home

# 7. Вывести список типов и количества активных сетевых соединений
#ss  is  used to dump socket statistics. It allows showing information similar to netstat.  It can display more
#TCP and state informations than other tools.
# -n --numeric -a --both listening and non-listening -o --options (established,connected, etc.)
ss -na -o state established

# 8. Переназначить существующую символьную ссылку.
ln -sfT /home/newuser/test linkname

# 9. Найти все сломанные ссылки и удалить их.
 find -L /home/dementiev -type l -delete #delete
 find -L /home -type l -exec rm -i {} + #delete with confirmation

#10. Рекурсивно скопировать структуру каталогов из указанной директории. (без файлов)
find test/* -type d -exec mkdir -p ~/new/{} \;

#11. Вывести список всех пользователей системы (только имена) по id
sudo awk -F: '{if ($7 ~ /\/bin\/bash/) print $1}' /etc/passwd