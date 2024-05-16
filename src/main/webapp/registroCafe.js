var contadorProductos = 1;

function agregarProducto() {
    var divMenu = document.getElementById("menu");
    var nuevoProducto = document.createElement("div");
    nuevoProducto.classList.add("input-group");

    nuevoProducto.innerHTML = '<span class="input-group-text">Producto</span>' +
        '<input type="text" class="form-control" name="productoNombre' + contadorProductos + '" placeholder="Nombre del Producto">' +
        '<span class="input-group-text">Precio</span>' +
        '<input type="number" class="form-control" name="productoPrecio' + contadorProductos + '" placeholder="$">' +
        '<button type="button" class="btn btn-outline-secondary" onclick="eliminarProducto(this)">Eliminar</button>';
    divMenu.appendChild(nuevoProducto);

    var espacio = document.createElement("br");
    divMenu.appendChild(espacio); // Agregar un espacio entre los grupos de productos

    contadorProductos++;
}

function eliminarProducto(elemento) {
    var divMenu = document.getElementById("menu");
    divMenu.removeChild(elemento.parentNode);
    divMenu.removeChild(elemento.nextSibling); // Eliminar también el espacio después del grupo de productos
}
