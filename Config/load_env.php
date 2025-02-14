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
        echo "<div style='position: relative; height: 100vh; background-color: #f2f2f2; font-family: Arial,;'>
                <!-- Logo no canto superior esquerdo -->
                <img src='../public/img/logo-php.png' alt='Logo' 
                    style='position: absolute; top: 20px; left: 20px; width: 100px;'>
                
                <!-- Mensagem centralizada -->
                <div style='display: flex; justify-content: center; align-items: center; height: 100vh; text-align: center;'>
                    <h2 style='color: black; padding: 20px; border-radius: 10px;'>
                        Php informa: Erro ao carregar variáveis de ambiente
                    </h2>
                </div>
              </div>";
        exit();
    }
}

// Caminho do arquivo .env
$envFilePath = __DIR__ . '/../.env'; 

// Carrega as variáveis do arquivo .env
loadEnv($envFilePath);
?>
