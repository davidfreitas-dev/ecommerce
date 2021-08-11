<?php if(!class_exists('Rain\Tpl')){exit;}?>    <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="container">
          <div class="banner_content d-md-flex justify-content-between align-items-center">
            <div class="mb-3 mb-md-0">
              <h2>Cart</h2>
              <p>Very us move be blessed multiply night</p>
            </div>
            <div class="page_link">
              <a href="index.html">Home</a>
              <a href="cart.html">Cart</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

    <!--================Cart Area =================-->
    <section class="cart_area">
      <div class="container">
        <div class="cart_inner">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">Product</th>
                  <th scope="col">Price</th>
                  <th scope="col">Quantity</th>
                  <th scope="col">Total</th>
                </tr>
              </thead>
              <tbody>
                <?php $counter1=-1;  if( isset($products) && ( is_array($products) || $products instanceof Traversable ) && sizeof($products) ) foreach( $products as $key1 => $value1 ){ $counter1++; ?>
                <tr>
                  <td>
                    <div class="media">
                      <div class="d-flex">
                        <a href="/products/<?php echo htmlspecialchars( $value1["desurl"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
                          <img
                            src="<?php echo htmlspecialchars( $value1["desphoto"], ENT_COMPAT, 'UTF-8', FALSE ); ?>"
                            alt=""
                          />
                        </a>
                      </div>
                      <div class="media-body">
                        <a href="/products/<?php echo htmlspecialchars( $value1["desurl"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
                          <p><?php echo htmlspecialchars( $value1["desproduct"], ENT_COMPAT, 'UTF-8', FALSE ); ?></p>
                          <a href="/cart/<?php echo htmlspecialchars( $value1["idproduct"], ENT_COMPAT, 'UTF-8', FALSE ); ?>/remove" title="Remover item do carrinho">
                            <span class="text-danger"><small><i class="ti-close"></i></small>&ensp;Remove</span>
                          </a>
                        </a>
                      </div>
                    </div>
                  </td>
                  <td>
                    <h5>R$<?php echo formatPrice($value1["vlprice"]); ?></h5>
                  </td>
                  <td>
                    <div class="product_count">
                      <input
                        type="text"
                        name="qty"
                        id="sst"
                        maxlength="12"
                        value="<?php echo htmlspecialchars( $value1["nrqtd"], ENT_COMPAT, 'UTF-8', FALSE ); ?>"
                        title="Quantity:"
                        class="input-text qty"
                      />
                      <button
                        onclick="window.location.href = '/cart/<?php echo htmlspecialchars( $value1["idproduct"], ENT_COMPAT, 'UTF-8', FALSE ); ?>/add'"
                        class="increase items-count"
                        type="button"
                      >
                        <i class="lnr lnr-chevron-up"></i>
                      </button>
                      <button
                        onclick="window.location.href = '/cart/<?php echo htmlspecialchars( $value1["idproduct"], ENT_COMPAT, 'UTF-8', FALSE ); ?>/minus'"
                        class="reduced items-count"
                        type="button"
                      >
                        <i class="lnr lnr-chevron-down"></i>
                      </button>
                    </div>
                  </td>
                  <td>
                    <h5>R$<?php echo formatPrice($value1["vltotal"]); ?></h5>
                  </td>
                </tr>
                <?php } ?>
                <tr>
                  <td>
                    <div class="row">
                      <div class="col-md-6">
                        <form action="" method="POST">
                          <div class="input-group">
                            <input type="text" class="form-control" placeholder="Digite o CEP">
                            <div class="input-group-append">
                              <button class="input-group-text" type="submit">Calcular</button>
                            </div>
                          </div>
                        </form>
                      </div>                      
                    </div>
                  </td>
                  <td></td>
                  <td>
                    <h5 class="mb-3">Subtotal</h5>
                    <h5 class="mb-3">Frete</h5>
                    <h5 class="mb-3">Total</h5>
                  </td>
                  <td>
                    <h5 class="mb-3">$2160.00</h5>
                    <h5 class="mb-3">$2160.00</h5>
                    <h5 class="mb-3">$2160.00</h5>
                  </td>
                </tr>                
                <tr class="out_button_area">
                  <td></td>
                  <td></td>
                  <td></td>
                  <td>
                    <div class="checkout_btn_inner">
                      <a class="gray_btn" href="#">Continue Shopping</a>
                      <a class="main_btn" href="#">Proceed to checkout</a>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </section>
    <!--================End Cart Area =================-->