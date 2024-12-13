<?php include('dbcon.php'); ?>

<?php
    $id = $_GET['id'];
    $query = "DELETE FROM `membre` WHERE `membre`.`id_membre` = '$id'";



    $result = mysqli_query($connection,$query);

    if(!$result){

            die("Query Failed".mysqli_error());

 
    }
    else{

        header(`location:index.php?delete_msg=The member you selected has been removed.`);
    }


?>

