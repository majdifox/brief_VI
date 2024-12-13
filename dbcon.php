<?php 

// $servername = "localhost";
// $username = "username";
// $password = "password";

// // Create connection
// $conn = new mysqli($servername, $username, $password);

// // Check connection
// if ($conn->connect_error) {
//   die("Connection failed: " . $conn->connect_error);
// }
// echo "Connected successfully";

define("HOSTNAME", "localhost");
define("USERNAME", "root");
define("PASSWORD","");
define("DATABASE","gym");

$connection = mysqli_connect(HOSTNAME,USERNAME,PASSWORD,DATABASE);

if(!$connection){
  die("Connection failed");


}

else{
 
}

?>