<?php if(!class_exists('Rain\Tpl')){exit;}?>    <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="container">
          <div
            class="banner_content d-md-flex justify-content-between align-items-center"
          >
            <div class="mb-3 mb-md-0">
              <h2>Login</h2>
              <p>Very us move be blessed multiply night</p>
            </div>
            <div class="page_link">
              <a href="/">Home</a>
              <a href="/login">Login</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

    <!--================Tracking Box Area =================-->
    <section class="tracking_box_area section_gap mt-5 mb-5">
        <div class="container">
            <div class="tracking_box_inner">
                <div class="row">
                    <div class="col-md-6">
                        <div class="col-md-8">
                            <div class="px-3 mb-5">
                                <h2 class="mb-3">Login</h2>
                                <form class="row tracking_form" action="/login" method="post" novalidate="novalidate">
                                    <div class="col-md-12 form-group">
                                        <input type="text" class="form-control" id="login" name="login" placeholder="Username">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <button type="submit" value="submit" class="btn submit_btn">Enter</button>
                                    </div>
                                    <?php if( $error != '' ){ ?>
                                    <div class="col-md-12 form-group">
                                        <div class="alert alert-danger">
                                            <?php echo htmlspecialchars( $error, ENT_COMPAT, 'UTF-8', FALSE ); ?>
                                        </div>
                                    </div>
                                    <?php } ?>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="col-md-10">
                            <div class="px-3">
                                <h2 class="mb-3">Cadastre-se</h2>
                                <form class="row tracking_form" action="#" method="post" novalidate="novalidate">
                                    <div class="col-md-12 form-group">
                                        <input type="text" class="form-control" id="order" name="order" placeholder="Order ID">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Billing Email Address">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <input type="text" class="form-control" id="order" name="order" placeholder="Order ID">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Billing Email Address">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <button type="submit" value="submit" class="btn submit_btn">Track Order</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Tracking Box Area =================-->