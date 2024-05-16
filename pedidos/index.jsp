<!DOCTYPE html>
<html>
<head>
    <title>Tomar Pedido</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>Tomar Pedido</h2>
    <form action="ProcesarPedidoServlet" method="post">
        Carnet: <input type="text" name="carnet"><br>
        ID Desayuno: <input type="text" name="iddes"><br>
        ID Almuerzo: <input type="text" name="idal"><br>
        ID Snack: <input type="text" name="idsnack"><br>
        ID Bebida: <input type="text" name="idbebida"><br>
        Precio: <input type="text" name="precio"><br>
        Hora: <input type="text" name="hora"><br>
        Día: <input type="text" name="dia"><br>
        <input type="submit" value="Enviar Pedido">
    </form>
</body>
</html>
