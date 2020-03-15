# Тестовое задание на стажировку

### Инструкция по проверке задания:
1. Скачайте данный репозиторий с помощью кнопки "Clone or download".
2. Установите PostgreSQL и pgAdmin (https://www.postgresql.org/download/).
3. Зайдите в pgAdmin и создайте базу данных:  
![DB creating instruction](https://raw.githubusercontent.com/webdevRoman/gitImages/master/VSK/vsk-test-1.png)  
4. Откройте Query Tool:  
![Query Tool](https://raw.githubusercontent.com/webdevRoman/gitImages/master/VSK/vsk-test-2.png)  
5. Запустите скрипт из файла `db.sql` (из скачанного с GitHub репозитория):  
![SQL script start](https://raw.githubusercontent.com/webdevRoman/gitImages/master/VSK/vsk-test-3.png)  
6. Установите OpenServer (https://ospanel.io/download/).  
7. Установите composer в OpenServer (http://nikolaev-web.ru/blog/installing_the_composer_on_openServer/).  
8. В папке `domains` в OpenServer создайте новую папку и переместите в нее все скачанные с GitHub файлы.  
9. В папке `app` в файле `db.php` введите название созданной базы данных, имя пользователя (по умолчанию "postgres") и пароль:  
![DB configuration](https://raw.githubusercontent.com/webdevRoman/gitImages/master/VSK/vsk-test-4.png)  
10. Используя командную строку в папке с проектом (...\OSPanel\domains\\\[название папки\]\\), выполните команду установки зависимостей composer: `php composer.phar install`.  
11. Запустите OpenServer (...\OSPanel\Open Server x64.exe или ...\OSPanel\Open Server x86.exe) и сам сервер:  
![OpenServer](https://raw.githubusercontent.com/webdevRoman/gitImages/master/VSK/vsk-test-5.png)  
12. Откройте сайт:  
![Website](https://raw.githubusercontent.com/webdevRoman/gitImages/master/VSK/vsk-test-6.png)  
13. Проверьте работу приложения.