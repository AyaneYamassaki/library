<?php

    // Declarar as variáveis necessárias para gerar a minha conexão com o BD...
    $hostname = "fdb30.awardspace.net";
    $dbname = "3762230_library";
    $username = "3762230_library";
    $password = "Sch00lL1br4ry";

    try{
        $pdo = new PDO('mysql:host='.$hostname.';dbname='.$dbname, $username, $password);
        $pdo -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        // echo 'Conexao realizada com sucesso!';
    }catch(PDOException $e){
        echo 'Error: '.$e->getMessage();
    }