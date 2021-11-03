<?php if(!class_exists('Rain\Tpl')){exit;}?><form action="/pix" method="post">
    <input type="hidden" name="description" value="Pagamento do Pedido <?php echo htmlspecialchars( $order["idorder"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">    
    <input type="hidden" name="amount" value="<?php echo htmlspecialchars( $order["vltotal"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
</form>
<script>
document.forms[0].submit();
</script>