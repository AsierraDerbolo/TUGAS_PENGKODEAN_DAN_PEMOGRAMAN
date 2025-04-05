<?php
header('Content-Type: application/json');
require 'config.php';

$data = json_decode(file_get_contents('php://input'), true);

try {
    $stmt = $pdo->prepare("INSERT INTO products (name, category, description, rate) VALUES (?, ?, ?, ?)");
    $stmt->execute([$data['name'], $data['category'], $data['description'], $data['rate']]);
    echo json_encode(['success' => true]);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
?>