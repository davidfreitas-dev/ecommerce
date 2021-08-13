<?php if(!class_exists('Rain\Tpl')){exit;}?>    <!--================Home Banner Area =================-->
    <section class="banner_area">
        <div class="banner_inner d-flex align-items-center">
          <div class="container">
            <div
              class="banner_content d-md-flex justify-content-between align-items-center"
            >
              <div class="mb-3 mb-md-0">
                <h2>Profile</h2>
                <div class="page_link">
                  <a href="/">Home</a>
                  <a href="/profile">Profile</a>
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

                <div class="col-lg-3 col-md-4">
                    <?php require $this->checkTemplate("profile-menu");?>
                </div>
                <!-- /.col-lg-3 -->

                <div class="col-lg-9 col-md-8">
                    <?php if( $profileMsg != '' ){ ?>
                    <div class="alert alert-success col-md-9">
                        <?php echo htmlspecialchars( $profileMsg, ENT_COMPAT, 'UTF-8', FALSE ); ?>
                    </div>
                    <?php } ?>
                    <?php if( $profileError != '' ){ ?>
                    <div class="alert alert-danger col-md-9">
                        <?php echo htmlspecialchars( $profileError, ENT_COMPAT, 'UTF-8', FALSE ); ?>
                    </div>
                    <?php } ?>
                    <h3 class="mb-4 ml-2">Account</h3>
                    <form class="row tracking_form" action="/profile" method="post">
                        <div class="col-md-12 form-group">
                            <input type="text" class="single-input" id="desperson" name="desperson" value="<?php echo htmlspecialchars( $user["desperson"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
                        </div>
                        <div class="col-md-12 form-group">
                            <input type="email" class="single-input" id="desemail" name="desemail" value="<?php echo htmlspecialchars( $user["desemail"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
                        </div>
                        <div class="col-md-12 form-group">
                            <input type="text" class="single-input" id="nrphone" name="nrphone" value="<?php echo htmlspecialchars( $user["nrphone"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
                        </div>
                        <div class="col-md-12 form-group">
                            <button type="submit" value="submit" class="btn submit_btn">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!--================End Tracking Box Area =================-->