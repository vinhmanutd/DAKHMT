<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Bài 19: Chi tiết sản phẩm</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css" >
    </head>
    <body>
        <?php
        include './connect_db.php';
        $result = mysqli_query($con, "SELECT * FROM `product` WHERE `id` = " . $_GET['id']);
        $product = mysqli_fetch_assoc($result);
        $imgLibrary = mysqli_query($con, "SELECT * FROM `image_library` WHERE `product_id` = " . $_GET['id']);
        $product['images'] = mysqli_fetch_all($imgLibrary, MYSQLI_ASSOC);
        ?>
        <div class="container">
            <h2>Chi tiết sản phẩm</h2>
            <div id="product-detail">
                <div id="product-img">
                    <img src="<?= $product['image'] ?>" />
                </div>
                <div id="product-info">
                    <h1><?= $product['name'] ?></h1>
                    <label>Giá: </label><span class="product-price"><?= number_format($product['price'], 0, ",", ".") ?> VND</span><br/>
                    <?php if ($product['quantity'] > 0) { ?>
                        <div class="product-quantity"><label>Tồn kho: </label><strong><?= $product['quantity'] ?></strong></div>
                        <form id="add-to-cart-form" action="cart.php?action=add" method="POST">
                        <input type="text" value="1" name="quantity[<?= $product['id'] ?>]" size="2" /><br/>
                        <input type="submit" value="Mua sản phẩm" />
                        </form>
                    <?php } else { ?>
                        <span class="error">Hết hàng</span>
                    <?php } ?>
                    <?php if (!empty($product['images'])) { ?>
                        <div id="gallery">
                            <ul>
                                <?php foreach ($product['images'] as $img) { ?>
                                    <li><img src="<?= $img['path'] ?>" /></li>
                                <?php } ?>
                            </ul>
                        </div>
                    <?php } ?>
                </div>
                <div class="clear-both"></div>
                <?= $product['content'] ?>
            </div>
        </div>
    </body>
</html>