Gym Management Project 🏋️‍♂️💪

1. Introduction 📋

This project manages gym members, activities, and reservations using a MySQL database and PHP scripts for CRUD operations (Create, Read, Update, Delete).

2. Database Setup 🗄️

2.1. Database Creation

Database Name: gym

2.2. Tables Created

a. Table activite 📅

CREATE TABLE `activite` (
  `id_activite` int(11) NOT NULL,
  `NOM_ACTIVITE` varchar(50) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `CAPACITE` int(11) DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `disponibile` tinyint(1) DEFAULT NULL
);

b. Table membre 👥

CREATE TABLE `membre` (
  `id_membre` int(11) NOT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `PRENOM` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `TELEPHONE` varchar(15) DEFAULT NULL
);

c. Table reservation 📝

CREATE TABLE `reservation` (
  `id_reservation` int(11) NOT NULL,
  `idmembre` int(11) NOT NULL,
  `idactivite` int(11) NOT NULL,
  `date_reservation` datetime DEFAULT current_timestamp(),
  `statut` enum('Confirmee','Annulee') DEFAULT 'Confirmee'
);

3. Database Connection (dbcon.php) 🔗

Description

This file establishes the database connection.

Code

<?php
define("HOSTNAME", "localhost");
define("USERNAME", "root");
define("PASSWORD", "");
define("DATABASE", "gym");

$connection = mysqli_connect(HOSTNAME, USERNAME, PASSWORD, DATABASE);

if (!$connection) {
    die("Database connection failed");
}
?>

Explanation

Defines connection constants.

Connects using mysqli_connect().

Handles connection errors.

4. PHP Scripts 💻

4.1. Data Insertion (insert_data.php) ➕

Description

Inserts member data into the membre table from a form.

Code

<?php
include("dbcon.php");

$f_name = $_POST['f_name'];
$l_name = $_POST['l_name'];
$email = $_POST['email'];
$telephone = $_POST['telephone'];

$query = "INSERT INTO `membre`(`NOM`, `PRENOM`, `EMAIL`, `TELEPHONE`) VALUES ('$f_name','$l_name','$email','$telephone')";

$result = mysqli_query($connection, $query);

if (!$result) {
    die("Query Failed " . mysqli_error($connection));
} else {
    header("Location: index.php?insert_msg=Data added successfully");
}
?>

Explanation

Connects to the database.

Retrieves form data.

Inserts data into membre.

Redirects on success.

4.2. Data Deletion (delete_member.php) ❌

Description

Deletes a member based on id_membre.

Code

<?php
include('dbcon.php');

$id = $_GET['id'];
$query = "DELETE FROM `membre` WHERE `id_membre` = '$id'";

$result = mysqli_query($connection, $query);

if (!$result) {
    die("Query Failed " . mysqli_error($connection));
} else {
    header("Location: index.php?delete_msg=Member deleted.");
}
?>

Explanation

Connects to the database.

Retrieves the member ID.

Executes the deletion query.

Redirects on success.

5. User Interface (index.php) 📊

Description

This page provides the user interface for interacting with gym data, including member and reservation listings and form submissions.

6. Conclusion 🎯

The Gym Management Project efficiently manages members, activities, and reservations through a MySQL database and PHP scripts. Key features include data insertion, deletion, and dynamic display via web forms.

Author: Your Name ✍️License: MIT 📄

How to Run: 🚀

Clone the repository.

Import the SQL database.

Configure dbcon.php as needed.

Launch the project in a web server environment (e.g., XAMPP).

