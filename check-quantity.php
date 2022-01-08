<?php
session_start();
$id = (array_keys($_POST['quantity']))[0];
$quantity = $_POST['quantity'][$id];
include './connect_db.php';
//Kiểm tra số lượng sản phẩm tồn kho
$addProduct = mysqli_query($con, "SELECT `quantity` FROM `product` WHERE `id` = " . $id);
$addProduct = mysqli_fetch_assoc($addProduct);
if(isset($_SESSION["cart"][$id])){
    $quantity += $_SESSION["cart"][$id];
}
if ($quantity > $addProduct['quantity']) {
    echo json_encode("Số lượng tồn kho không đủ, bạn chỉ có thể mua tối đa: " . $addProduct['quantity'] . " sản phẩm. Bạn vui lòng kiểm tra lại giỏ hàng.");
}else{
    echo json_encode(true);
}