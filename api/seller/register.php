<?php

header('Access-Control-Allow-Origin: *');
header('Content-type: application/json');
header('Access-Control-Allow-Method: POST');
header('Access-Control-Allow-Headers: Origin, Content-type, Accept');

include_once '../../models/Seller.php';

$seller = new Seller();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $errors = [];

    // Validate name
    if ($seller->validate_params($_POST['name'])) {
        $seller->name = $_POST['name'];
    } else {
        $errors[] = 'Name is required!';
    }

    // Validate email
    if ($seller->validate_params($_POST['email'])) {
        $seller->email = $_POST['email'];
    } else {
        $errors[] = 'Email is required!';
    }

    // Validate password
    if ($seller->validate_params($_POST['password'])) {
        $seller->password = password_hash($_POST['password'], PASSWORD_BCRYPT);
    } else {
        $errors[] = 'Password is required!';
    }

    // Validate address
    if ($seller->validate_params($_POST['address'])) {
        $seller->address = $_POST['address'];
    } else {
        $errors[] = 'Address is required!';
    }

    // Validate description
    if ($seller->validate_params($_POST['description'])) {
        $seller->description = $_POST['description'];
    } else {
        $errors[] = 'Description is required!';
    }

    // Handle image upload
    $seller_images_folder = '../../assets/seller_images/';
    if (!is_dir($seller_images_folder)) {
        mkdir($seller_images_folder, 0777, true);
    }

    if (isset($_FILES['image']) && $_FILES['image']['error'] == 0) {
        $file_name = $_FILES['image']['name'];
        $file_tmp = $_FILES['image']['tmp_name'];
        $extension = pathinfo($file_name, PATHINFO_EXTENSION);

        $new_file_name = $seller->email . "_profile." . $extension;
        if (move_uploaded_file($file_tmp, $seller_images_folder . $new_file_name)) {
            $seller->image = 'seller_images/' . $new_file_name;
        } else {
            $errors[] = 'Image upload failed!';
        }
    }

    // Return errors if any
    if (!empty($errors)) {
        echo json_encode(['success' => 0, 'message' => $errors]);
        exit;
    }

    // Check if email is unique and register seller
    if ($seller->check_unique_email()) {
        if ($seller->register_seller()) {
            echo json_encode(['success' => 1, 'message' => 'Seller registered successfully!']);
        } else {
            http_response_code(500);
            echo json_encode(['success' => 0, 'message' => 'Internal Server Error']);
        }
    } else {
        http_response_code(401);
        echo json_encode(['success' => 0, 'message' => 'Email already exists!']);
    }
} else {
    http_response_code(405);
    echo json_encode(['success' => 0, 'message' => 'Request Method Not Allowed']);
}
