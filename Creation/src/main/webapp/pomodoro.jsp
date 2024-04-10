<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Creation | Pomodoro</title>
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
        }
        table {
        	border:none;
		    border-collapse: collapse;
		    width: 100%;
		}
		
		th, td {
		    border: none;
		    border-bottom: 1px solid #ddd;
		    padding: 8px;
		    text-align: left;
		}
       
        form{
        	diaplay:flex;
        	justify-content:space-around;
        }
        input[type="text"], input[type="number"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 90%;
            margin-bottom: 10px;
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
        #chronometre {
            font-size: 24px;
            font-weight: bold;
        }
        .div_button {
        	padding:10px;
        	display:flex;
        	justify-content:space-around;
        }
        .div_button_add{
        	display:flex;
        	justify-content:center;
        }
    </style>
    <script>
        var timer;
        var minutes = 0;
        var secondes = 0;
        var millisecondes = 0;
        var hours = 0;

        function isTableauVide() {
            var tableau = document.getElementById('tableau');
            var lignes = tableau.rows.length;
            return lignes <= 0;
        }

        function calculerSomme() {
            var somme = 0;
            var tableau = document.getElementById('tableau');
            var tds = tableau.getElementsByTagName('td');
            for (var i = 0; i < tds.length; i++) {
                if (i % 2 === 1) { // Assurez-vous de ne pas ajouter les valeurs de texte
                    var valeur = parseInt(tds[i].innerText, 10);
                    somme += isNaN(valeur) ? 0 : valeur;
                }
            }
            return somme;
        }

        function startChronometre() {
            if (isTableauVide()) {
                return;
            }
            timer = setInterval(function() {
                millisecondes--;
                if (millisecondes < 0) {
                    millisecondes = 99;
                    secondes--;
                }
                if (secondes < 0) {
                    secondes = 59;
                    minutes--;
                }
                if (minutes < 0) {
                    minutes = 59;
                    hours--;
                }
                var displayTime = (hours < 10 ? "0" + hours : hours) + ":" +
                                   (minutes < 10 ? "0" + minutes : minutes) + ":" +
                                   (secondes < 10 ? "0" + secondes : secondes) + ":" +
                                   (millisecondes < 10 ? "00" + millisecondes : millisecondes < 100 ? "0" + millisecondes : millisecondes);
                document.getElementById("chronometre").innerText = displayTime;
                if (hours < 0 && minutes < 0 && secondes < 0 && millisecondes < 0) {
                    clearInterval(timer);
                    alert('Temps écoulé');
                }
            }, 10);
        }

        function pauseChronometre() {
            clearInterval(timer);
        }

        function resetChronometre() {
            clearInterval(timer);
            minutes = calculerSomme();
            secondes = 0;
            millisecondes = 0;
            hours = 0;
            document.getElementById("chronometre").innerText = (hours < 10 ? "0" + hours : hours) + ":" +
                                                               (minutes < 10 ? "0" + minutes : minutes) + ":" +
                                                               (secondes < 10 ? "0" + secondes : secondes) + ":" +
                                                               (millisecondes < 10 ? "00" + millisecondes : millisecondes < 100 ? "0" + millisecondes : millisecondes);
        }

        function ajouterAuTableau() {
            var texte = document.getElementById('texte').value;
            var nombre1 = parseInt(document.getElementById('nombre1').value, 10);
            var tableau = document.getElementById('tableau');

            var ligne = tableau.insertRow(-1);
            var cell1 = ligne.insertCell(0);
            var cell2 = ligne.insertCell(1);
            var cell3 = ligne.insertCell(2);

            cell1.innerHTML = texte;
            cell2.innerHTML = nombre1;
            cell3.innerHTML = '<button onclick="supprimerLigne(this)">Supprimer</button>';

            resetChronometre(); // Mettre à jour le chronomètre après l'ajout d'une ligne
        }


        function supprimerLigne(bouton) {
            var ligneASupprimer = bouton.parentNode.parentNode;
            ligneASupprimer.parentNode.removeChild(ligneASupprimer);

            resetChronometre(); // Mettre à jour le chronomètre après la suppression d'une ligne
        }

        window.onload = function() {
            setInterval(function() {
                if (isTableauVide()) {
                    document.getElementById("start-button").style.display = 'none';
                    document.getElementById("pause-button").style.display = 'none';
                    document.getElementById("reset-button").style.display = 'none';
                } else {
                    document.getElementById("start-button").style.display = 'block';
                    document.getElementById("pause-button").style.display = 'block';
                    document.getElementById("reset-button").style.display = 'block';
                }
            }, 1000);
        };
    </script>
</head>
<body>
	<%@ include file="navbar.jsp" %>
    <div class="card">
        <form>
            <label for="texte">Activité </label>
            <input type="text" id="texte"><br><br>
            <label for="nombre1">Durée</label>
            <input type="number" id="nombre1"><br><br>
            <div class="div_button_add">
            	<button type="button" onclick="ajouterAuTableau()">Ajouter aux travail</button>
            </div>
        </form>
        <br>
        <table border="1" id="tableau">

        </table>
        <br>
        <p>Temps restants</p>
        <span id="chronometre">00:00:00:000</span>
        
        <div class="div_button">
        	<button type="button" id="start-button" onclick="startChronometre()">Start</button>
	        <button type="button" id="pause-button" onclick="pauseChronometre()">Pause</button>
	        <button type="button" id="reset-button" onclick="resetChronometre()">Reset</button>
        </div>
    </div>
</body>
</html>
