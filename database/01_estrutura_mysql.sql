-- SISTEMA HOSPITAL INFANTIL - MODELO FISICO CONVERTIDO PARA MYSQL 8.0+
-- Arquivos do projeto: diagramas (Data Modeler) e relatorio do grupo (out. 2026).
-- Uso acadêmico e dados fictícios. Sem dados reais de pacientes.
-- Alterações em relação ao diagrama Oracle: tipos convertidos;
-- UNIQ em USUARIO.COLABORADOR_id_colaborador para cumprir regra 0..1 declarada no relatório.
-- Não executar em banco de produção.
CREATE DATABASE IF NOT EXISTS hospital_infantil CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE hospital_infantil;

CREATE TABLE IF NOT EXISTS `paciente` (
  `id_paciente` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(120) NOT NULL,
  `nome_social` VARCHAR(120) NULL,
  `genero` VARCHAR(30) NULL,
  `data_nascimento` DATE NOT NULL,
  `tipo_sanguineo` VARCHAR(3) NULL,
  `endereco` VARCHAR(250) NULL,
  `complemento` VARCHAR(100) NULL,
  `telefone` VARCHAR(20) NULL,
  `telefone_fixo` VARCHAR(20) NULL,
  `email` VARCHAR(254) NULL,
  `condicao` TEXT NULL,
  `observacao` TEXT NULL,
  PRIMARY KEY (`id_paciente`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `colaborador` (
  `id_colaborador` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(120) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `departamento` VARCHAR(100) NOT NULL,
  `cargo` VARCHAR(100) NOT NULL,
  `especialidade` VARCHAR(100) NULL,
  `crm` VARCHAR(20) NULL,
  `telefone` VARCHAR(20) NULL,
  `telefone_fixo` VARCHAR(20) NULL,
  `cidade` VARCHAR(100) NULL,
  `email` VARCHAR(254) NULL,
  `turno` VARCHAR(30) NULL,
  PRIMARY KEY (`id_colaborador`),
  CONSTRAINT `uq_colaborador_cpf` UNIQUE (`cpf`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `fornecedor` (
  `id_fornecedor` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(150) NOT NULL,
  `cnpj` VARCHAR(14) NOT NULL,
  `localidade` VARCHAR(150) NULL,
  `contato` VARCHAR(120) NULL,
  `email` VARCHAR(254) NULL,
  `telefone` VARCHAR(20) NULL,
  PRIMARY KEY (`id_fornecedor`),
  CONSTRAINT `uq_fornecedor_cnpj` UNIQUE (`cnpj`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(80) NOT NULL,
  `senha_hash` VARCHAR(255) NOT NULL,
  `nivel_acesso` VARCHAR(30) NOT NULL,
  `status` VARCHAR(30) NOT NULL,
  `COLABORADOR_id_colaborador` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `uq_usuario_login` UNIQUE (`login`),
  CONSTRAINT `uq_usuario_COLABORADOR_id_colaborado` UNIQUE (`COLABORADOR_id_colaborador`),
  CONSTRAINT `fk_usuario_COLABORADOR_id_colab` FOREIGN KEY (`COLABORADOR_id_colaborador`) REFERENCES `colaborador`(`id_colaborador`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `documentacao` (
  `id_documentacao` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipo_documento` VARCHAR(80) NOT NULL,
  `numero_documento` VARCHAR(50) NOT NULL,
  `data_emissao` DATE NULL,
  `observacao` TEXT NULL,
  `PACIENTE_id_paciente` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_documentacao`),
  CONSTRAINT `fk_documentacao_PACIENTE_id_paciente` FOREIGN KEY (`PACIENTE_id_paciente`) REFERENCES `paciente`(`id_paciente`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `acompanhante` (
  `id_acompanhante` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(120) NOT NULL,
  `data_nascimento` DATE NULL,
  `tipo_sanguineo` VARCHAR(3) NULL,
  `cpf` VARCHAR(11) NULL,
  `endereco` VARCHAR(250) NULL,
  `telefone` VARCHAR(20) NULL,
  `telefone_fixo` VARCHAR(20) NULL,
  `email` VARCHAR(254) NULL,
  `grau_parentesco` VARCHAR(40) NOT NULL,
  `PACIENTE_id_paciente` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_acompanhante`),
  CONSTRAINT `fk_acompanhante_PACIENTE_id_paciente` FOREIGN KEY (`PACIENTE_id_paciente`) REFERENCES `paciente`(`id_paciente`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `atendimento` (
  `id_atendimento` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `motivo` VARCHAR(500) NOT NULL,
  `data_atendimento` DATE NOT NULL,
  `hora_atendimento` VARCHAR(8) NOT NULL,
  `historico_paciente` TEXT NULL,
  `historico_familiar` TEXT NULL,
  `prescricao` TEXT NULL,
  `diagnostico` TEXT NULL,
  `situacao_paciente` VARCHAR(50) NOT NULL,
  `PACIENTE_id_paciente` BIGINT UNSIGNED NOT NULL,
  `COLABORADOR_id_colaborador` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_atendimento`),
  CONSTRAINT `fk_atendimento_PACIENTE_id_paciente` FOREIGN KEY (`PACIENTE_id_paciente`) REFERENCES `paciente`(`id_paciente`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `fk_atendimento_COLABORADOR_id_colab` FOREIGN KEY (`COLABORADOR_id_colaborador`) REFERENCES `colaborador`(`id_colaborador`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `registro_medicacao` (
  `id_registro_medicacao` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(120) NOT NULL,
  `fabricante` VARCHAR(120) NULL,
  `lote` VARCHAR(50) NULL,
  `dose` VARCHAR(60) NOT NULL,
  `data_aplicacao` DATE NOT NULL,
  `observacao` TEXT NULL,
  `PACIENTE_id_paciente` BIGINT UNSIGNED NOT NULL,
  `COLABORADOR_id_colaborador` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_registro_medicacao`),
  CONSTRAINT `fk_registro_medicacao_PACIENTE_id_paciente` FOREIGN KEY (`PACIENTE_id_paciente`) REFERENCES `paciente`(`id_paciente`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `fk_registro_medicacao_COLABORADOR_id_colab` FOREIGN KEY (`COLABORADOR_id_colaborador`) REFERENCES `colaborador`(`id_colaborador`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `estoque` (
  `id_item` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_item` VARCHAR(120) NOT NULL,
  `categoria` VARCHAR(60) NOT NULL,
  `quantidade` INT UNSIGNED NOT NULL,
  `validade` DATE NULL,
  `localizacao` VARCHAR(100) NOT NULL,
  `FORNECEDOR_id_fornecedor` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_item`),
  CONSTRAINT `fk_estoque_FORNECEDOR_id_fornec` FOREIGN KEY (`FORNECEDOR_id_fornecedor`) REFERENCES `fornecedor`(`id_fornecedor`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `ck_estoque_saldo` CHECK (`quantidade` >= 0)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `epi` (
  `id_epi` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(120) NOT NULL,
  `tipo` VARCHAR(60) NOT NULL,
  `quantidade` INT UNSIGNED NOT NULL,
  `validade` DATE NULL,
  `FORNECEDOR_id_fornecedor` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_epi`),
  CONSTRAINT `fk_epi_FORNECEDOR_id_fornec` FOREIGN KEY (`FORNECEDOR_id_fornecedor`) REFERENCES `fornecedor`(`id_fornecedor`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `equipamento` (
  `id_equipamento` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(120) NOT NULL,
  `tipo` VARCHAR(60) NOT NULL,
  `numero_patrimonio` VARCHAR(50) NULL,
  `quantidade` INT UNSIGNED NOT NULL,
  `estado_conservacao` VARCHAR(40) NOT NULL,
  `FORNECEDOR_id_fornecedor` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_equipamento`),
  CONSTRAINT `uq_equipamento_numero_patrimonio` UNIQUE (`numero_patrimonio`),
  CONSTRAINT `fk_equipamento_FORNECEDOR_id_fornec` FOREIGN KEY (`FORNECEDOR_id_fornecedor`) REFERENCES `fornecedor`(`id_fornecedor`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `requisicao_de_materiais` (
  `id_requisicao` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_requisicao` DATE NOT NULL,
  `quantidade` INT UNSIGNED NOT NULL,
  `status` VARCHAR(20) NOT NULL,
  `observacao` TEXT NULL,
  `COLABORADOR_id_colaborador` BIGINT UNSIGNED NOT NULL,
  `ESTOQUE_id_item` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_requisicao`),
  CONSTRAINT `fk_requisicao_de_materia_COLABORADOR_id_colab` FOREIGN KEY (`COLABORADOR_id_colaborador`) REFERENCES `colaborador`(`id_colaborador`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `fk_requisicao_de_materia_ESTOQUE_id_item` FOREIGN KEY (`ESTOQUE_id_item`) REFERENCES `estoque`(`id_item`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `ck_requisicao_quant` CHECK (`quantidade` > 0)
) ENGINE=InnoDB;
