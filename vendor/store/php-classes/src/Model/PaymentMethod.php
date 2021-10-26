<?php 

namespace Store\Model;

use \Store\DB\Sql;
use \Store\Model;

class PaymentMethod extends Model {

	public function get(int $idpaymentmethod)
	{

		$sql = new Sql();

		$results = $sql->select("SELECT * FROM tb_paymentmethods WHERE idpaymentmethod = :idpaymentmethod", [
			':idpaymentmethod'=>$idpaymentmethod
		]);

		if (count($results) > 0) {

			$this->setData($results[0]);

		}

	}

}

?>