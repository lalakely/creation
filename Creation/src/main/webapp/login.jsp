<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Creation | Inscription</title>
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
      margin: 0;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      padding: 20px;
      width: 80%;
      max-width: 400px;
      text-align: center;
    }

    input {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      border: 1px solid #ccc;
      border-radius: 4px;
      padding: 8px;
      margin-bottom: 10px;
      width: 100%;
      box-sizing: border-box;
    }

    button {
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      background-color: #4CAF50;
      color: white;
    }

    a {
      text-decoration: none;
      color: #2196F3;
      outline: none;
    }
  </style>
</head>
<body>
  <div class="card">
    <form method="post" action="Accueil">
      <p>Connexion </p>
      <input type="text" placeholder="Username">
      <input type="text" placeholder="Password">
      <button type="submit">Connexion</button>
    </form>
    <p>ou</p>
    <a href="Signin">S'inscrire</a>
  </div>
</body>
</html>