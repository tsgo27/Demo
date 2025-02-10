<?php

/*
* Exibir nome do usuário logado
*
*/

try {
    // Verifica se a matrícula está presente na sessão
    $matricula = $_SESSION['matricula'] ?? null;
    if (!$matricula) {
        throw new Exception('Sessão de matrícula não encontrada.');
    }

    // Consulta o nome do usuário no banco de dados
    $stmt = $pdo->prepare("SELECT nome FROM usuarios WHERE matricula = ?");
    $stmt->execute([$matricula]);
    $user = $stmt->fetchColumn();

    if (!$user) {
        throw new Exception('Usuário não encontrado.');
    }

    $userName = $user;

} catch (Exception $e) {
    // Captura outros erros e exibe uma mensagem
    echo "Erro: " . $e->getMessage();
    exit();
}
