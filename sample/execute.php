<?php
ini_set('display_errors', "On");
require_once("./child_sample.class.php");

$exec = new ChildSample();
$exec->execute();
echo $exec->getSampleData();