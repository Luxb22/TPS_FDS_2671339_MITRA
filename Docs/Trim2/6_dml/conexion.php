<?php
//declarar la variables en donde se guardaran los valores de la conexion

 $servidor ="localhost";
 $user="root";
 $pss ="";
 $bd ="mitra";
 $conecta = mysqli_connect( $servidor, $user, $password, $bd );

 if($conexion->connect_error){
    die("Error al conectar la base de datos de la pagina".$conexion->connect_error);
 }
?>