<?php if(!class_exists('Rain\Tpl')){exit;}?>    <!--================Home Banner Area =================-->
    <section class="banner_area">
        <div class="banner_inner d-flex align-items-center">
        <div class="container">
            <div
            class="banner_content d-md-flex justify-content-between align-items-center"
            >
            <div class="mb-3 mb-md-0">
                <h2>Order Details</h2>
                <div class="page_link">
                <a href="/">Home</a>
                <a href="/profile/orders">Order Details</a>
                </div>
            </div>
            </div>
        </div>
        </div>
    </section>
    <!--================End Home Banner Area =================-->
        
    <!--================Tracking Box Area =================-->
    <section class="tracking_box_area section_gap">
        <div class="container">
            <div class="tracking_box_inner mt-3 mb-3">
                <div class="row">

                <div class="col-lg-3">
                    <?php require $this->checkTemplate("profile-menu");?>
                </div>
                <!-- /.col-lg-3 -->

                <div class="col-lg-9">
                    <h3 class="mb-5 ml-2">Order Details</h3>
                    <div class="order-details">
                        <div class="order-address px-3">
                            <h5>Shipping</h5>
                            <div class="details p-3">
                                <p>Customer: <?php echo htmlspecialchars( $order["desperson"], ENT_COMPAT, 'UTF-8', FALSE ); ?></p>
                                <p>Address: <?php echo htmlspecialchars( $order["desaddress"], ENT_COMPAT, 'UTF-8', FALSE ); ?>, <?php echo htmlspecialchars( $order["desnumber"], ENT_COMPAT, 'UTF-8', FALSE ); ?> - <?php echo htmlspecialchars( $order["descomplement"], ENT_COMPAT, 'UTF-8', FALSE ); ?> - <?php echo htmlspecialchars( $order["desdistrict"], ENT_COMPAT, 'UTF-8', FALSE ); ?> - <?php echo htmlspecialchars( $order["desstate"], ENT_COMPAT, 'UTF-8', FALSE ); ?></p>
                                <p>CEP: <?php echo htmlspecialchars( $order["deszipcode"], ENT_COMPAT, 'UTF-8', FALSE ); ?></p>
                            </div>
                        </div>

                        <div class="order-price px-3">
                            <h5>Payment Values</h5>
                            <div class="details p-3">
                                <p>Subtotal: R$<?php echo formatPrice($cart["vlsubtotal"]); ?></p>
                                <p>Freight: R$<?php echo formatPrice($cart["vlfreight"]); ?></p>
                                <p>Total: R$<?php echo formatPrice($cart["vltotal"]); ?></p>
                            </div>
                        </div>

                        <div class="order-products px-3">
                            <h5>Order Itens</h5>
                            <div class="details p-3">
                                <table class="table table-borderless text-dark">
                                    <thead>
                                        <tr>
                                        <th scope="col">Code&nbsp;#</th>
                                        <th scope="col">Product</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Price</th>
                                        </tr>
                                    </thead>
                                    <?php $counter1=-1;  if( isset($products) && ( is_array($products) || $products instanceof Traversable ) && sizeof($products) ) foreach( $products as $key1 => $value1 ){ $counter1++; ?>
                                    <tbody>
                                        <tr>
                                        <th scope="row"><?php echo htmlspecialchars( $value1["idproduct"], ENT_COMPAT, 'UTF-8', FALSE ); ?></th>
                                        <td><?php echo htmlspecialchars( $value1["desproduct"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td>
                                        <td><?php echo htmlspecialchars( $value1["nrqtd"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td>
                                        <td>R$<?php echo formatPrice($value1["vltotal"]); ?></td>
                                        </tr>
                                    </tbody>
                                    <?php } ?>
                                </table>                             
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Tracking Box Area =================-->