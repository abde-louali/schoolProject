<?php
include "../model/modelP.php";
session_start();
if($_SERVER["REQUEST_METHOD"] === "POST"){
    $error = "";
    foreach($_POST as $key=>$value){
        $$key = $value;
    }
    if(empty($user)||empty($pass)){
        $error = "cin or password are empty ";
    }else{
        $selected = selectADM($user,$pass);
        if(!$selected){
            $error = "cin or password incorect";
        }
    }

    if(empty($error)){
        

      $succes = [
        "username"=>$user,
        "password"=>$pass
      ];
      
      $_SESSION["succes"] = $succes;
      header("location:AdminP.php");
    }
    else{
        setcookie("errors",$error,time()+24*60*60);
        $_COOKIE["errors"] = $error;
        header("location:loginA.php") ;
    }

}