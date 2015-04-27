<?php

$host="mysql5.000webhost.com"; // Host name 
$username="username"; // Mysql username 
$password="pwd"; // Mysql password 
$db_name="ios"; // Database name 
$tbl_name="donor2"; // Table name 

// Connect to server and select databse.
mysql_connect("$host", "$username", "$password")or die("cannot connect"); 
mysql_select_db("$db_name")or die("cannot select DB");

//header('Content-Type: application/json');
$blood=filter_input(INPUT_GET,'bloodgroup');
$area=filter_input(INPUT_GET,'area');

if(empty($blood)){
//Getting the values alphabetically
$sql="SELECT * FROM $tbl_name where state='$area' OR city='$area' OR country='$area' ORDER BY firstname";
}
else{
$sql="SELECT * FROM $tbl_name where bloodgroup='$blood' ORDER BY firstname";
}
$result=mysql_query($sql);


$output="[";
while($row = mysql_fetch_array($result)){


$records=array("FirstName"=>$row['firstname'],"LastName"=>$row['lastname'],"BloodGroup"=>$row['bloodgroup'],"Email"=>$row['email'],"Phone"=>$row['phone'],"State"=>$row['state'],"City"=>$row['city'],"Country"=>$row['country']);

$output.= json_encode($records).",";
}
$output = substr($output, 0, strlen($output)-1) . "]";
echo $output;
?>