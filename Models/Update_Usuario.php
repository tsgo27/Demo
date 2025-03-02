<?php
require_once __DIR__ . '/../Config/bootstrap.php';
require_once __DIR__ . '/../Config/config_csrf.php';

// Registra no log o tipo de requisição (POST) e a URL acessada
logMessage("Requisição recebida: " . $_SERVER['REQUEST_METHOD'] . " - " . $_SERVER['REQUEST_URI'], $_REQUEST);


// Gera o token CSRF se não existir
$_SESSION['csrf_token'] ??= bin2hex(random_bytes(32));

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    try {
        // Verifica o token CSRF
        if (!verify_csrf_token($_POST['csrf_token'])) {
            throw new Exception('Token CSRF inválido');
        }

        // Função de sanitização de dados
        function getPostData($key, $filter, $flags = ENT_QUOTES)
        {
            return htmlspecialchars(filter_input(INPUT_POST, $key, $filter), $flags, 'UTF-8');
        }

        // Obtém e filtra os dados do formulário
        $idUsuario = getPostData('idUsuario', FILTER_SANITIZE_NUMBER_INT);
        $matricula = getPostData('matricula', FILTER_SANITIZE_NUMBER_INT);
        $nome = getPostData('editarNome', FILTER_DEFAULT);
        $telefone = getPostData('editarTelefone', FILTER_SANITIZE_NUMBER_INT);
        $email = getPostData('editarEmail', FILTER_VALIDATE_EMAIL);
        $tipo = getPostData('editarTipoUser', FILTER_DEFAULT);

        // Cria a query de atualização usando Prepared Statements
        $sql = "UPDATE usuarios SET matricula = :matricula, nome = :nome, telefone = :telefone, email = :email, user_tipo = :tipo WHERE idUsuario = :idUsuario";
        $stmt = $pdo->prepare($sql);

        // Vincula os parâmetros e executa a query
        $stmt->execute(compact('idUsuario', 'matricula', 'nome', 'telefone', 'email', 'tipo'))
            ? header("Location: http://localhost/demo/views/Usuarios.php")
            : throw new Exception("Erro na atualização da tabela usuario");

    } catch (Exception $e) {
        $_SESSION['error'] = $e->getMessage();
        header("Location: http://localhost/demo/views/Usuarios.php");
    } finally {
        // Fecha a declaração e a conexão com o banco de dados
        $stmt = null;
        $pdo = null;
    }
}
