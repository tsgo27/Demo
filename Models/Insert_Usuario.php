<?php
session_start();
require_once __DIR__ . '/../Config/bootstrap.php';

/**
 * Inserção de novos usuários no sistema.
 */

// Função para sanitizar e validar dados de entrada
function getPostData($key, $filter, $flags = ENT_QUOTES) {
return htmlspecialchars(filter_input(INPUT_POST, $key, $filter), $flags, 'UTF-8');
}

// Verifica se o formulário foi enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    try {
        // Obtém e filtra os dados do formulário
        $matricula = getPostData('matricula', FILTER_SANITIZE_NUMBER_INT);
        $nome = getPostData('nome', FILTER_DEFAULT);
        $telefone = getPostData('telefone', FILTER_SANITIZE_NUMBER_INT);
        $email = getPostData('email', FILTER_VALIDATE_EMAIL);
        $senha = getPostData('senha', FILTER_DEFAULT);
        $tipo = getPostData('user_tipo', FILTER_DEFAULT);
        $status = getPostData('user_status', FILTER_DEFAULT);

        // Valida campos obrigatórios
        if (empty($matricula) || empty($nome) || empty($email) || empty($senha)) {
            echo "error_required";
            exit;
        }

        // Verifica se a matrícula ou e-mail já estão cadastrados
        $stmt = $pdo->prepare("SELECT COUNT(*) FROM usuarios WHERE matricula = ? OR email = ?");
        $stmt->execute([$matricula, $email]);
        $count = $stmt->fetchColumn();

        if ($count > 0) {
            echo $count == 1 ? "error_matricula" : "error_email";
            exit;
        }

        // Criptografa a senha
        $senha = password_hash($senha, PASSWORD_DEFAULT);

        // Insere os dados no banco de dados
        $stmt = $pdo->prepare("INSERT INTO usuarios (matricula, nome, telefone, email, senha, user_tipo, user_status, data_registro) 
        VALUES (?, ?, ?, ?, ?, ?, ?, NOW())");
        $stmt->execute([$matricula, $nome, $telefone, $email, $senha, $tipo, $status]);

        echo $stmt->rowCount() > 0 ? "success" : "error_insert";
    } catch (Exception $e) {
        echo "Ocorreu um erro: " . $e->getMessage();
    } finally {
        // Fecha a declaração e a conexão com o banco de dados
        $stmt = null;
        $pdo = null;
    }
}
?>
