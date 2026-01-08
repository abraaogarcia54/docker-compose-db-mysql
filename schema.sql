-- MySQL dump 10.13  Distrib 8.0.44, for Linux (aarch64)
--
-- Host: localhost    Database: u733876307_comercialcloud
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `empresa` varchar(100) NOT NULL,
  `cnpj_cpf` varchar(20) NOT NULL,
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `database_name` varchar(255) DEFAULT NULL,
  `logo_marca` longblob,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `CNPJ` (`cnpj_cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ContasPagarReceberParcela`
--

DROP TABLE IF EXISTS `ContasPagarReceberParcela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ContasPagarReceberParcela` (
  `contas_pagar_receber_parcela_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `contas_pagar_receber_parcela_cliente_id` int NOT NULL,
  `tipo_pagamento_recebimento` int NOT NULL,
  `tipo_origem_parcela` int DEFAULT NULL,
  `pessoa_id` int DEFAULT NULL,
  `status` int NOT NULL,
  `pedido_id` int DEFAULT NULL,
  `valor` decimal(18,4) NOT NULL,
  `valor_pago` decimal(18,4) NOT NULL,
  `valor_desconto` decimal(18,4) NOT NULL,
  `tipo_conta` int NOT NULL,
  `data_baixa` datetime DEFAULT NULL,
  `vencimento` datetime DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `is_liquidado` tinyint(1) NOT NULL DEFAULT '0',
  `valor_troca` decimal(18,4) NOT NULL,
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`contas_pagar_receber_parcela_id`),
  UNIQUE KEY `uq_parcela_local_por_cliente` (`contas_pagar_receber_parcela_cliente_id`,`cliente_id`),
  KEY `idx_cliente_parcela` (`cliente_id`),
  KEY `fk_contas_pagar_receber_parcela_pessoa` (`pessoa_id`),
  KEY `fk_financeiro_pedido_id` (`pedido_id`),
  CONSTRAINT `fk_contas_pagar_receber_parcela_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16674 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EstoqueProduto`
--

DROP TABLE IF EXISTS `EstoqueProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EstoqueProduto` (
  `estoque_produto_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `estoque_produto_cliente_id` int NOT NULL,
  `produto_id` int NOT NULL,
  `estoque_atual` decimal(18,4) NOT NULL,
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`estoque_produto_id`),
  UNIQUE KEY `uq_estoque_cliente_local` (`estoque_produto_cliente_id`,`cliente_id`),
  KEY `idx_cliente_produto` (`cliente_id`),
  KEY `fk_estoque_produto_id` (`produto_id`),
  CONSTRAINT `fk_estoque_produto_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2914 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grupo`
--

DROP TABLE IF EXISTS `Grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grupo` (
  `grupo_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `grupo_cliente_id` int NOT NULL,
  `nome` varchar(150) NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `data_criacao` datetime DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  PRIMARY KEY (`grupo_id`),
  KEY `idx_cliente_grupo` (`cliente_id`),
  CONSTRAINT `fk_grupo_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NotaFiscal`
--

DROP TABLE IF EXISTS `NotaFiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NotaFiscal` (
  `nota_fiscal_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `nota_fiscal_cliente_id` int NOT NULL,
  `valor_total` decimal(18,4) NOT NULL,
  `nf_status` varchar(10) DEFAULT NULL,
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nota_fiscal_id`),
  UNIQUE KEY `uq_nota_fiscal_local_por_cliente` (`nota_fiscal_cliente_id`,`cliente_id`),
  KEY `idx_cliente` (`cliente_id`),
  CONSTRAINT `fk_nota_fiscal_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NotaFiscalProduto`
--

DROP TABLE IF EXISTS `NotaFiscalProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NotaFiscalProduto` (
  `nota_fiscal_produto_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `nota_fiscal_produto_cliente_id` int NOT NULL,
  `nota_fiscal_id` int NOT NULL,
  `produto_id` int NOT NULL,
  `valor_total` decimal(18,4) NOT NULL,
  `descricao_produto` varchar(150) NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nota_fiscal_produto_id`),
  UNIQUE KEY `uq_nf_item_local_por_nf` (`nota_fiscal_produto_cliente_id`,`nota_fiscal_id`,`cliente_id`),
  KEY `idx_cliente` (`cliente_id`),
  KEY `fk_nota_fiscal_id` (`nota_fiscal_id`),
  KEY `fk_nota_fiscal_produto_id` (`produto_id`,`cliente_id`),
  CONSTRAINT `fk_nota_fiscal_produto_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2308 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Pedido`
--

DROP TABLE IF EXISTS `Pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedido` (
  `PedidoId` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `pedido_cliente_id` int NOT NULL,
  `vendedor_id` int DEFAULT NULL,
  `is_deletado` tinyint(1) NOT NULL DEFAULT '0',
  `status` int NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `valor_total` decimal(18,4) NOT NULL,
  `valor_total_custo` decimal(18,4) NOT NULL,
  `valor_frete` decimal(18,4) NOT NULL,
  `nfce_status` varchar(10) DEFAULT NULL,
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PedidoId`),
  UNIQUE KEY `uq_pedido_cliente_id_por_cliente` (`pedido_cliente_id`,`cliente_id`),
  KEY `idx_cliente_pedido` (`cliente_id`,`PedidoId`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10534 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PedidoProduto`
--

DROP TABLE IF EXISTS `PedidoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PedidoProduto` (
  `PedidoProdutoId` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `pedido_produto_cliente_id` int NOT NULL,
  `PedidoId` int NOT NULL,
  `produto_id` int NOT NULL,
  `quantidade` decimal(18,4) NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `valor_venda_varejo` decimal(18,4) NOT NULL,
  `valor_desconto` decimal(18,4) NOT NULL,
  `valor_custo` decimal(18,4) NOT NULL,
  `valor_compra` decimal(18,4) NOT NULL,
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PedidoProdutoId`),
  UNIQUE KEY `UQ_PedidoProduto_Cliente` (`pedido_produto_cliente_id`,`cliente_id`),
  KEY `idx_cliente_pedido_produto` (`cliente_id`,`PedidoId`,`produto_id`),
  KEY `fk_pedido_produto` (`PedidoId`),
  KEY `fk_pedido_produto_cliente_id` (`produto_id`),
  CONSTRAINT `fk_pessoa_produto_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92485 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Pessoa`
--

DROP TABLE IF EXISTS `Pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pessoa` (
  `pessoa_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `pessoa_cliente_id` int NOT NULL,
  `vendedor_id` int DEFAULT NULL,
  `nome_razao_social` varchar(150) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `data_criacao` datetime DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  PRIMARY KEY (`pessoa_id`),
  KEY `idx_pessoa_cliente` (`cliente_id`),
  KEY `idx_pessoa_nome` (`nome_razao_social`),
  CONSTRAINT `fk_pessoa_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2707 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Produto`
--

DROP TABLE IF EXISTS `Produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Produto` (
  `produto_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `produto_cliente_id` int NOT NULL,
  `grupo_id` int DEFAULT NULL,
  `sku` varchar(50) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `valor_venda_varejo` decimal(18,4) NOT NULL,
  `valor_custo` decimal(18,4) NOT NULL,
  `valor_compra` decimal(18,4) NOT NULL,
  `estoque_minimo` decimal(18,4) NOT NULL,
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`produto_id`),
  UNIQUE KEY `uq_produto_cliente_id` (`produto_cliente_id`,`cliente_id`),
  KEY `idx_produtos_cliente` (`cliente_id`),
  KEY `idx_produtos_descricao` (`descricao`),
  KEY `fk_produto_grupo` (`grupo_id`),
  CONSTRAINT `fk_produto_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2932 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `usuario_cliente_id` int NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`usuario_id`),
  KEY `idx_cliente_id` (`cliente_id`),
  CONSTRAINT `Usuarios_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-08 16:11:26
