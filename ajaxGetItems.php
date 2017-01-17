<?php

include 'getItems.php';
$result = RetrieveItems("http://localhost:6379/Catalog/items");
if (isset(json_decode($result)->errno)) {
    http_response_code(500);
}
echo $result;

?>

