<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Creation | Accueil</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }

        header {
        	position:relative;
        	top:30px;
            background-color: #333;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 36px;
            clip-path: polygon(0 0, 100% 0, 100% 75%, 50% 100%, 0 75%);
            margin-bottom: 20px;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        p {
            margin-bottom: 20px;
        }

        .feature {
            background-color: #fff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .feature:hover {
            transform: translateY(-5px);
            transition: transform 0.3s;
        }

        .feature a {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
	<%@ include file="navbar.jsp" %>
    <header>
        Maximisez votre productivité quotidienne
    </header>
    <div class="container">
        <div class="feature" id="pomodoro">
            <h2>Pomodoro</h2>
            <p>Utilisez la technique Pomodoro pour améliorer votre concentration et votre productivité.</p>
            <a href="Pomodoro">Commencer</a>
        </div>
        <div class="feature" id="todolist">
            <h2>To-Do List</h2>
            <p>Organisez vos tâches et gardez une trace de ce que vous devez faire.</p>
            <a href="Todo">Découvrir</a>
        </div>
        <div class="feature" id="chronometre">
            <h2>Chronomètre</h2>
            <p>Utilisez un chronomètre pour suivre le temps que vous passez sur chaque tâche.</p>
            <a href=Chrono">Utiliser</a>
        </div>
    </div>
    <footer>
        © 2024 Creation | by RAKOTO Herilala
    </footer>
</body>
</html>
