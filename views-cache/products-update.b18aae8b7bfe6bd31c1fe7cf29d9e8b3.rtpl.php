<?php if(!class_exists('Rain\Tpl')){exit;}?><!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
<!-- Content Header (Page header) -->
<section class="content-header">
  <h1>
    Lista de Produtos
  </h1>
</section>

<!-- Main content -->
<section class="content">

  <div class="row">
  	<div class="col-md-12">
  		<div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">Editar Produto</h3>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        <form role="form" action="/admin/products/<?php echo htmlspecialchars( $product["idproduct"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" method="post" enctype="multipart/form-data">
          <div class="box-body">
            <div class="row">
              <div class="container-fluid">
                <div class="form-group">
                  <label for="desproduct">Nome do produto</label>
                  <input type="text" class="form-control" id="desproduct" name="desproduct" placeholder="Digite o nome do produto" value="<?php echo htmlspecialchars( $product["desproduct"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
                </div>
                <div class="form-group">
                  <label for="desproduct">Descrição</label>
                  <textarea type="text" rows="5" class="form-control" id="desdescription" name="desdescription" placeholder="<?php echo htmlspecialchars( $product["desdescription"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" value=""></textarea>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="form-group col-md-4">
                <label for="vlprice">Preço</label>
                <input type="number" class="form-control" id="vlprice" name="vlprice" step="0.01" placeholder="0.00" value="<?php echo htmlspecialchars( $product["vlprice"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
              </div>
              <div class="form-group col-md-4">
                <label for="inventory">Estoque</label>
                <input type="number" class="form-control" id="inventory" name="inventory" step="0" placeholder="0" value="<?php echo htmlspecialchars( $product["inventory"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
              </div>
              <div class="form-group col-md-4">
                <label for="vlweight">Peso</label>
                <input type="number" class="form-control" id="vlweight" name="vlweight" step="0.01" placeholder="0.00" value="<?php echo htmlspecialchars( $product["vlweight"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
              </div>
            </div>
            <div class="row">
              <div class="form-group col-md-4">
                <label for="vlheight">Altura</label>
                <input type="number" class="form-control" id="vlheight" name="vlheight" step="0.01" placeholder="0.00" value="<?php echo htmlspecialchars( $product["vlheight"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
              </div>
              <div class="form-group col-md-4">
                <label for="vlwidth">Largura</label>
                <input type="number" class="form-control" id="vlwidth" name="vlwidth" step="0.01" placeholder="0.00" value="<?php echo htmlspecialchars( $product["vlwidth"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
              </div>
              <div class="form-group col-md-4">
                <label for="vllength">Comprimento</label>
                <input type="number" class="form-control" id="vllength" name="vllength" step="0.01" placeholder="0.00" value="<?php echo htmlspecialchars( $product["vllength"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
              </div>
            </div>
            <div class="checkbox">
              <label>
                <input type="checkbox" name="instock" value="1" <?php if( $product["instock"] == 1 ){ ?>checked<?php } ?>> Ativo
              </label>
            </div>
            <div class="form-group">
              <label for="file">Foto</label>
              <input type="file" id="file" name="file"><br />
              <img class="img-responsive" id="image-preview" src="<?php echo htmlspecialchars( $product["desphoto"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" alt="Photo" height="150" width="150">
            </div>
          </div>
          </div>
          <!-- /.box-body -->
          <div class="box-footer">
            <button type="submit" class="btn btn-primary">Salvar</button>
          </div>
        </form>
      </div>
  	</div>
  </div>

</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script>
document.querySelector('#file').addEventListener('change', function(){
  
  var file = new FileReader();

  file.onload = function() {
    
    document.querySelector('#image-preview').src = file.result;

  }

  file.readAsDataURL(this.files[0]);

});
</script>