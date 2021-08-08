<?php if(!class_exists('Rain\Tpl')){exit;}?>    <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="container">
          <div class="banner_content d-md-flex justify-content-between align-items-center">
            <div class="mb-3 mb-md-0">
              <h2>Shop Category</h2>
              <p>Very us move be blessed multiply night</p>
            </div>
            <div class="page_link">
              <a href="index.html">Home</a>
              <a href="category.html">Shop</a>
              <a href="category.html"><?php echo htmlspecialchars( $category["descategory"], ENT_COMPAT, 'UTF-8', FALSE ); ?></a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

    <!--================Category Product Area =================-->
    <section class="cat_product_area section_gap">
      <div class="container">
        <div class="row flex-row-reverse">
          <div class="col-lg-12">
            <div class="product_top_bar">
              <div class="left_dorp">
                <select class="sorting">
                  <option value="1">Default sorting</option>
                  <option value="2">Default sorting 01</option>
                  <option value="4">Default sorting 02</option>
                </select>
                <select class="show">
                  <option value="1">Show 12</option>
                  <option value="2">Show 14</option>
                  <option value="4">Show 16</option>
                </select>
              </div>
            </div>
            
            <div class="latest_product_inner">
              <div class="row">
                <?php $counter1=-1;  if( isset($products) && ( is_array($products) || $products instanceof Traversable ) && sizeof($products) ) foreach( $products as $key1 => $value1 ){ $counter1++; ?>

                <div class="col-lg-3 col-md-6 col-6">
                  <a href="#">
                    <div class="single-product">
                      <div class="product-img">
                        <img class="img-fluid w-100" src="<?php echo htmlspecialchars( $value1["desphoto"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" alt="" />
                      </div>
                      <div class="product-btm">
                        <a href="/products/<?php echo htmlspecialchars( $value1["desurl"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" class="d-block">
                          <h4><?php echo htmlspecialchars( $value1["desproduct"], ENT_COMPAT, 'UTF-8', FALSE ); ?></h4>
                        </a>
                        <div class="mt-3">
                          <span class="mr-4">$<?php echo formatPrice($value1["vlprice"]); ?></span>
                          <del>$35.00</del>
                        </div>
                      </div>
                    </div>
                  </a>
                </div>
                <?php } ?>


                <div class="col-lg-3 col-md-6 col-6">
                  <a href="#">
                    <div class="single-product">
                      <div class="product-img">
                        <img class="img-fluid w-100" src="img/product/placa-mae.png" alt="" />
                      </div>
                      <div class="product-btm">
                        <a href="#" class="d-block">
                          <h4>Latest products</h4>
                        </a>
                        <div class="mt-3">
                          <span class="mr-4">$25.00</span>
                          <del>$35.00</del>
                        </div>
                      </div>
                    </div>
                  </a>
                </div>

                <div class="col-lg-3 col-md-6 col-6">
                  <a href="#">
                    <div class="single-product">
                      <div class="product-img">
                        <img class="img-fluid w-100" src="img/product/intel.png" alt="" />
                      </div>
                      <div class="product-btm">
                        <a href="#" class="d-block">
                          <h4>Latest products</h4>
                        </a>
                        <div class="mt-3">
                          <span class="mr-4">$25.00</span>
                          <del>$35.00</del>
                        </div>
                      </div>
                    </div>
                  </a>
                </div>

                <div class="col-lg-3 col-md-6 col-6">
                  <a href="#">
                    <div class="single-product">
                      <div class="product-img">
                        <img class="img-fluid w-100" src="img/product/memoria.png" alt="" />
                      </div>
                      <div class="product-btm">
                        <a href="#" class="d-block">
                          <h4>Latest products</h4>
                        </a>
                        <div class="mt-3">
                          <span class="mr-4">$25.00</span>
                          <del>$35.00</del>
                        </div>
                      </div>
                    </div>
                  </a>
                </div>

                <div class="col-lg-3 col-md-6 col-6">
                  <a href="#">
                    <div class="single-product">
                      <div class="product-img">
                        <img class="img-fluid w-100" src="img/product/kitgamer.png" alt="" />
                      </div>
                      <div class="product-btm">
                        <a href="#" class="d-block">
                          <h4>Latest products</h4>
                        </a>
                        <div class="mt-3">
                          <span class="mr-4">$25.00</span>
                          <del>$35.00</del>
                        </div>
                      </div>
                    </div>
                  </a>
                </div>

                <div class="col-lg-3 col-md-6 col-6">
                  <a href="#">
                    <div class="single-product">
                      <div class="product-img">
                        <img class="img-fluid w-100" src="img/product/gabinete.png" alt="" />
                      </div>
                      <div class="product-btm">
                        <a href="#" class="d-block">
                          <h4>Latest products</h4>
                        </a>
                        <div class="mt-3">
                          <span class="mr-4">$25.00</span>
                          <del>$35.00</del>
                        </div>
                      </div>
                    </div>
                  </a>
                </div>

                <div class="col-lg-3 col-md-6 col-6">
                  <a href="#">
                    <div class="single-product">
                      <div class="product-img">
                        <img class="img-fluid w-100" src="img/product/ssd-nvme.png" alt="" />
                      </div>
                      <div class="product-btm">
                        <a href="#" class="d-block">
                          <h4>Latest products</h4>
                        </a>
                        <div class="mt-3">
                          <span class="mr-4">$25.00</span>
                          <del>$35.00</del>
                        </div>
                      </div>
                    </div>
                  </a>
                </div>

                <div class="col-lg-3 col-md-6 col-6">
                  <a href="#">
                    <div class="single-product">
                      <div class="product-img">
                        <img class="img-fluid w-100" src="img/product/amd.png" alt="" />
                      </div>
                      <div class="product-btm">
                        <a href="#" class="d-block">
                          <h4>Latest products</h4>
                        </a>
                        <div class="mt-3">
                          <span class="mr-4">$25.00</span>
                          <del>$35.00</del>
                        </div>
                      </div>
                    </div>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Category Product Area =================-->