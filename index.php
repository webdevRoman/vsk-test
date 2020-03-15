<!doctype html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Тестовое задание ВСК</title>
</head>
<body>
<form action="app/form.php" method="post">
  <label for="start-date">Дата начала периода</label><br>
  <input type="date" name="start" id="start-date"><br><br>
  <label for="end-date">Дата окончания периода</label><br>
  <input type="date" name="end" id="end-date"><br><br>
  <button type="submit" id="submit-btn">Получить отчет</button>
</form>
<a href="#" id="download-btn" style="display: none">Download</a>

<br>

<script src="app.js"></script>
</body>
</html>