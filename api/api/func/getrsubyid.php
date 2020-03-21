<?php
/**
 * Abdelrahman Abou-Elabbas
 * V2x Project
 */

$response = array();
require_once '../entities/RSU.php';
require_once '../dbCredentials/dbHandler.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
  $db = new dbHandler();
  $result = $db->getRSUById($_GET['id']);
  if ($result->num_rows > 0) {
      while($row = $result->fetch_assoc()) {
        $rsu = new RSU($row["RSU_ID"], $row["RSU_LONG"], $row["RSU_LAT"],
                        $row["RSU_EMERG_NOTES"], $row["RSU_STATE"]);
        echo json_encode($rsu);
      }
  } else {
    $response ['msg'] = "No Data";
    echo json_encode($response);
  }
} else {
  $response ['error'] = true;
  $response ['msg'] = "Required fields are missing";
  echo json_encode($response);
}
?>