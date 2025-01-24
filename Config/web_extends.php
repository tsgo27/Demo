<?php
/*
* extends
*
*/

//Essa constante define o caminho base do sistema, sendo essencial para a construção correta das URLs do projeto.
define('BASE_URL', '/demo');

// Inclui os arquivos necessários para a configuração e funcionamento do sistema.
require_once __DIR__ . '/../Config/web_database.php';
require_once __DIR__ . '/../Controllers/SessionController.php';
require_once __DIR__ . '/../Models/Read_Nome_Usuario_logado.php';
require_once __DIR__ . '/../Models/Read_DadosCards.php';
require_once __DIR__ . '/../Models/Read_DadosGraficos.php';

?>
