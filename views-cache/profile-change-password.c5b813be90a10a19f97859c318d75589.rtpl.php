<?php if(!class_exists('Rain\Tpl')){exit;}?>    <!--================Home Banner Area =================-->
    <section class="banner_area">
        <div class="banner_inner d-flex align-items-center">
        <div class="container">
            <div
            class="banner_content d-md-flex justify-content-between align-items-center"
            >
            <div class="mb-3 mb-md-0">
                <h2>Change Password</h2>
                <div class="page_link">
                <a href="/">Home</a>
                <a href="/profile/orders">Change Password</a>
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
                    <h3 class="mb-4 ml-2">Change Password</h3>

                    <?php if( $changePassError != '' ){ ?>
                    <div class="alert alert-danger">
                        <?php echo htmlspecialchars( $changePassError, ENT_COMPAT, 'UTF-8', FALSE ); ?>
                    </div>
                    <?php } ?>

                    <?php if( $changePassSuccess != '' ){ ?>
                    <div class="alert alert-success">
                        <?php echo htmlspecialchars( $changePassSuccess, ENT_COMPAT, 'UTF-8', FALSE ); ?>
                    </div>
                    <?php } ?>

                    <form class="row tracking_form" action="/profile/change-password" method="post">
                        <div class="col-md-12 form-group">
                            <input type="password" class="form-control" id="current_pass" name="current_pass" placeholder="Current Password">
                        </div>
                        <div class="col-md-12 form-group">
                            <input type="password" class="form-control" id="new_pass" name="new_pass" placeholder="New Password">
                        </div>
                        <div class="col-md-12 form-group">
                            <input type="password" class="form-control" id="new_pass_confirm" name="new_pass_confirm" placeholder="Confirm New Password">
                        </div>

                        <small class="text-danger ml-3">* Sua senha deve conter no mínimo 8 caracteres, pelo menos 1 número, pelo menos um caractere maiúsculo, pelo menos um caractere minúsculo.</small>
                        
                        <div class="col-md-12 form-group mt-3">
                            <button type="submit" value="submit" class="btn submit_btn">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!--================End Tracking Box Area =================-->