<?php

    $mysqli = new mysqli("localhost", "root", "", "supermercado");

	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	}

    $query = "CALL seleccionarProductos()";
    $result = $mysqli->query($query);
    // fetch the result / convert resulte in to array
    $outp = "[";
    //WHILE ($rows = mysql_fetch_array($query)):
    while($row = $result->fetch_array())
	{
		if ($outp != "[") {$outp .= ",";}
        $outp .= '{"codigo":"'  . $row["codigo"] . '",';
        $outp .= '"nombre":"'   . $row["nombre"]        . '",';
        $outp .= '"cantidad":"'   . $row["cantidad"]        . '",';
        $outp .= '"costo":"'   . $row["costo"]        . '",';
        $outp .= '"precio_final":"'   . $row["precio_final"]        . '",';
        $outp .= '"descuento":"'   . $row["descuento"]        . '",';
        $outp .= '"foto":"'   . $row["foto"]. '"}';
       // $rows[] = $row;
	}
    //endwhile;
    $outp .="]";
    echo($outp);

    /* free result set */
$result->close();

/* close connection */
$mysqli->close();

?>
