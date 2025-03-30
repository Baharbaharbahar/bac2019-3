<?php

$mail=$_POST['email'];
$mdp=$_POST['password'];
$genre=$_POST['genre'];
$R1=$_POST['a'];
$R2=$_POST['b'];
$R3=$_POST['c'];
require("config.php");
$sql1="select * from participant where  mail='$mail';";
$res1=mysqli_query($conn,$sql1);
if ( mysqli_num_rows($res1)!=0)
  {
    $sql2="select *from participant where mail='$mail' and mdp='$mdp';";
	$res2=mysqli_query($conn,$sql2);
	if (mysqli_num_rows($res2)==0)
	    {
			echo ("Erreur d'authentification  !!!");
		}
	else
	    {
			$ligne=mysqli_fetch_array($res2);
			$participant=$ligne[0];
            $sql3="select * from reponse where (idparticipant='$participant') and (NumS=1) and  (NumQ in (1,2,3));";
			$res3=mysqli_query($conn,$sql3);
			if (mysqli_num_rows($res3)==3)
	             {
                   $sql4="update reponse set rep='$R1' where (idparticipant='$participant') and  (NumS=1) and (NumQ=1); ";
			       mysqli_query($conn,$sql4);
                   $sql5="update reponse set rep='$R2' where (idparticipant='$participant') and  (NumS=1) and (NumQ=2) ;";
				   mysqli_query($conn,$sql5);
                   $sql6="update reponse set rep='$R3' where (idparticipant='$participant') and  (NumS=1) and (NumQ=3) ;";
                   mysqli_query($conn,$sql6);  
                   if (mysqli_affected_rows($conn)>0)
				      {
						echo ("Mise à jour effectuée avec succès");  
					  }
                   else
				      {
						echo ("Mise à jour non effectuée !!!! problème de mise à jour ");  
					  }					   
		         }
			else
			   {
                   $sql4="Select * from participant where idparticipant='$participant';";
				   $res4=mysqli_query($conn,$sql4);
					if (mysql_num_rows($res4)!=0)
	                    {
                            $sql5="insert into  reponse  values (1,1,'$participant','$R1'), (2,1,'$participant','$R2'),(3,1,'$participant','$R3');";
							$res5=mysqli_query($conn,$sql);
							if (mysqli_affected_rows($conn) >0)
							   {
			                     echo ("Participation au sondage effectuée avec succès");
							   }
							else
				               {
						          echo ("Insertion non effectuée !!!! problème d'insertion ");  
					           }	 
		                }
				    
			   }
		}
  }
  else
	{
        $sql5="insert into participant (mail,mdp,genre)  values ('$mail','$mdp','$genre');";
		$res5=mysqli_query($conn,$sql5);
        $sql="select idparticipant from participant where  mail='$mail' and mdp='$mdp';";
		$res=mysqli_query($conn,$sql);
		$ligne=mysqli_fetch_row($res);
		$new_participant=$ligne[0];
        $sql6="insert into  reponse  values (1,1,'$new_participant','$R1'), (2,1,'$new_participant','$R2'),(3,1,'$new_participant','$R3'); ";
		$res6=mysqli_query($conn,$sql6);
		if (mysqli_affected_rows($conn) >0)
		   {
		        echo ("Inscription et participation au sondage effectuées avec succès");
		   }

	}

mysqli_close($conn);
?>
