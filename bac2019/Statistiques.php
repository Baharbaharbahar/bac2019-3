<?php
$sandage = $_POST["sandage"];
require("config.php");
$conn = mysqli_connect($server, $username, $password, $bd);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$sql1 = "SELECT DateDebut FROM sondage WHERE NumS = '$sandage';";
$res1 = mysqli_query($conn, $sql1);
$e = mysqli_fetch_array($res1);

$sql2 = "SELECT * FROM reponse WHERE NumS = '$sandage';";
$res2 = mysqli_query($conn, $sql2);

// $d1 = strtotime($e[0]);
// $d2 = strtotime("now");

if ($d1 > $d2) {
    echo ("Sondage non encore lancé !");
} else if (mysqli_num_rows($res2) == 0) {
    echo ("Aucune Participation enregistrée à ce moment !");
} else {
    $sql0 = "SELECT COUNT(DISTINCT idparticipant) FROM reponse WHERE NumS = '$sandage';";
    $res0 = mysqli_query($conn, $sql0);

    $sql2 = "SELECT COUNT(DISTINCT p.idparticipant) FROM reponse r, participant p WHERE r.idparticipant = p.idparticipant AND NumS = '$sandage' AND genre = 'F';";
    $res2 = mysqli_query($conn, $sql2);

    $sql3 = "SELECT COUNT(DISTINCT p.idparticipant) FROM reponse r, participant p WHERE r.idparticipant = p.idparticipant AND NumS = '$sandage' AND genre = 'M';";
    $res3 = mysqli_query($conn, $sql3);

    $totalParticipants = mysqli_fetch_array($res0)[0];
    $totalFemale = mysqli_fetch_array($res2)[0];
    $totalMale = mysqli_fetch_array($res3)[0];
?>

    <p>Statistiques du Sondage</p>
    <p>Nombre Total des participants au Sondage : <?php echo $totalParticipants; ?></p>
    <p>Nombre des femmes : <?php echo $totalFemale; ?></p>
    <p>Nombre des hommes : <?php echo $totalMale; ?></p>
    <table border="1">
        <tr>
            <td colspan="2">&nbsp;</td>
            <td colspan="3">Pourcentages</td>
        </tr>
        <tr>
            <td>N°</td>
            <td>Question</td>
            <td>&quot;Oui&quot;</td>
            <td>&quot;Non&quot;</td>
            <td>&quot;Sans Avis&quot;</td>
        </tr>
        <?php
        $sql1 = "SELECT contenu FROM Question WHERE NumS = '$sandage';";
        $res1 = mysqli_query($conn, $sql1);
        while ($en = mysqli_fetch_array($res1)) {
            $sql2 = "SELECT * FROM reponse WHERE NumS = '$sandage' AND rep = 'O';";
            $res2 = mysqli_query($conn, $sql2);
            $sql3 = "SELECT * FROM reponse WHERE NumS = '$sandage' AND rep = 'N';";
            $res3 = mysqli_query($conn, $sql3);
            $sql4 = "SELECT * FROM reponse WHERE NumS = '$sandage' AND rep = 'S';";
            $res4 = mysqli_query($conn, $sql4);

            $oui = mysqli_num_rows($res2);
            $non = mysqli_num_rows($res3);
            $sans = mysqli_num_rows($res4);
            $all = $totalParticipants;

            if ($oui > 0 && $non > 0 && $sans > 0) {
                $a = ($oui / $all) * 100;
                $b = ($non / $all) * 100;
                $c = ($sans / $all) * 100;
            }
        ?>
            <tr>
                <td><?php echo $en[0] ?></td>
                <td><?php echo $e[0] ?></td>
                <td><?php echo round($a, 2); ?></td>
                <td><?php echo round($b, 2); ?></td>
                <td><?php echo round($c, 2); ?></td>
            </tr>
        <?php
        }
        ?>
    </table>
<?php
}
mysqli_close($conn);
?>
