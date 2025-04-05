<?php
header('Content-Type: application/json');
require 'config.php';

$id = isset($_GET['id']) ? $_GET['id'] : null;

try {
    if ($id) {
        $stmt = $pdo->prepare("SELECT * FROM products WHERE id = ?");
        $stmt->execute([$id]);
        $product = $stmt->fetch(PDO::FETCH_ASSOC);
        echo json_encode($product);
    } else {
        $stmt = $pdo->query("SELECT * FROM products");
        $products = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($products);
    }
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?>