<?php

session_start();
include './connect_db.php';
include './func_libs.php';

$GLOBALS['connection'] = $con;
switch ($_GET['action']) {
    case "add":
        $result = update_cart(true);
        $totalQuantity = getTotalQuantity();
        $result['total_quantity'] = $totalQuantity;
        echo json_encode($result);
        break;
    case "update":
        $result = update_cart();
        $totalQuantity = getTotalQuantity();
        $result['total_quantity'] = $totalQuantity;
        echo json_encode($result);
        break;
    case "delete":
        if (isset($_POST['id'])) {
            unset($_SESSION["cart"][$_POST['id']]);
        }
        echo json_encode(array(
            'status' => 1,
            'message' => 'Xóa sản phẩm thành công',
            'total_quantity' => getTotalQuantity()
        ));
        break;
    case "submit":
        if(empty($_SESSION["cart"])){
            echo json_encode(array(
                'status' => 0,
                'message' => "Giỏ hàng rỗng. Bạn vui lòng lựa chọn sản phẩm vào giỏ hàng."
            ));exit;
        }
        $products = mysqli_query($con, "SELECT * FROM `product` WHERE `id` IN (" . implode(",", array_keys($_SESSION["cart"])) . ")");
        $total = 0;
        $orderProducts = array();
        $updateString = "";
        $changeQuantity = false;
        while ($row = mysqli_fetch_array($products)) {
            $orderProducts[] = $row;
            if ($_SESSION["cart"][$row['id']] > $row['quantity']) { //Thay đổi số lượng sản phẩm trong giỏ hàng
                $_SESSION["cart"][$row['id']] = $row['quantity'];
                $changeQuantity = true;
            } else {
                $total += $row['price'] * $_SESSION["cart"][$row['id']];
                $updateString .= " when id = " . $row['id'] . " then quantity - " . $_SESSION["cart"][$row['id']]; //Trừ đi sản phẩm tồn kho
            }
        }
        if ($changeQuantity == false) {
            $updateQuantity = mysqli_query($con, "update `product` set quantity = CASE" . $updateString . " END where id in (" . implode(",", array_keys($_SESSION["cart"])) . ")");
            $insertOrder = mysqli_query($con, "INSERT INTO `orders` (`id`, `name`, `phone`, `address`, `note`, `total`, `created_time`, `last_updated`) VALUES (NULL, '" . $_POST['name'] . "', '" . $_POST['phone'] . "', '" . $_POST['address'] . "', '" . $_POST['note'] . "', '" . $total . "', '" . time() . "', '" . time() . "');");
            $orderID = $con->insert_id;
            $insertString = "";
            foreach ($orderProducts as $key => $product) {
                $insertString .= "(NULL, '" . $orderID . "', '" . $product['id'] . "', '" . $_SESSION["cart"][$product['id']] . "', '" . $product['price'] . "', '" . time() . "', '" . time() . "')";
                if ($key != count($orderProducts) - 1) {
                    $insertString .= ",";
                }
            }
            $insertOrder = mysqli_query($con, "INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_time`, `last_updated`) VALUES " . $insertString . ";");
            unset($_SESSION['cart']);
            echo json_encode(array(
                'status' => 1,
                'message' => "Đặt hàng thành công."
            ));
        } else {
            echo json_encode(array(
                'status' => 0,
                'message' => "Đặt hàng không thành công do số lượng sản phẩm tồn kho không đủ. Bạn vui lòng kiểm tra lại giỏ hàng"
            ));
        }
        break;
    default:
        break;
}
function update_cart($add = false) {
    $changeQuantity = false;
    foreach ($_POST['quantity'] as $id => $quantity) {
        if ($quantity == 0) {
            unset($_SESSION["cart"][$id]);
        } else {
            if (!isset($_SESSION["cart"][$id])) {
                $_SESSION["cart"][$id] = 0;
            }
            if ($add) {
                $_SESSION["cart"][$id] += $quantity;
            } else {
                $_SESSION["cart"][$id] = $quantity;
            }
            //Kiểm tra số lượng sản phẩm tồn kho
            $addProduct = mysqli_query($GLOBALS['connection'], "SELECT `quantity` FROM `product` WHERE `id` = " . $id);
            $addProduct = mysqli_fetch_assoc($addProduct);
            if ($_SESSION["cart"][$id] > $addProduct['quantity']) {
                $_SESSION["cart"][$id] = $addProduct['quantity'];
                if ($add) {
                    return array(
                        'status' => 0,
                        'message' => "Số lượng sản phẩm tồn kho chỉ còn: " . $addProduct['quantity'] . " sản phẩm. Bạn vui lòng kiểm tra lại giỏ hàng."
                    );
                } else {
                    $changeQuantity = true;
                }
            }
            if ($add) {
                return array(
                    'status' => 1,
                    'message' => "Thêm sản phẩm thành công"
                );
            }
        }
    }
    if ($changeQuantity) {
        return array(
            'status' => 1,
            'message' => "Số lượng sản phẩm trong giỏ hàng đã thay đổi do số lượng tồn kho không đủ. Bạn vui lòng kiểm tra lại giỏ hàng"
        );
    } else {
        return array(
            'status' => 1,
            'message' => "Cập nhật giỏ hàng thành công"
        );
    }
}
