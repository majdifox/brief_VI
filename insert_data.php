<?php


include("dbcon.php");

    $f_name = $_POST['f_name'];
    $l_name = $_POST['l_name'];
    $email = $_POST['email'];
    $telephone = $_POST['telephone'];

    $query = "INSERT INTO `membre`( `NOM`, `PRENOM`, `EMAIL`, `TELEPHONE`) VALUES ('$f_name','$l_name','$email',$telephone)";

    $result = mysqli_query($connection,$query);
    

    if(!$result){

        die("Query Failed".mysqli_error());
    }

    else{
        header(`location:index.php?insert_msg=Your data has been added successfully`);
    }


?>