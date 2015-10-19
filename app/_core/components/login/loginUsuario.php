<?php
    
    $newUser = json_decode(file_get_contents('php://input'));
    
    $mysqli = new mysqli("localhost", "root", "", "supermercado");
    /* check connection */
    if (mysqli_connect_errno()) {
        printf("Connect failed: %s\n", mysqli_connect_error());
        exit();
    } 
    $stmt = $mysqli->prepare("Select login(?,?)");
    $stmt->bind_param('ss', $email, $password);
    
    $email = $newUser->email;
    $password = $newUser->password;
    $stmt->execute();
    $stmt->bind_result($nick);
    $stmt->fetch();
    echo $nick;
    $stmt->close();
    //echo("Insertado");
    $mysqli->close();
?>