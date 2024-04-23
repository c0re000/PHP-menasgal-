<?php
session_start();

// Check if user is logged in and is an admin
if (!isset($_SESSION['username']) || !isset($_SESSION['is_admin']) || !$_SESSION['is_admin']) {
    // Redirect non-admin users to index.php or any other appropriate page
    header("Location: index.php");
    exit;
}

// Check if the post ID is provided via POST method
if (isset($_POST['post_id'])) {
    // Include the database connection file
    require_once 'db.php';

    // Retrieve the post ID from the POST data
    $post_id = $_POST['post_id'];

    // Prepare and execute a SQL DELETE statement to delete the post
    $stmt = $pdo->prepare("DELETE FROM posts WHERE id = ?");
    $stmt->execute([$post_id]);

    // Redirect back to index.php after deleting the post
    header("Location: index.php");
    exit;
} else {
    // If post ID is not provided, redirect back to index.php
    header("Location: index.php");
    exit;
}
?>
