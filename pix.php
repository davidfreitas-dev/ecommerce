<?php 

require_once("vendor/autoload.php");

use \Store\Payload;
use Mpdf\QrCode\QrCode;
use Mpdf\QrCode\Output;

// Instancia principal do payload do pix
$obPayload = (new Payload)->setPixKey('davidfrei7as@outlkook.com')
                          ->setDescription($_POST['description'])
                          ->setMerchantName('Virtual Store')
                          ->setMerchantCity('SAO PAULO')
                          ->setAmount($_POST['amount'])
                          ->setTxid('VIRTUALSTORE2021');

// Código de pagamento Pix
$payloadQrCode = $obPayload->getPayload();

// QrCode
$obQrCode = new QrCode($payloadQrCode);