<?php if(!class_exists('Rain\Tpl')){exit;}?>    <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="container">
          <div
            class="banner_content d-md-flex justify-content-between align-items-center"
          >
            <div class="mb-3 mb-md-0">
              <h2>Product Checkout</h2>
              <div class="page_link">
                <a href="/">Home</a>
                <a href="">Product Checkout</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

    <!--================Checkout Area =================-->
    <section class="checkout_area section_gap">
      <div class="container">
        <!-- Area para aplicacao de cupons 
        <div class="cupon_area">
          <div class="check_title">
            <h2>
              Have a coupon?
              <a href="#">Click here to enter your code</a>
            </h2>
          </div>
          <input type="text" placeholder="Enter coupon code" />
          <a class="tp_btn" href="#">Apply Coupon</a>
        </div> -->
        <div class="billing_details">          
          <div class="row">
            <div class="col-lg-7 mb-5">
              <?php if( $error != '' ){ ?>
              <div class="alert alert-danger">
                <?php echo htmlspecialchars( $error, ENT_COMPAT, 'UTF-8', FALSE ); ?>
              </div>
              <?php } ?>

              <h3>Billing Details</h3>

            <form class="row contact_form" action="/checkout" method="post">
              <button type="submit" class="main_btn ml-3 mb-3" formaction="/checkout" formmethod="get">Buscar CEP</button>
              
              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="Zipcode" value="<?php echo htmlspecialchars( $cart["deszipcode"], ENT_COMPAT, 'UTF-8', FALSE ); ?>"/>
              </div>

              <div class="col-md-9 form-group p_star">
                <input type="text" class="form-control" id="address" name="desaddress" placeholder="Address" value="<?php echo htmlspecialchars( $address["desaddress"], ENT_COMPAT, 'UTF-8', FALSE ); ?>"/>
              </div>

              <div class="col-md-3 form-group p_star">
                <input type="text" class="form-control" id="number" name="desnumber" placeholder="Number"/>
              </div>

              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="complement" name="descomplement" placeholder="Complement"/>
              </div>

              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="district" name="desdistrict" placeholder="Neighborhood" value="<?php echo htmlspecialchars( $address["desdistrict"], ENT_COMPAT, 'UTF-8', FALSE ); ?>"/>
              </div>

              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="city" name="descity" placeholder="City" value="<?php echo htmlspecialchars( $address["descity"], ENT_COMPAT, 'UTF-8', FALSE ); ?>"/>
              </div>

              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="state" name="desstate" placeholder="State" value="<?php echo htmlspecialchars( $address["desstate"], ENT_COMPAT, 'UTF-8', FALSE ); ?>"/>
              </div>
              
              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="country" name="descountry" placeholder="Country" value="<?php echo htmlspecialchars( $address["descountry"], ENT_COMPAT, 'UTF-8', FALSE ); ?>"/>
              </div>
            </div>
            <div class="col-lg-5">
              <div class="order_box">
                <h2>Your Order</h2>
                <ul class="list">
                  <li>
                    <a href="#">
                      Product
                      <span>Total</span>
                    </a>
                  </li>
                  <li>
                    <?php $counter1=-1;  if( isset($products) && ( is_array($products) || $products instanceof Traversable ) && sizeof($products) ) foreach( $products as $key1 => $value1 ){ $counter1++; ?>
                    <a href="#">
                      <?php echo htmlspecialchars( $value1["desproduct"], ENT_COMPAT, 'UTF-8', FALSE ); ?>
                      <span class="middle">x <?php echo htmlspecialchars( $value1["nrqtd"], ENT_COMPAT, 'UTF-8', FALSE ); ?></span>
                      <span class="last">R$<?php echo formatPrice($value1["vltotal"]); ?></span>
                    </a>
                    <?php } ?>
                  </li>
                </ul>
                <ul class="list list_2">
                  <li>
                    <a href="#">Subtotal
                      <span>R$<?php echo formatPrice($cart["vlsubtotal"]); ?></span>
                    </a>
                  </li>
                  <li>
                    <a href="#"
                      >Shipping
                      <span>R$<?php echo formatPrice($cart["vlfreight"]); ?></span>
                    </a>
                  </li>
                  <li>
                    <a href="#"
                      >Total
                      <span>R$<?php echo formatPrice($cart["vltotal"]); ?></span>
                    </a>
                  </li>
                </ul>
                <div class="payment_item">
                  <div class="radion_btn">
                    <input type="radio" id="f-option5" name="selector" />
                    <label for="f-option5">Pix</label>
                    <div class="check"></div>
                  </div>
                  <p>
                    You must send a check to store email
                  </p>
                </div>
                <div class="payment_item active">
                  <div class="radion_btn">
                    <input type="radio" id="f-option6" name="selector" />
                    <label for="f-option6">Credit Card </label>
                    <div class="check"></div>
                  </div>
                  <p>
                    Please send a check to Store Name, Store Street, Store Town,
                    Store State / County, Store Postcode.
                  </p>
                </div>
                <div class="creat_account">
                  <input type="checkbox" id="f-option4" name="selector" />
                  <label for="f-option4">I’ve read and accept the </label>
                  <a href="#">terms & conditions*</a>
                </div>
                <button class="main_btn" type="submit">Proceed to Payment</button>
              </div>
            </div>
            </form>
          </div>          
        </div>
      </div>
    </section>
    <!--================End Checkout Area =================-->