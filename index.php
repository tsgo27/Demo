<?php
define('VIEW_PATH', __DIR__ . '/views/');
define('ERROR_PATH', __DIR__ . '/Page/');
require_once __DIR__ . '/Config/config_log.php';

// Obtém a URL da consulta e a sanitiza
$url = isset($_GET['url']) ? filter_var($_GET['url'], FILTER_SANITIZE_URL) : '';

// Remove qualquer caminho de diretório e sanitiza a URL
$safe_url = basename($url);

// Define o caminho do arquivo correspondente à URL
$file = VIEW_PATH . $safe_url . '.php';

// Verifica se a URL é a raiz
if ($url === '') {
    include ERROR_PATH . '403.php';
} elseif (file_exists($file) && is_file($file) && pathinfo($file, PATHINFO_EXTENSION) === 'php') {
    // Verifica se o arquivo existe, é um arquivo regular e tem extensão .php
    include $file;
} else {
    // Verifica se o arquivo de log é acessível
    $logFilePath = __DIR__ . '/../logs/error.log';
    if (is_writable($logFilePath) || is_writable(dirname($logFilePath))) {
        // Grava o erro no log com o formato ajustado, como no arquivo load_env
        $errorMessage = "[" . date('Y-m-d H:i:s') . "] Erro 404: Página '$safe_url'.\n";
        error_log($errorMessage, 3, $logFilePath);
    }

    // Registra um erro no log como um aviso 404
    trigger_error("Erro 404: Página '$safe_url'", E_USER_WARNING);

    // Redireciona para a página de erro 404
    include ERROR_PATH . '404.php';
}
