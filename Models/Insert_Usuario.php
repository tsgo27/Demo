<?php
require_once __DIR__ . '/../Config/bootstrap.php';

// Registra no log o tipo de requisição (POST) e a URL acessada
logMessage("Requisição recebida: " . $_SERVER['REQUEST_METHOD'] . " - " . $_SERVER['REQUEST_URI'], $_REQUEST);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    try {
        // Filtrando os dados do formulário usando htmlspecialchars e FILTER_DEFAULT
        $matricula = htmlspecialchars(filter_input(INPUT_POST, 'matricula', FILTER_SANITIZE_NUMBER_INT), ENT_QUOTES, 'UTF-8');
        $nome = htmlspecialchars(filter_input(INPUT_POST, 'nome', FILTER_DEFAULT), ENT_QUOTES, 'UTF-8');
        $telefone = htmlspecialchars(filter_input(INPUT_POST, 'telefone', FILTER_SANITIZE_NUMBER_INT), ENT_QUOTES, 'UTF-8');
        $email = htmlspecialchars(filter_input(INPUT_POST, 'email', FILTER_VALIDATE_EMAIL), ENT_QUOTES, 'UTF-8');
        $senha = htmlspecialchars(filter_input(INPUT_POST, 'senha', FILTER_DEFAULT), ENT_QUOTES, 'UTF-8');
        $tipo = htmlspecialchars(filter_input(INPUT_POST, 'user_tipo', FILTER_DEFAULT), ENT_QUOTES, 'UTF-8');
        $status = htmlspecialchars(filter_input(INPUT_POST, 'user_status', FILTER_DEFAULT) ?: 'Ativo', ENT_QUOTES, 'UTF-8');

        // Validando se a matrícula já está cadastrada no banco
        $stmt = $pdo->prepare("SELECT COUNT(*) FROM usuarios WHERE matricula = ?");
        $stmt->execute([$matricula]);
        $countMatricula = $stmt->fetchColumn();

        // Validando se o e-mail já está cadastrado no banco
        $stmt = $pdo->prepare("SELECT COUNT(*) FROM usuarios WHERE email = ?");
        $stmt->execute([$email]);
        $countEmail = $stmt->fetchColumn();

        if ($countMatricula > 0) {
            echo "error_matricula";
            exit;
        } elseif ($countEmail > 0) {
            echo "error_email";
            exit;
        } else {
            // Criptografando a senha
            $senha = password_hash($senha, PASSWORD_DEFAULT);

            // Inserindo os dados do formulário no banco
            $stmt = $pdo->prepare(
                "INSERT INTO usuarios (matricula, nome, telefone, email, senha, user_tipo, user_status, data_registro) 
                VALUES (?, ?, ?, ?, ?, ?, ?, NOW())"
            );
            $stmt->execute([$matricula, $nome, $telefone, $email, $senha,  $tipo, $status]);

            if ($stmt->rowCount() > 0) {
                echo "success";
                exit;
            } else {
                echo "error_insert";
                exit;
            }

            // Fecha a declaração e a conexão com o banco de dados
            $stmt = null;
            $pdo = null;
        }
    } catch (Exception $e) {
        echo "Ocorreu um erro: " . $e->getMessage();
        exit;
    }
}
?>
