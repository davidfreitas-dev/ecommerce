<?php if(!class_exists('Rain\Tpl')){exit;}?><!--================Home Banner Area =================-->
<section class="banner_area">
    <div class="banner_inner d-flex align-items-center">
      <div class="container">
        <div class="banner_content d-md-flex justify-content-between align-items-center">
          <div class="mb-3 mb-md-0">
            <h2>Pagamento com Pix</h2>
            <div class="page_link">
              <a href="/">Home</a>
            </div>
          </div>
        </div>
      </div>
    </div>
</section>
<!--================End Home Banner Area =================-->
<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container mt-5 mb-5">
        <div class="row">
            <div class="col-md-12">
                <h3 class="text-center">
                    Pedido Realizado com sucesso! <br>
                    Escaneie o QR Code para realizar o pagamento via transferência Pix.
                </h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 d-flex justify-content-center mt-3 mb-5">
                <img src="data:image/png;base64, <?php echo htmlspecialchars( $qrcode, ENT_COMPAT, 'UTF-8', FALSE ); ?>" alt="Imagem QR Code Pix" style="height: 250px; width: 250px;">                    
            </div>
        </div>        
        <strong class="text-danger">* Observação</strong>
    </div>
</div>