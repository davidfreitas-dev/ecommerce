-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Ago-2021 às 13:07
-- Versão do servidor: 10.4.19-MariaDB
-- versão do PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_ecommerce`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addresses_save` (`pidaddress` INT(11), `pidperson` INT(11), `pdesaddress` VARCHAR(128), `pdesnumber` VARCHAR(5), `pdescomplement` VARCHAR(32), `pdescity` VARCHAR(32), `pdesstate` VARCHAR(32), `pdescountry` VARCHAR(32), `pdeszipcode` CHAR(8), `pdesdistrict` VARCHAR(32))  BEGIN

	IF pidaddress > 0 THEN
		
		UPDATE tb_addresses
        SET
			idperson = pidperson,
            desaddress = pdesaddress,
            desnumber = pdesnumber,
            descomplement = pdescomplement,
            descity = pdescity,
            desstate = pdesstate,
            descountry = pdescountry,
            deszipcode = pdeszipcode, 
            desdistrict = pdesdistrict
		WHERE idaddress = pidaddress;
        
    ELSE
		
		INSERT INTO tb_addresses (idperson, desaddress, desnumber, descomplement, descity, desstate, descountry, deszipcode, desdistrict)
        VALUES(pidperson, pdesaddress, pdesnumber, pdescomplement, pdescity, pdesstate, pdescountry, pdeszipcode, pdesdistrict);
        
        SET pidaddress = LAST_INSERT_ID();
        
    END IF;
    
    SELECT * FROM tb_addresses WHERE idaddress = pidaddress;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_carts_save` (`pidcart` INT, `pdessessionid` VARCHAR(64), `piduser` INT, `pdeszipcode` CHAR(8), `pvlfreight` DECIMAL(10,2), `pnrdays` INT)  BEGIN

    IF pidcart > 0 THEN
        
        UPDATE tb_carts
        SET
            dessessionid = pdessessionid,
            iduser = piduser,
            deszipcode = pdeszipcode,
            vlfreight = pvlfreight,
            nrdays = pnrdays
        WHERE idcart = pidcart;
        
    ELSE
        
        INSERT INTO tb_carts (dessessionid, iduser, deszipcode, vlfreight, nrdays)
        VALUES(pdessessionid, piduser, pdeszipcode, pvlfreight, pnrdays);
        
        SET pidcart = LAST_INSERT_ID();
        
    END IF;
    
    SELECT * FROM tb_carts WHERE idcart = pidcart;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categories_save` (`pidcategory` INT, `pdescategory` VARCHAR(64))  BEGIN
	
	IF pidcategory > 0 THEN
		
		UPDATE tb_categories
        SET descategory = pdescategory
        WHERE idcategory = pidcategory;
        
    ELSE
		
		INSERT INTO tb_categories (descategory) VALUES(pdescategory);
        
        SET pidcategory = LAST_INSERT_ID();
        
    END IF;
    
    SELECT * FROM tb_categories WHERE idcategory = pidcategory;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_orders_save` (`pidorder` INT, `pidcart` INT(11), `piduser` INT(11), `pidstatus` INT(11), `pidaddress` INT(11), `pvltotal` DECIMAL(10,2))  BEGIN
	
	IF pidorder > 0 THEN
		
		UPDATE tb_orders
        SET
			idcart = pidcart,
            iduser = piduser,
            idstatus = pidstatus,
            idaddress = pidaddress,
            vltotal = pvltotal
		WHERE idorder = pidorder;
        
    ELSE
    
		INSERT INTO tb_orders (idcart, iduser, idstatus, idaddress, vltotal)
        VALUES(pidcart, piduser, pidstatus, pidaddress, pvltotal);
		
		SET pidorder = LAST_INSERT_ID();
        
    END IF;
    
    SELECT * 
    FROM tb_orders a
    INNER JOIN tb_ordersstatus b USING(idstatus)
    INNER JOIN tb_carts c USING(idcart)
    INNER JOIN tb_users d ON d.iduser = a.iduser
    INNER JOIN tb_addresses e USING(idaddress)
    WHERE idorder = pidorder;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_products_delete` (`pidproduct` INT)  BEGIN
    DELETE FROM tb_cartsproducts WHERE idproduct = pidproduct;
    DELETE FROM tb_productscategories WHERE idproduct = pidproduct;
    DELETE FROM tb_products WHERE idproduct = pidproduct;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_products_save` (`pidproduct` INT(11), `pdesproduct` VARCHAR(64), `pdesdescription` TEXT, `pvlprice` DECIMAL(10,2), `pvlwidth` DECIMAL(10,2), `pvlheight` DECIMAL(10,2), `pvllength` DECIMAL(10,2), `pvlweight` DECIMAL(10,2), `pinventory` INT(11), `pinstock` TINYINT, `pdesurl` VARCHAR(128))  BEGIN
	
	IF pidproduct > 0 THEN
		
		UPDATE tb_products
        SET 
			desproduct = pdesproduct,
            desdescription = pdesdescription,
            vlprice = pvlprice,
            vlwidth = pvlwidth,
            vlheight = pvlheight,
            vllength = pvllength,
            vlweight = pvlweight,
            inventory = pinventory,
            instock = pinstock,
            desurl = pdesurl
        WHERE idproduct = pidproduct;
        
    ELSE
		
		INSERT INTO tb_products (desproduct, desdescription, vlprice, vlwidth, vlheight, vllength, vlweight, inventory, instock, desurl) 
        VALUES(pdesproduct, pdesdescription, pvlprice, pvlwidth, pvlheight, pvllength, pvlweight, pinventory, pinstock, pdesurl);
        
        SET pidproduct = LAST_INSERT_ID();
        
    END IF;
    
    SELECT * FROM tb_products WHERE idproduct = pidproduct;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_userspasswordsrecoveries_create` (`piduser` INT, `pdesip` VARCHAR(45))  BEGIN
  
  INSERT INTO tb_userspasswordsrecoveries (iduser, desip)
    VALUES(piduser, pdesip);
    
    SELECT * FROM tb_userspasswordsrecoveries
    WHERE idrecovery = LAST_INSERT_ID();
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usersupdate_save` (`piduser` INT, `pdesperson` VARCHAR(64), `pdeslogin` VARCHAR(64), `pdespassword` VARCHAR(256), `pdesemail` VARCHAR(128), `pnrphone` BIGINT, `pinadmin` TINYINT)  BEGIN
  
    DECLARE vidperson INT;
    
  SELECT idperson INTO vidperson
    FROM tb_users
    WHERE iduser = piduser;
    
    UPDATE tb_persons
    SET 
    desperson = pdesperson,
        desemail = pdesemail,
        nrphone = pnrphone
  WHERE idperson = vidperson;
    
    UPDATE tb_users
    SET
    deslogin = pdeslogin,
        despassword = pdespassword,
        inadmin = pinadmin
  WHERE iduser = piduser;
    
    SELECT * FROM tb_users a INNER JOIN tb_persons b USING(idperson) WHERE a.iduser = piduser;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_delete` (`piduser` INT)  BEGIN
    
    DECLARE vidperson INT;
    
    SET FOREIGN_KEY_CHECKS = 0;
	
	SELECT idperson INTO vidperson
    FROM tb_users
    WHERE iduser = piduser;
	
    DELETE FROM tb_addresses WHERE idperson = vidperson;
    DELETE FROM tb_addresses WHERE idaddress IN(SELECT idaddress FROM tb_orders WHERE iduser = piduser);
	DELETE FROM tb_persons WHERE idperson = vidperson;
    
    DELETE FROM tb_userslogs WHERE iduser = piduser;
    DELETE FROM tb_userspasswordsrecoveries WHERE iduser = piduser;
    DELETE FROM tb_orders WHERE iduser = piduser;
    DELETE FROM tb_cartsproducts WHERE idcart IN(SELECT idcart FROM tb_carts WHERE iduser = piduser);
    DELETE FROM tb_carts WHERE iduser = piduser;
    DELETE FROM tb_users WHERE iduser = piduser;
    
    SET FOREIGN_KEY_CHECKS = 1;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_save` (`pdesperson` VARCHAR(64), `pdeslogin` VARCHAR(64), `pdespassword` VARCHAR(256), `pdesemail` VARCHAR(128), `pnrphone` BIGINT, `pinadmin` TINYINT)  BEGIN
  
    DECLARE vidperson INT;
    
  INSERT INTO tb_persons (desperson, desemail, nrphone)
    VALUES(pdesperson, pdesemail, pnrphone);
    
    SET vidperson = LAST_INSERT_ID();
    
    INSERT INTO tb_users (idperson, deslogin, despassword, inadmin)
    VALUES(vidperson, pdeslogin, pdespassword, pinadmin);
    
    SELECT * FROM tb_users a INNER JOIN tb_persons b USING(idperson) WHERE a.iduser = LAST_INSERT_ID();
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_addresses`
--

CREATE TABLE `tb_addresses` (
  `idaddress` int(11) NOT NULL,
  `idperson` int(11) NOT NULL,
  `desaddress` varchar(128) NOT NULL,
  `desnumber` varchar(5) DEFAULT NULL,
  `descomplement` varchar(32) DEFAULT NULL,
  `descity` varchar(32) NOT NULL,
  `desstate` varchar(32) NOT NULL,
  `descountry` varchar(32) NOT NULL,
  `deszipcode` char(8) NOT NULL,
  `desdistrict` varchar(32) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Estrutura da tabela `tb_carts`
--

CREATE TABLE `tb_carts` (
  `idcart` int(11) NOT NULL,
  `dessessionid` varchar(64) NOT NULL,
  `iduser` int(11) DEFAULT NULL,
  `deszipcode` char(8) DEFAULT NULL,
  `vlfreight` decimal(10,2) DEFAULT NULL,
  `nrdays` int(11) DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_carts`
--

INSERT INTO `tb_carts` (`idcart`, `dessessionid`, `iduser`, `deszipcode`, `vlfreight`, `nrdays`, `dtregister`) VALUES
(1, '9frh10okrfs19vqp0rkqup6tto', NULL, NULL, NULL, NULL, '2021-08-11 09:59:30'),
(2, '60d75tndft25a7d7fefh0gut79', NULL, NULL, NULL, NULL, '2021-08-11 10:05:54'),
(3, '2ch7mvhfueulglo9vevmv6nmes', NULL, NULL, NULL, NULL, '2021-08-11 10:08:23'),
(4, '8qvn23trkmc2tfgmd390v9iiep', NULL, NULL, NULL, NULL, '2021-08-11 10:11:36'),
(5, 'go144c6o4v7npjrmk88bbsse0v', NULL, '02169270', '140.33', 1, '2021-08-11 10:13:50'),
(6, '5evm76ara0ad78giodlhbmel3q', NULL, NULL, NULL, NULL, '2021-08-11 12:58:21'),
(7, 'r7ofukkk8pshvr3adpfesb5bbm', 9, '02169270', '140.33', 1, '2021-08-12 10:53:15'),
(8, 'ka5qdceak0ejp2h1rlrk9b8sm1', 9, NULL, NULL, NULL, '2021-08-12 14:22:05'),
(9, '24vsc1phtu19vc8rak8uda9270', NULL, '02169270', '50.53', 1, '2021-08-13 10:36:03'),
(10, '6ffndibv3aqvqptelsrq8hbd8u', 9, '02169270', NULL, NULL, '2021-08-13 10:38:42'),
(11, 'elss5q38884qc09asqr64hmlhh', 9, '02169270', '302.33', 1, '2021-08-13 10:39:21'),
(12, 'gdfmfsshekg4iipjuqf44pqvps', 9, '02169270', '50.57', 1, '2021-08-13 10:53:24'),
(13, '9c3l90074miem6mremp70k345b', 9, '02169270', '68.21', 1, '2021-08-13 10:55:22'),
(14, 'hn7qojnjiofsnrg4940bnkq3it', 9, '02169270', '79.53', 1, '2021-08-13 11:17:03'),
(15, '1bm86a0gq5p12qfd28bp502of9', 9, '02169270', '79.53', 1, '2021-08-13 12:16:21'),
(16, '80op15ebg4oh8dkeevvare4v2o', 9, '02169270', '56.23', 1, '2021-08-13 12:56:42'),
(17, '6fk0h564jkbc0ccagmamci0sm0', 9, NULL, NULL, NULL, '2021-08-13 13:03:27'),
(18, 'l8di89ek3hrs61hsvo67qtguu0', 9, NULL, NULL, NULL, '2021-08-13 13:12:17'),
(19, 'shq661l8bqthviqcurdhlunk6v', 9, '02169270', NULL, NULL, '2021-08-13 13:22:35'),
(20, 'u7h22sru00hr35qmc1lib1gujl', NULL, '02169270', '50.57', 1, '2021-08-13 14:04:36'),
(21, 'sopj100inimod1kbtsc5pccv1q', 9, '02169270', '111.41', 1, '2021-08-13 14:48:45'),
(22, 'ghd6tk5s7s827t0p3v1io4lkib', 9, NULL, NULL, NULL, '2021-08-13 15:47:22'),
(23, 'vph1ervm038f5lreqerdc0o68o', NULL, NULL, NULL, NULL, '2021-08-16 19:35:43'),
(24, '57pm4uqt5en6k63eekdmrut46k', NULL, '02169270', '50.53', 1, '2021-08-17 11:57:24'),
(25, 'njgdom3utfi47ekn1nr5j1uufe', 9, '02169270', '56.23', 1, '2021-08-17 12:01:54'),
(26, 'alhv57gd1o7ita2am8qrkbr6ro', 9, NULL, NULL, NULL, '2021-08-17 12:21:35'),
(27, 'tvdh2skcs34fatmsm7192c4u0j', NULL, '', '0.00', 0, '2021-08-17 12:28:16'),
(28, 'd5iai2t3mk8fur357lkprbipf0', NULL, NULL, NULL, NULL, '2021-08-17 19:44:38'),
(29, 'spgu0jo166emcn40656klhnb84', NULL, NULL, NULL, NULL, '2021-08-18 10:25:23'),
(30, 'cj25848hmk6o3pp1oggh1jtdct', NULL, '02169270', '50.57', 1, '2021-08-18 10:35:29'),
(31, 'oesmhea8diuku615mu50fdkc3g', 9, '02169270', '56.23', 1, '2021-08-18 11:32:37'),
(32, '708b4cnn4dc7t40ta990cibn8m', 9, '02169270', '86.93', 1, '2021-08-18 16:14:37'),
(33, 'e19thpkf60l9fi13v0kh7qodtc', 9, '02169270', '86.93', 1, '2021-08-18 16:28:32'),
(34, 'dn19hlqef5kuirb404k4hmrkp7', NULL, NULL, NULL, NULL, '2021-08-19 11:14:41'),
(35, 'oqu5rvvgqp8cvo31qesf1j0d44', NULL, '02169270', '52.23', 1, '2021-08-20 11:04:40'),
(36, 'd7jb890ukqg0qvnlhvcbbpkt6d', 9, '02169270', '52.23', 1, '2021-08-20 13:32:57'),
(37, '5d3k2eqo8ii6rphfasgrh0odcu', 9, '02169270', '52.69', 1, '2021-08-20 13:57:24'),
(38, 'sj8khtqd5emscu8bffq13hk8ua', 9, '02169270', '46.23', 1, '2021-08-20 14:01:54'),
(39, 'h70kkt55u4vat2f0hnblsh4i6l', 9, '02169270', '52.23', 1, '2021-08-20 14:59:14'),
(40, 'noiff3s015gbd0phujg8mhvhsf', 9, '02169270', '106.40', 1, '2021-08-20 15:13:07'),
(41, '1f0cm9489nhn99tier6i27belu', 9, '02169270', '24.20', 7, '2021-08-20 15:19:48'),
(42, 'c4gjcngpqv8jrmlmue45l21p9c', 9, '02169270', '21.00', 7, '2021-08-20 15:28:41'),
(43, '1kdbqdalrt74jmfahsismendbm', 9, '02169270', NULL, NULL, '2021-08-20 15:29:45');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cartsproducts`
--

CREATE TABLE `tb_cartsproducts` (
  `idcartproduct` int(11) NOT NULL,
  `idcart` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL,
  `dtremoved` datetime NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_cartsproducts`
--

INSERT INTO `tb_cartsproducts` (`idcartproduct`, `idcart`, `idproduct`, `dtremoved`, `dtregister`) VALUES
(8, 5, 1, '2021-08-11 07:16:33', '2021-08-11 10:13:50'),
(9, 5, 2, '2021-08-11 07:16:36', '2021-08-11 10:14:05'),
(10, 5, 2, '2021-08-11 07:16:36', '2021-08-11 10:15:29'),
(11, 5, 2, '2021-08-11 07:16:36', '2021-08-11 10:15:37'),
(12, 5, 2, '2021-08-11 07:16:36', '2021-08-11 10:15:45'),
(14, 5, 1, '2021-08-11 07:20:34', '2021-08-11 10:17:19'),
(15, 5, 1, '2021-08-11 07:20:34', '2021-08-11 10:17:19'),
(16, 5, 1, '2021-08-11 07:20:34', '2021-08-11 10:17:23'),
(17, 5, 1, '2021-08-11 07:20:34', '2021-08-11 10:17:31'),
(18, 5, 1, '2021-08-11 07:20:34', '2021-08-11 10:19:41'),
(27, 5, 2, '2021-08-11 09:47:17', '2021-08-11 12:46:17'),
(28, 5, 2, '2021-08-11 09:47:17', '2021-08-11 12:46:47'),
(29, 5, 2, '2021-08-11 09:47:17', '2021-08-11 12:47:01'),
(30, 5, 1, '2021-08-11 09:48:13', '2021-08-11 12:48:03'),
(31, 5, 1, '2021-08-11 09:48:57', '2021-08-11 12:48:04'),
(35, 5, 1, '2021-08-11 09:55:05', '2021-08-11 12:54:55'),
(36, 5, 1, '2021-08-11 09:55:09', '2021-08-11 12:55:01'),
(39, 5, 1, '2021-08-11 14:36:46', '2021-08-11 15:15:00'),
(40, 5, 1, '2021-08-11 14:37:42', '2021-08-11 17:37:07'),
(41, 5, 1, '0000-00-00 00:00:00', '2021-08-11 17:49:56'),
(42, 5, 1, '0000-00-00 00:00:00', '2021-08-11 17:49:57'),
(43, 7, 1, '2021-08-12 12:22:56', '2021-08-12 15:21:48'),
(44, 7, 2, '2021-08-12 12:22:55', '2021-08-12 15:21:58'),
(45, 7, 2, '2021-08-12 12:22:55', '2021-08-12 15:21:58'),
(47, 7, 1, '0000-00-00 00:00:00', '2021-08-12 15:23:47'),
(48, 7, 1, '0000-00-00 00:00:00', '2021-08-12 15:24:01'),
(59, 14, 2, '0000-00-00 00:00:00', '2021-08-13 12:14:30'),
(60, 14, 2, '0000-00-00 00:00:00', '2021-08-13 12:14:30'),
(61, 15, 2, '0000-00-00 00:00:00', '2021-08-13 12:16:21'),
(62, 15, 2, '0000-00-00 00:00:00', '2021-08-13 12:16:21'),
(63, 16, 2, '0000-00-00 00:00:00', '2021-08-13 13:21:23'),
(64, 20, 1, '2021-08-13 11:04:57', '2021-08-13 14:04:45'),
(65, 20, 1, '2021-08-13 11:05:00', '2021-08-13 14:04:51'),
(67, 21, 2, '0000-00-00 00:00:00', '2021-08-13 15:46:32'),
(70, 21, 1, '2021-08-13 12:47:00', '2021-08-13 15:46:48'),
(71, 21, 1, '2021-08-13 12:47:00', '2021-08-13 15:46:48'),
(72, 21, 1, '2021-08-13 12:47:00', '2021-08-13 15:46:49'),
(74, 25, 2, '0000-00-00 00:00:00', '2021-08-17 12:21:09'),
(81, 27, 2, '2021-08-17 13:27:37', '2021-08-17 16:24:07'),
(82, 27, 2, '2021-08-17 13:27:37', '2021-08-17 16:24:57'),
(83, 27, 2, '2021-08-17 13:27:37', '2021-08-17 16:25:52'),
(84, 27, 2, '2021-08-17 13:27:37', '2021-08-17 16:26:37'),
(87, 27, 2, '0000-00-00 00:00:00', '2021-08-17 16:33:51'),
(89, 31, 2, '0000-00-00 00:00:00', '2021-08-18 16:07:08'),
(90, 32, 1, '0000-00-00 00:00:00', '2021-08-18 16:14:42'),
(91, 33, 1, '0000-00-00 00:00:00', '2021-08-18 16:28:35'),
(92, 35, 15, '0000-00-00 00:00:00', '2021-08-20 13:27:43'),
(93, 36, 15, '0000-00-00 00:00:00', '2021-08-20 13:55:25'),
(94, 37, 18, '2021-08-20 10:59:55', '2021-08-20 13:59:19'),
(95, 37, 16, '2021-08-20 11:00:11', '2021-08-20 13:59:38'),
(96, 37, 16, '0000-00-00 00:00:00', '2021-08-20 14:00:19'),
(97, 37, 14, '0000-00-00 00:00:00', '2021-08-20 14:00:33'),
(98, 38, 16, '0000-00-00 00:00:00', '2021-08-20 14:46:00'),
(99, 39, 15, '0000-00-00 00:00:00', '2021-08-20 15:12:31'),
(100, 40, 14, '0000-00-00 00:00:00', '2021-08-20 15:13:14'),
(101, 40, 14, '0000-00-00 00:00:00', '2021-08-20 15:13:16'),
(102, 40, 14, '0000-00-00 00:00:00', '2021-08-20 15:13:18'),
(103, 41, 1, '0000-00-00 00:00:00', '2021-08-20 15:22:30'),
(104, 41, 1, '0000-00-00 00:00:00', '2021-08-20 15:26:17'),
(105, 42, 16, '0000-00-00 00:00:00', '2021-08-20 15:28:54');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_categories`
--

CREATE TABLE `tb_categories` (
  `idcategory` int(11) NOT NULL,
  `descategory` varchar(32) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_categories`
--

INSERT INTO `tb_categories` (`idcategory`, `descategory`, `dtregister`) VALUES
(4, 'Gamer', '2021-08-06 15:49:33'),
(6, 'Processors', '2021-08-06 15:51:32'),
(7, 'Storage', '2021-08-06 15:51:41'),
(8, 'PC Gamer', '2021-08-06 15:51:53'),
(9, 'Peripherals', '2021-08-09 11:23:35');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_categoriesproducts`
--

CREATE TABLE `tb_categoriesproducts` (
  `idcategory` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_orders`
--

CREATE TABLE `tb_orders` (
  `idorder` int(11) NOT NULL,
  `idcart` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idstatus` int(11) NOT NULL,
  `idaddress` int(11) NOT NULL,
  `vltotal` decimal(10,2) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_orders`
--

INSERT INTO `tb_orders` (`idorder`, `idcart`, `iduser`, `idstatus`, `idaddress`, `vltotal`, `dtregister`) VALUES
(4, 32, 9, 1, 16, '2636.83', '2021-08-18 16:14:54'),
(5, 33, 9, 1, 17, '2636.83', '2021-08-18 16:28:47'),
(6, 35, 9, 1, 18, '942.13', '2021-08-20 13:27:58'),
(7, 36, 9, 1, 19, '942.13', '2021-08-20 13:55:43'),
(8, 37, 9, 1, 20, '890.49', '2021-08-20 14:01:41'),
(9, 38, 9, 1, 21, '636.13', '2021-08-20 14:59:01'),
(10, 39, 9, 1, 22, '942.13', '2021-08-20 15:12:49'),
(11, 40, 9, 1, 23, '850.10', '2021-08-20 15:13:29'),
(12, 41, 9, 1, 24, '3124.00', '2021-08-20 15:26:29'),
(13, 42, 9, 1, 25, '610.90', '2021-08-20 15:29:04');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_ordersstatus`
--

CREATE TABLE `tb_ordersstatus` (
  `idstatus` int(11) NOT NULL,
  `desstatus` varchar(32) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_ordersstatus`
--

INSERT INTO `tb_ordersstatus` (`idstatus`, `desstatus`, `dtregister`) VALUES
(1, 'Em Aberto', '2017-03-13 06:00:00'),
(2, 'Aguardando Pagamento', '2017-03-13 06:00:00'),
(3, 'Pago', '2017-03-13 06:00:00'),
(4, 'Entregue', '2017-03-13 06:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_persons`
--

CREATE TABLE `tb_persons` (
  `idperson` int(11) NOT NULL,
  `desperson` varchar(64) NOT NULL,
  `desemail` varchar(128) DEFAULT NULL,
  `nrphone` bigint(20) DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_persons`
--

INSERT INTO `tb_persons` (`idperson`, `desperson`, `desemail`, `nrphone`, `dtregister`) VALUES
(9, 'Admin', 'davidfrei7as@gmail.com', 11930389760, '2021-08-11 17:32:22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_products`
--

CREATE TABLE `tb_products` (
  `idproduct` int(11) NOT NULL,
  `desproduct` varchar(64) NOT NULL,
  `desdescription` text NOT NULL,
  `vlprice` decimal(10,2) NOT NULL,
  `vlwidth` decimal(10,2) NOT NULL,
  `vlheight` decimal(10,2) NOT NULL,
  `vllength` decimal(10,2) NOT NULL,
  `vlweight` decimal(10,2) NOT NULL,
  `inventory` int(11) NOT NULL,
  `instock` tinyint(4) NOT NULL DEFAULT 0,
  `desurl` varchar(128) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_products`
--

INSERT INTO `tb_products` (`idproduct`, `desproduct`, `desdescription`, `vlprice`, `vlwidth`, `vlheight`, `vllength`, `vlweight`, `inventory`, `instock`, `desurl`, `dtregister`) VALUES
(1, 'Processador AMD Ryzen 7 3800X', 'Teste Inativo', '1549.90', '15.00', '15.00', '15.00', '0.81', 25, 0, 'smartphone-android-7.0', '2017-03-13 06:00:00'),
(2, 'Processador Intel Core i5-10400F', 'Processador de ultima geração intel', '1089.90', '15.00', '15.00', '15.00', '0.27', 100, 1, 'smarttv-led-4k', '2017-03-13 06:00:00'),
(12, 'PC Gamer Concórdia Intel Core i3-9100F, RX 550, 8GB DDR4, HD 1TB', 'PC gamer parrudão', '2790.90', '15.00', '15.00', '15.00', '0.27', 100, 1, 'pc-gamer', '2017-03-13 06:00:00'),
(13, 'SSD Kross Elegance 120GB, NVME, M.2, Leitura 550MB/s e Gravação ', 'SSD Super rápido', '150.90', '15.00', '15.00', '15.00', '0.27', 100, 1, 'SSD-nvme-m2', '2017-03-13 06:00:00'),
(14, 'Mouse Gamer Husky Blizzard, Rainbow', 'Kit gamer com vários RGB', '247.90', '15.00', '15.00', '15.00', '0.27', 100, 1, 'kit-mouse-teclado-gamer', '2017-03-13 06:00:00'),
(15, 'Monitor Gamer Samsung LED 24´ Widescreen, Full HD', 'Monitor gamer irado', '889.90', '15.00', '15.00', '15.00', '0.27', 100, 1, 'Monitor-Gamer-Samsung', '2017-03-13 06:00:00'),
(16, 'Cadeira Gamer Tempest Husky Gaming Black 500', 'Cadeira Gamer super confortavel', '589.90', '15.00', '15.00', '15.00', '0.27', 100, 1, 'cadeira-gamer-confortavel', '2017-03-13 06:00:00'),
(17, 'Roteador Wireless D-Link MU-MIMO Gigabit AC1200, 1200Mbps, 6 Ant', 'Roteador wireless 6 antenas', '289.90', '15.00', '15.00', '15.00', '0.27', 100, 1, 'roteador-wireless-d-link', '2017-03-13 06:00:00'),
(18, 'Memória Kingston Fury Beast, 8GB, 2666MHz, DDR4', 'Memoria zica', '12.00', '1.10', '1.10', '1.10', '1.10', 35, 1, 'memoria-kingston-fury-beast', '2021-08-19 13:46:27');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_productscategories`
--

CREATE TABLE `tb_productscategories` (
  `idcategory` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_productscategories`
--

INSERT INTO `tb_productscategories` (`idcategory`, `idproduct`) VALUES
(4, 12),
(4, 14),
(4, 15),
(4, 16),
(6, 1),
(6, 2),
(7, 13),
(8, 12),
(9, 14),
(9, 16),
(9, 17);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_users`
--

CREATE TABLE `tb_users` (
  `iduser` int(11) NOT NULL,
  `idperson` int(11) NOT NULL,
  `deslogin` varchar(64) NOT NULL,
  `despassword` varchar(256) NOT NULL,
  `inadmin` tinyint(4) NOT NULL DEFAULT 0,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_users`
--

INSERT INTO `tb_users` (`iduser`, `idperson`, `deslogin`, `despassword`, `inadmin`, `dtregister`) VALUES
(9, 9, 'admin', '$2y$12$JnKyMY0NGAQwv/paZF0XVOcpTgc72s6MVVhBiYl1cm2SkBxtzzZo6', 1, '2021-08-11 17:32:22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_userslogs`
--

CREATE TABLE `tb_userslogs` (
  `idlog` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `deslog` varchar(128) NOT NULL,
  `desip` varchar(45) NOT NULL,
  `desuseragent` varchar(128) NOT NULL,
  `dessessionid` varchar(64) NOT NULL,
  `desurl` varchar(128) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_userspasswordsrecoveries`
--

CREATE TABLE `tb_userspasswordsrecoveries` (
  `idrecovery` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `desip` varchar(45) NOT NULL,
  `dtrecovery` datetime DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_userspasswordsrecoveries`
--

INSERT INTO `tb_userspasswordsrecoveries` (`idrecovery`, `iduser`, `desip`, `dtrecovery`, `dtregister`) VALUES
(41, 9, '127.0.0.1', '2021-08-12 08:08:24', '2021-08-12 11:08:06'),
(42, 9, '127.0.0.1', '2021-08-12 08:10:16', '2021-08-12 11:09:48'),
(43, 9, '127.0.0.1', '2021-08-12 10:35:26', '2021-08-12 13:34:57'),
(44, 9, '127.0.0.1', '2021-08-12 10:38:17', '2021-08-12 13:38:05'),
(50, 9, '127.0.0.1', '2021-08-12 11:21:59', '2021-08-12 14:21:39'),
(51, 9, '127.0.0.1', '2021-08-17 08:58:33', '2021-08-17 11:58:02');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_addresses`
--
ALTER TABLE `tb_addresses`
  ADD PRIMARY KEY (`idaddress`),
  ADD KEY `fk_addresses_persons_idx` (`idperson`);

--
-- Índices para tabela `tb_carts`
--
ALTER TABLE `tb_carts`
  ADD PRIMARY KEY (`idcart`),
  ADD KEY `FK_carts_users_idx` (`iduser`);

--
-- Índices para tabela `tb_cartsproducts`
--
ALTER TABLE `tb_cartsproducts`
  ADD PRIMARY KEY (`idcartproduct`),
  ADD KEY `FK_cartsproducts_carts_idx` (`idcart`),
  ADD KEY `FK_cartsproducts_products_idx` (`idproduct`);

--
-- Índices para tabela `tb_categories`
--
ALTER TABLE `tb_categories`
  ADD PRIMARY KEY (`idcategory`);

--
-- Índices para tabela `tb_categoriesproducts`
--
ALTER TABLE `tb_categoriesproducts`
  ADD PRIMARY KEY (`idcategory`,`idproduct`);

--
-- Índices para tabela `tb_orders`
--
ALTER TABLE `tb_orders`
  ADD PRIMARY KEY (`idorder`),
  ADD KEY `FK_orders_users_idx` (`iduser`),
  ADD KEY `fk_orders_ordersstatus_idx` (`idstatus`),
  ADD KEY `fk_orders_carts_idx` (`idcart`),
  ADD KEY `fk_orders_addresses_idx` (`idaddress`);

--
-- Índices para tabela `tb_ordersstatus`
--
ALTER TABLE `tb_ordersstatus`
  ADD PRIMARY KEY (`idstatus`);

--
-- Índices para tabela `tb_persons`
--
ALTER TABLE `tb_persons`
  ADD PRIMARY KEY (`idperson`);

--
-- Índices para tabela `tb_products`
--
ALTER TABLE `tb_products`
  ADD PRIMARY KEY (`idproduct`);

--
-- Índices para tabela `tb_productscategories`
--
ALTER TABLE `tb_productscategories`
  ADD PRIMARY KEY (`idcategory`,`idproduct`),
  ADD KEY `fk_productscategories_products_idx` (`idproduct`);

--
-- Índices para tabela `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`iduser`),
  ADD KEY `FK_users_persons_idx` (`idperson`);

--
-- Índices para tabela `tb_userslogs`
--
ALTER TABLE `tb_userslogs`
  ADD PRIMARY KEY (`idlog`),
  ADD KEY `fk_userslogs_users_idx` (`iduser`);

--
-- Índices para tabela `tb_userspasswordsrecoveries`
--
ALTER TABLE `tb_userspasswordsrecoveries`
  ADD PRIMARY KEY (`idrecovery`),
  ADD KEY `fk_userspasswordsrecoveries_users_idx` (`iduser`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_addresses`
--
ALTER TABLE `tb_addresses`
  MODIFY `idaddress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `tb_carts`
--
ALTER TABLE `tb_carts`
  MODIFY `idcart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `tb_cartsproducts`
--
ALTER TABLE `tb_cartsproducts`
  MODIFY `idcartproduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT de tabela `tb_categories`
--
ALTER TABLE `tb_categories`
  MODIFY `idcategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `tb_orders`
--
ALTER TABLE `tb_orders`
  MODIFY `idorder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `tb_ordersstatus`
--
ALTER TABLE `tb_ordersstatus`
  MODIFY `idstatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_persons`
--
ALTER TABLE `tb_persons`
  MODIFY `idperson` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `tb_products`
--
ALTER TABLE `tb_products`
  MODIFY `idproduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `tb_userslogs`
--
ALTER TABLE `tb_userslogs`
  MODIFY `idlog` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_userspasswordsrecoveries`
--
ALTER TABLE `tb_userspasswordsrecoveries`
  MODIFY `idrecovery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_addresses`
--
ALTER TABLE `tb_addresses`
  ADD CONSTRAINT `fk_addresses_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_carts`
--
ALTER TABLE `tb_carts`
  ADD CONSTRAINT `fk_carts_users` FOREIGN KEY (`iduser`) REFERENCES `tb_users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_cartsproducts`
--
ALTER TABLE `tb_cartsproducts`
  ADD CONSTRAINT `fk_cartsproducts_carts` FOREIGN KEY (`idcart`) REFERENCES `tb_carts` (`idcart`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cartsproducts_products` FOREIGN KEY (`idproduct`) REFERENCES `tb_products` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_orders`
--
ALTER TABLE `tb_orders`
  ADD CONSTRAINT `fk_orders_addresses` FOREIGN KEY (`idaddress`) REFERENCES `tb_addresses` (`idaddress`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_carts` FOREIGN KEY (`idcart`) REFERENCES `tb_carts` (`idcart`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_ordersstatus` FOREIGN KEY (`idstatus`) REFERENCES `tb_ordersstatus` (`idstatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_users` FOREIGN KEY (`iduser`) REFERENCES `tb_users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_productscategories`
--
ALTER TABLE `tb_productscategories`
  ADD CONSTRAINT `fk_productscategories_categories` FOREIGN KEY (`idcategory`) REFERENCES `tb_categories` (`idcategory`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productscategories_products` FOREIGN KEY (`idproduct`) REFERENCES `tb_products` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_users`
--
ALTER TABLE `tb_users`
  ADD CONSTRAINT `fk_users_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_userslogs`
--
ALTER TABLE `tb_userslogs`
  ADD CONSTRAINT `fk_userslogs_users` FOREIGN KEY (`iduser`) REFERENCES `tb_users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_userspasswordsrecoveries`
--
ALTER TABLE `tb_userspasswordsrecoveries`
  ADD CONSTRAINT `fk_userspasswordsrecoveries_users` FOREIGN KEY (`iduser`) REFERENCES `tb_users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
