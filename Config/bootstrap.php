<?php
/*
* extends
*
*/

// Define o caminho base do sistema para a construção das URLso.
define('BASE_URL', '/demo');

// Inclui os arquivos necessários para a configuração e funcionamento do sistema.
require_once __DIR__ . '/../Config/config_database.php';
require_once __DIR__ . '/../Controllers/SessionController.php';
require_once __DIR__ . '/../Models/get_user_name.php';
?>
