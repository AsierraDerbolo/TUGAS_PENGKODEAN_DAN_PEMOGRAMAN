<?php
header('Content-Type: application/json');
require 'config.php';

$id = isset($_GET['id']) ? $_GET['id'] : null;

if ($id) {
    try {
        $stmt = $pdo->prepare("DELETE FROM products WHERE id = ?");
        $stmt->execute([$id]);
        echo json_encode(['success' => true]);
    } catch (PDOException $e) {
        echo json_encode(['success' => false, 'error' => $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'error' => 'No ID provided']);
}
?>