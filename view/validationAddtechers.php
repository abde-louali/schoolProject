<?php
session_start();
include "../model/modelP.php";
if($_SERVER["REQUEST_METHOD"] === "POST"){
    $errors = []; 
    foreach($_POST as $key=>$value){
        $$key = $value;
    }
    if(empty($usern)){
        $errors[] = "required username";
    }
    else if(strlen($usern)<4){
        $errors[] = "username must be grather than 4";
    }
   
    if(empty($passw)){
        $errors[] = "required password ";
    }
    else if(strlen($passw)<6){
        $errors[] = " password must be grather than 6 ";
    }
    // if(empty($email)){
    //     $errors[] = "required email";
    // }
    // // else if(!filter_var(FILTER_VALIDATE_EMAIL,$email)){
    // //     $errors[] = " email incorect ";
    // // }
    // if(empty($pass)){
    //     $errors[] = "required password ";
    // }
    // else if(strlen($pass)<6){
    //     $errors[] = " password must be grather than 4 ";
    // }
    // if(empty($cpass)){
    //     $errors[] = "required confirmation password ";
    // }
    // else if($pass!=$cpass){
    //     $errors[] = " incorect confirmation password ";
    // }

    if(empty($errors)){
        $insert = insertTescher($usern,$passw);
        $succes = "  add seccufuly!";
        setcookie("succes",$succes,time()+24*60*60);
        $_COOKIE["succes"] = $succes;
        header("location:AdminP.php");
    }
    else{
        $_SESSION["errors"] = $errors;
        header("location:addS.php");
    }

}