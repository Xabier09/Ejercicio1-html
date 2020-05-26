<?php

    $User = $_GET['User'];
    $Password = $_GET['Password'];
    
    echo "<h2> Información de usuario <h2>" ;
    echo "Nombre de usuario: " . $User . "<br/>";
    echo "Contraseña: " . $Password . "<br/>";
      //header("Location: new.html"); /* Redirect browser */
?>
