<?php if(!class_exists('Rain\Tpl')){exit;}?>    <!--================Home Banner Area =================-->
    <section class="banner_area">
        <div class="banner_inner d-flex align-items-center">
        <div class="container">
            <div
            class="banner_content d-md-flex justify-content-between align-items-center"
            >
            <div class="mb-3 mb-md-0">
                <h2>Orders</h2>
                <div class="page_link">
                <a href="/">Home</a>
                <a href="/profile/orders">Orders</a>
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
                    <h3 class="mb-2 ml-2">Orders</h3>
                    <div class="progress-table-wrap">
                        <div class="progress-table">
                            <div class="table-head">
                                <div class="serial">#</div>
                                <div class="country">Date</div>
                                <div class="visit">Total</div>
                                <div class="percentage">Status</div>
                                <div class="visit">Ações</div>
                            </div>
                            <?php $counter1=-1;  if( isset($orders) && ( is_array($orders) || $orders instanceof Traversable ) && sizeof($orders) ) foreach( $orders as $key1 => $value1 ){ $counter1++; ?>
                            <div class="table-row">
                                <div class="serial"><?php echo htmlspecialchars( $value1["idorder"], ENT_COMPAT, 'UTF-8', FALSE ); ?></div>
                                <div class="country"><?php echo htmlspecialchars( $value1["dtregister"], ENT_COMPAT, 'UTF-8', FALSE ); ?></div>
                                <div class="visit"><?php echo formatPrice($value1["vltotal"]); ?></div>
                                <div class="percentage"><?php echo htmlspecialchars( $value1["desstatus"], ENT_COMPAT, 'UTF-8', FALSE ); ?></div>
                                <div class="visit"><a href="/profile/orders/<?php echo htmlspecialchars( $value1["idorder"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" class="btn btn-primary btn-sm">Detalhes</a></div>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Tracking Box Area =================-->

