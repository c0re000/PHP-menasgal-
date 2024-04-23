<?php
session_start();
require_once 'db.php';

// Check if user is logged in
if (isset($_SESSION['username'])) {
    $logout_button = '<li class="hideOnMobile"><a href="logout.php">Logout</a></li>';
    $create_post_button = '<a href="create_post.php" style="float: right;">Create Post</a>';
    $welcome_message = '<a href="#" class="active" style="float: left;">Welcome, ' . $_SESSION['username'] . '</a>';
} else {
    $login_button = '<a href="login.php" style="float: right;">Login</a>';
    $register_button = '<a href="register.php" style="float: right;">Register</a>';
}


// Fetch posts from the database
$stmt = $pdo->query("SELECT * FROM posts");
$posts = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Honk&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Noto+Sans+JP&family=Roboto+Mono:ital,wght@1,300&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="index.css">
    <title>Menasgal</title>
    <style>
        /* Your CSS styles */
    </style>
</head>
<body>
<nav>
    <ul>
        <li><a class="logo">menasgal</a></li>
        <?php
        // Display appropriate buttons and welcome message based on login status
        if (isset($welcome_message)) {
            echo $welcome_message;
        }
        ?>
        <?php
        // Display appropriate buttons based on login status
        if (isset($logout_button)) {
            echo $logout_button;
            echo $create_post_button;
        } else {
            echo $login_button;
            echo $register_button;
        }
        ?>
    </ul>
</nav>
<?php foreach ($posts as $post): ?>
    <div class="gallery">
        <img src="<?php echo $post['image_path']; ?>" alt="Gallery Image">
        <div class="desc"><?php echo $post['title']; ?>
        <!-- Display delete button for admin -->
        <?php if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']): ?>
            <form action="admin_delete_post.php" method="post">
                <input type="hidden" name="post_id" value="<?php echo $post['id']; ?>">
                <input type="submit" value="Delete">
            </form>
        <?php endif; ?>
        </div>
    </div>
<?php endforeach; ?>

</body>
</html>
