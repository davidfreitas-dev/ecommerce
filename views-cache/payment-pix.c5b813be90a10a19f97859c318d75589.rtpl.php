<?php if(!class_exists('Rain\Tpl')){exit;}?>// Alterar o action do form para enviar as informações para a classe Payload
<form action="/pix" method="post">

    // Parâmetros a serem enviados
    <input type="hidden" name="description" value="Pagamento do Pedido <?php echo htmlspecialchars( $order["idorder"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">    
    <input type="hidden" name="amount" value="<?php echo htmlspecialchars( $order["vltotal"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">

</form>
<script>
document.forms[0].submit();
</script>