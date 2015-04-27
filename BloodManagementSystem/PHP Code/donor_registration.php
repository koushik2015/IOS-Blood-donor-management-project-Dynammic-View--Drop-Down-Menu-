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



$fname = filter_input(INPUT_GET,'firstname');
$lname = filter_input(INPUT_GET,'lastname');
$blood=filter_input(INPUT_GET,'bloodgroup');
$email = filter_input(INPUT_GET,'email');
$phone = filter_input(INPUT_GET,'phone');
$state = filter_input(INPUT_GET,'state');
$city = filter_input(INPUT_GET,'city');
$country = filter_input(INPUT_GET,'country');
$uid=filter_input(INPUT_GET,'uid');
$passcode=filter_input(INPUT_GET,'passcode');
$count=0;

$sql="SELECT * FROM $tbl_name where email='$email'";
$result=mysql_query($sql);
while($row = mysql_fetch_array($result)){
 $count++;
}

if($count<1)
{
$sql1 = "INSERT INTO $tbl_name (firstname, lastname,bloodgroup,email,phone,state,city,country,uid,passcode) VALUES ('$fname', '$lname', '$blood','$email', '$phone', '$state', '$city', '$country','$uid','$passcode');";
$res = mysql_query($sql1);
echo json_encode($res);
}
else{
echo 'invalid';
}


?>