<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Creation | ToDo List</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}
.container {
	position:relative;
	top:100px;
    max-width: 800px;
    margin: 20px auto;
}
.card {
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin-bottom: 20px;
}
.input-container {
    display: flex;
    align-items: center;
}
.input-container input[type="text"] {
    flex: 1;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ddd;
    border-radius: 5px 0 0 5px;
}
.input-container button {
    padding: 10px 20px;
    border: none;
    background-color: #4CAF50;
    color: white;
    font-size: 16px;
    border-radius: 0 5px 5px 0;
    cursor: pointer;
}
ul {
    list-style-type: none;
    padding: 0;
}
li {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
    border-bottom: 1px solid #ddd;
}
li:last-child {
    border-bottom: none;
}
.delete-button {
    background-color: #f44336;
    color: white;
    padding: 5px 10px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    margin-left: 10px;
}
.confirm-button {
    text-decoration: line-through;
    color: #777;
    margin-right: 10px;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp" %>
<div class="container">
    <div class="card">
        <div class="input-container">
            <input type="text" id="taskInput" placeholder="Ajouter une tâche...">
            <button id="addTaskButton">Ajouter</button>
        </div>
        <ul id="taskList"></ul>
    </div>
</div>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const taskInput = document.getElementById("taskInput");
    const addTaskButton = document.getElementById("addTaskButton");
    const taskList = document.getElementById("taskList");

    addTaskButton.addEventListener("click", function() {
        const taskText = taskInput.value.trim();
        if (taskText !== "") {
            const li = document.createElement("li");
            const button = document.createElement("button");
            button.textContent = taskText;
            li.appendChild(button);
            li.innerHTML += `
                <button class="confirm-button">✓</button>
                <button class="delete-button">Supprimer</button>
            `;
            taskList.appendChild(li);
            taskInput.value = "";
        }
    });

    taskList.addEventListener("click", function(event) {
        if (event.target.classList.contains("delete-button")) {
            event.target.parentElement.remove();
        } else if (event.target.classList.contains("confirm-button")) {
            const span = event.target.parentElement.querySelector("button");
            span.style.textDecoration = "line-through";
        }
    });
});
</script>
</body>
</html>