<?php

    $objeto = json_decode(file_get_contents('php://input'));

    $mysqli = new mysqli("localhost", "root", "", "supermercado");

	/* check connection */
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	}

    $stmt = $mysqli->prepare("CALL insertarProducto(?, ?, ?, ?, ?, ?, ?)");


    $stmt->bind_param('isiiiis', $id, $nombre, $cantidad, $costo, $precio_final, $descuento, $foto);

    $orden = $objeto->orden->ORDEN;
    $id = $objeto->codigo;
    $nombre = $objeto->nombre;
    $cantidad = $objeto->cantidad;
    $costo = $objeto->costo;
    $precio_final = $objeto->precio_final;
    $descuento = $objeto->descuento;
    $foto = $objeto->foto;

    $stmt->execute();
    echo('guardado');
    $stmt->close();

    // echo("Insertado");
    $mysqli->close();

?>
