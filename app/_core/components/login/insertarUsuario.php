<?php
    
    $newUser = json_decode(file_get_contents('php://input'));
	
    $mysqli = new mysqli("localhost", "root", "", "test");
	/* check connection */
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	} 
    $stmt = $mysqli->prepare("insert into prueba(nombre,imagen) values (?,?);");
    $stmt->bind_param('ss', $nombre, $foto);
    
    
    $nombre = $newUser->nombre;
    $foto = $newUser->foto;
    $stmt->execute();
    echo('registrado');
    $stmt->close();
    
    //echo("Insertado");
    $mysqli->close();
?>