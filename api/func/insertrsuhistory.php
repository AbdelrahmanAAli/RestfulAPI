<?php
/**
 * Abdelrahman Abou-Elabbas
 * V2x Project
 */

$response = array();
require_once '../entities/RSUHistory.php';
require_once '../dbCredentials/dbHandler.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
  $db = new dbHandler();
  //echo json_encode($_GET['vehicleId']);
  $result = $db->insertRSUHistory($_GET['rsuId'], $_GET['case'], $_GET['caseNote'], $_GET['caseState']);
  if ($result) {
    $response ['msg'] = "Data inserted";
    echo json_encode($response);
  } else {
    $response ['msg'] = "Error";
    echo json_encode($response);
  }
} else {
  $response ['error'] = true;
  $response ['msg'] = "Required fields are missing";
  echo json_encode($response);
}
?>