<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creation | Chronomètre</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .card {
            margin:0;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 80%;
            max-width: 600px;
            text-align: center;
        }
        .chronometer {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .buttons {
            display: flex;
            justify-content: center;
        }
        button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }
        #start-button {
            background-color: #4CAF50;
            color: white;
        }
        #pause-button {
            background-color: #f44336;
            color: white;
        }
        #reset-button {
            background-color: #2196F3;
            color: white;
        }
    </style>
</head>
<body>
	<%@ include file="navbar.jsp" %>
    <div class="card">
        <h1>Chronomètre</h1>
        <label id="chronometre" class="chronometer">00:00:00.000</label>
        <div class="buttons">
            <button id="start">Play</button>
            <button id="pause">Pause</button>
            <button id="reset">Reset</button>
        </div>
    </div>

    <script>
        let timer;
        let running = false;
        let milliseconds = 0;
        let seconds = 0;

        function startTimer() {
            if (!running) {
                running = true;
                timer = setInterval(() => {
                    milliseconds++;
                    if (milliseconds == 250) {
                        milliseconds = 0;
                        seconds++;
                    }
                    displayTime();
                }, 1);
            }
        }

        function pauseTimer() {
            running = false;
            clearInterval(timer);
        }

        function resetTimer() {
            running = false;
            clearInterval(timer);
            milliseconds = 0;
            seconds = 0;
            displayTime();
        }

        function displayTime() {
            const hours = Math.floor(seconds / 3600);
            const minutes = Math.floor((seconds % 3600) / 60);
            const secs = seconds % 60;
            const formattedMilliseconds = ("00" + milliseconds).slice(-3); // Formatage des millisecondes
            document.getElementById('chronometre').textContent = String(hours).padStart(2, '0') + ':' + String(minutes).padStart(2, '0') + ':' + String(secs).padStart(2, '0') + '.' + formattedMilliseconds;
        }

        document.getElementById('start').addEventListener('click', startTimer);
        document.getElementById('pause').addEventListener('click', pauseTimer);
        document.getElementById('reset').addEventListener('click', resetTimer);
    </script>
</body>
</html>
