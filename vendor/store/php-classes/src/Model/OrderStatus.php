<?php 

namespace Store\Model;

use \Store\DB\Sql;
use \Store\Model;

class OrderStatus extends Model {

	const AGUARDANDO_PAGAMENTO = 1;
	const PAGO = 2;
	const CANCELADO = 3;
	const EM_SEPARACAO = 4;
	const ENVIADO = 5;
	const ENTREGUE = 6;

	public static function listAll()
	{

		$sql = new Sql();

		return $sql->select("SELECT * FROM tb_ordersstatus ORDER BY desstatus");

	}

	public function get(int $idstatus)
	{

		$sql = new Sql();

		$results = $sql->select("SELECT * FROM tb_ordersstatus WHERE idstatus = :idstatus", [
			':idstatus'=>$idstatus
		]);

		if (count($results) > 0) {

			$this->setData($results[0]);

		}

	}

}

?>