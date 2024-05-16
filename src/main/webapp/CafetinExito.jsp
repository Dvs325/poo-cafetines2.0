<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Éxito</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        .box {
            max-width: 400px;
            padding: 20px;
            background-color: white;
            margin: 0 auto;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #5c67f2;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #4a54e1;
        }
    </style>
</head>
<body>
<div class="box">
    <h1>¡Éxito!</h1>
    <p>CAFETIN AGREGADO CON EXITO</p>
    <button onclick="window.location.href = 'RegistCafe.jsp';">Regresar al índice</button>
</div>
</body>
</html>