<?php
/*
* Carregar variáveis ​​de ambiente do arquivo .env
*
*/

function loadEnv($filePath) {
    try {
        // Verifica se o arquivo .env existe e é legível
        if (!file_exists($filePath) || !is_readable($filePath)) {
            throw new Exception();
        }

        // Lê as linhas do arquivo .env
        $lines = file($filePath, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        foreach ($lines as $line) {
            // Ignora linhas de comentários
            if (strpos(trim($line), '#') === 0) {
                continue;
            }

            // Verifica se a linha contém um sinal de igual
            if (strpos($line, '=') === false) {
                continue;
            }

            list($name, $value) = explode('=', $line, 2);
            $name = trim($name);
            $value = trim($value);

            // Define uma variável global
            $_ENV[$name] = $value;
        }
    } catch (Exception $e) {
        // Exibe uma mensagem mais genérica e segura
        echo "<div style='display: flex; justify-content: 
        center; align-items: center; height: 100vh; text-align: 
        center; background-color: #f2f2f2;'>
        <h2 style='color: black;'>Erro ao carregar variáveis de ambiente</h2>
      </div>";
exit();
        exit();
    }
}

// Caminho do arquivo .env
$envFilePath = __DIR__ . '/../.env'; 

// Carrega as variáveis do arquivo .env
loadEnv($envFilePath);
?>
