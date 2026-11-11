-- SISTEMA HOSPITAL INFANTIL - MODELO FISICO CONVERTIDO PARA MYSQL 8.0+
-- Arquivos do projeto: diagramas (Data Modeler) e relatorio do grupo (out. 2026).
-- Uso acadêmico e dados fictícios. Sem dados reais de pacientes.
-- Alterações em relação ao diagrama Oracle: tipos convertidos;
-- UNIQ em USUARIO.COLABORADOR_id_colaborador para cumprir regra 0..1 declarada no relatório.
-- Não executar em banco de produção.
USE hospital_infantil;
START TRANSACTION;

-- PACIENTE: 10 registros demonstrativos
INSERT INTO `paciente` (`id_paciente`, `nome`, `nome_social`, `genero`, `data_nascimento`, `tipo_sanguineo`, `endereco`, `complemento`, `telefone`, `telefone_fixo`, `email`, `condicao`, `observacao`) VALUES
  (1, 'Ana Oliveira', NULL, 'Não informado', '2015-02-02', 'O+', 'Rua Exemplo 1, 101', NULL, NULL, NULL, NULL, NULL, 'Cadastro fictício para teste acadêmico'),
  (2, 'Bruno Ferreira', NULL, 'Não informado', '2016-03-03', 'B+', 'Rua Exemplo 2, 102', NULL, NULL, NULL, NULL, NULL, 'Cadastro fictício para teste acadêmico'),
  (3, 'Camila Lima', NULL, 'Não informado', '2017-04-04', 'AB+', 'Rua Exemplo 3, 103', NULL, NULL, NULL, NULL, NULL, 'Cadastro fictício para teste acadêmico'),
  (4, 'Daniel Souza', NULL, 'Não informado', '2018-05-05', 'A+', 'Rua Exemplo 4, 104', NULL, NULL, NULL, NULL, NULL, 'Cadastro fictício para teste acadêmico'),
  (5, 'Elisa Almeida', NULL, 'Não informado', '2019-06-06', 'O+', 'Rua Exemplo 5, 105', NULL, NULL, NULL, NULL, NULL, 'Cadastro fictício para teste acadêmico'),
  (6, 'Felipe Santos', NULL, 'Não informado', '2020-07-07', 'B+', 'Rua Exemplo 6, 106', NULL, NULL, NULL, NULL, NULL, 'Cadastro fictício para teste acadêmico'),
  (7, 'Gabriela Ribeiro', NULL, 'Não informado', '2021-08-08', 'AB+', 'Rua Exemplo 7, 107', NULL, NULL, NULL, NULL, NULL, 'Cadastro fictício para teste acadêmico'),
  (8, 'Heitor Gomes', NULL, 'Não informado', '2022-09-09', 'A+', 'Rua Exemplo 8, 108', NULL, NULL, NULL, NULL, NULL, 'Cadastro fictício para teste acadêmico'),
  (9, 'Isabela Costa', NULL, 'Não informado', '2023-10-10', 'O+', 'Rua Exemplo 9, 109', NULL, NULL, NULL, NULL, NULL, 'Cadastro fictício para teste acadêmico'),
  (10, 'João Martins', NULL, 'Não informado', '2014-11-11', 'B+', 'Rua Exemplo 10, 110', NULL, NULL, NULL, NULL, NULL, 'Cadastro fictício para teste acadêmico');

-- COLABORADOR: 10 registros demonstrativos
INSERT INTO `colaborador` (`id_colaborador`, `nome`, `cpf`, `departamento`, `cargo`, `especialidade`, `crm`, `telefone`, `telefone_fixo`, `cidade`, `email`, `turno`) VALUES
  (1, 'Daniel Santos', '00000000001', 'Recepção', 'Atendente', NULL, NULL, NULL, NULL, 'Cidade Exemplo', 'colaborador1@exemplo.test', 'Diurno'),
  (2, 'Elisa Ribeiro', '00000000002', 'Almoxarifado', 'Estoquista', NULL, NULL, NULL, NULL, 'Cidade Exemplo', 'colaborador2@exemplo.test', 'Diurno'),
  (3, 'Felipe Gomes', '00000000003', 'Pediatria', 'Médico', 'Pediatria', 'CRM-DEMO-3', NULL, NULL, 'Cidade Exemplo', 'colaborador3@exemplo.test', 'Diurno'),
  (4, 'Gabriela Costa', '00000000004', 'Administração', 'Analista', NULL, NULL, NULL, NULL, 'Cidade Exemplo', 'colaborador4@exemplo.test', 'Diurno'),
  (5, 'Heitor Martins', '00000000005', 'Enfermagem', 'Enfermeiro', NULL, NULL, NULL, NULL, 'Cidade Exemplo', 'colaborador5@exemplo.test', 'Diurno'),
  (6, 'Isabela Oliveira', '00000000006', 'Recepção', 'Atendente', NULL, NULL, NULL, NULL, 'Cidade Exemplo', 'colaborador6@exemplo.test', 'Diurno'),
  (7, 'João Ferreira', '00000000007', 'Almoxarifado', 'Estoquista', NULL, NULL, NULL, NULL, 'Cidade Exemplo', 'colaborador7@exemplo.test', 'Diurno'),
  (8, 'Ana Lima', '00000000008', 'Pediatria', 'Médico', 'Pediatria', 'CRM-DEMO-8', NULL, NULL, 'Cidade Exemplo', 'colaborador8@exemplo.test', 'Diurno'),
  (9, 'Bruno Souza', '00000000009', 'Administração', 'Analista', NULL, NULL, NULL, NULL, 'Cidade Exemplo', 'colaborador9@exemplo.test', 'Diurno'),
  (10, 'Camila Almeida', '00000000010', 'Enfermagem', 'Enfermeiro', NULL, NULL, NULL, NULL, 'Cidade Exemplo', 'colaborador10@exemplo.test', 'Diurno');

-- FORNECEDOR: 10 registros demonstrativos
INSERT INTO `fornecedor` (`id_fornecedor`, `razao_social`, `cnpj`, `localidade`, `contato`, `email`, `telefone`) VALUES
  (1, 'Fornecedor Fictício 1 Ltda.', '00000000000001', 'Cidade Exemplo', 'Contato de teste', 'fornecedor1@exemplo.test', NULL),
  (2, 'Fornecedor Fictício 2 Ltda.', '00000000000002', 'Cidade Exemplo', 'Contato de teste', 'fornecedor2@exemplo.test', NULL),
  (3, 'Fornecedor Fictício 3 Ltda.', '00000000000003', 'Cidade Exemplo', 'Contato de teste', 'fornecedor3@exemplo.test', NULL),
  (4, 'Fornecedor Fictício 4 Ltda.', '00000000000004', 'Cidade Exemplo', 'Contato de teste', 'fornecedor4@exemplo.test', NULL),
  (5, 'Fornecedor Fictício 5 Ltda.', '00000000000005', 'Cidade Exemplo', 'Contato de teste', 'fornecedor5@exemplo.test', NULL),
  (6, 'Fornecedor Fictício 6 Ltda.', '00000000000006', 'Cidade Exemplo', 'Contato de teste', 'fornecedor6@exemplo.test', NULL),
  (7, 'Fornecedor Fictício 7 Ltda.', '00000000000007', 'Cidade Exemplo', 'Contato de teste', 'fornecedor7@exemplo.test', NULL),
  (8, 'Fornecedor Fictício 8 Ltda.', '00000000000008', 'Cidade Exemplo', 'Contato de teste', 'fornecedor8@exemplo.test', NULL),
  (9, 'Fornecedor Fictício 9 Ltda.', '00000000000009', 'Cidade Exemplo', 'Contato de teste', 'fornecedor9@exemplo.test', NULL),
  (10, 'Fornecedor Fictício 10 Ltda.', '00000000000010', 'Cidade Exemplo', 'Contato de teste', 'fornecedor10@exemplo.test', NULL);

-- USUARIO: 10 registros demonstrativos
INSERT INTO `usuario` (`id_usuario`, `login`, `senha_hash`, `nivel_acesso`, `status`, `COLABORADOR_id_colaborador`) VALUES
  (1, 'demo01', 'NAO_UTILIZAR_HASH_FICTICIO_01', 'recepcao', 'ativo', 1),
  (2, 'demo02', 'NAO_UTILIZAR_HASH_FICTICIO_02', 'almoxarifado', 'ativo', 2),
  (3, 'demo03', 'NAO_UTILIZAR_HASH_FICTICIO_03', 'saude', 'ativo', 3),
  (4, 'demo04', 'NAO_UTILIZAR_HASH_FICTICIO_04', 'administracao', 'ativo', 4),
  (5, 'demo05', 'NAO_UTILIZAR_HASH_FICTICIO_05', 'saude', 'ativo', 5),
  (6, 'demo06', 'NAO_UTILIZAR_HASH_FICTICIO_06', 'recepcao', 'ativo', 6),
  (7, 'demo07', 'NAO_UTILIZAR_HASH_FICTICIO_07', 'almoxarifado', 'ativo', 7),
  (8, 'demo08', 'NAO_UTILIZAR_HASH_FICTICIO_08', 'saude', 'ativo', 8),
  (9, 'demo09', 'NAO_UTILIZAR_HASH_FICTICIO_09', 'administracao', 'ativo', 9),
  (10, 'demo10', 'NAO_UTILIZAR_HASH_FICTICIO_10', 'saude', 'ativo', 10);

-- DOCUMENTACAO: 10 registros demonstrativos
INSERT INTO `documentacao` (`id_documentacao`, `tipo_documento`, `numero_documento`, `data_emissao`, `observacao`, `PACIENTE_id_paciente`) VALUES
  (1, 'Registro interno', 'DEMO-00001', '2026-01-03', 'Somente metadados demonstrativos', 1),
  (2, 'Registro interno', 'DEMO-00002', '2026-01-04', 'Somente metadados demonstrativos', 2),
  (3, 'Registro interno', 'DEMO-00003', '2026-01-05', 'Somente metadados demonstrativos', 3),
  (4, 'Registro interno', 'DEMO-00004', '2026-01-06', 'Somente metadados demonstrativos', 4),
  (5, 'Registro interno', 'DEMO-00005', '2026-01-07', 'Somente metadados demonstrativos', 5),
  (6, 'Registro interno', 'DEMO-00006', '2026-01-08', 'Somente metadados demonstrativos', 6),
  (7, 'Registro interno', 'DEMO-00007', '2026-01-09', 'Somente metadados demonstrativos', 7),
  (8, 'Registro interno', 'DEMO-00008', '2026-01-10', 'Somente metadados demonstrativos', 8),
  (9, 'Registro interno', 'DEMO-00009', '2026-01-11', 'Somente metadados demonstrativos', 9),
  (10, 'Registro interno', 'DEMO-00010', '2026-01-12', 'Somente metadados demonstrativos', 10);

-- ACOMPANHANTE: 10 registros demonstrativos
INSERT INTO `acompanhante` (`id_acompanhante`, `nome`, `data_nascimento`, `tipo_sanguineo`, `cpf`, `endereco`, `telefone`, `telefone_fixo`, `email`, `grau_parentesco`, `PACIENTE_id_paciente`) VALUES
  (1, 'Responsável Fictício 1', '1981-08-15', NULL, NULL, NULL, NULL, NULL, 'acompanhante1@exemplo.test', 'Responsável informado', 1),
  (2, 'Responsável Fictício 2', '1982-08-15', NULL, NULL, NULL, NULL, NULL, 'acompanhante2@exemplo.test', 'Responsável informado', 2),
  (3, 'Responsável Fictício 3', '1983-08-15', NULL, NULL, NULL, NULL, NULL, 'acompanhante3@exemplo.test', 'Responsável informado', 3),
  (4, 'Responsável Fictício 4', '1984-08-15', NULL, NULL, NULL, NULL, NULL, 'acompanhante4@exemplo.test', 'Responsável informado', 4),
  (5, 'Responsável Fictício 5', '1985-08-15', NULL, NULL, NULL, NULL, NULL, 'acompanhante5@exemplo.test', 'Responsável informado', 5),
  (6, 'Responsável Fictício 6', '1986-08-15', NULL, NULL, NULL, NULL, NULL, 'acompanhante6@exemplo.test', 'Responsável informado', 6),
  (7, 'Responsável Fictício 7', '1987-08-15', NULL, NULL, NULL, NULL, NULL, 'acompanhante7@exemplo.test', 'Responsável informado', 7),
  (8, 'Responsável Fictício 8', '1988-08-15', NULL, NULL, NULL, NULL, NULL, 'acompanhante8@exemplo.test', 'Responsável informado', 8),
  (9, 'Responsável Fictício 9', '1989-08-15', NULL, NULL, NULL, NULL, NULL, 'acompanhante9@exemplo.test', 'Responsável informado', 9),
  (10, 'Responsável Fictício 10', '1980-08-15', NULL, NULL, NULL, NULL, NULL, 'acompanhante10@exemplo.test', 'Responsável informado', 10);

-- ATENDIMENTO: 10 registros demonstrativos
INSERT INTO `atendimento` (`id_atendimento`, `motivo`, `data_atendimento`, `hora_atendimento`, `historico_paciente`, `historico_familiar`, `prescricao`, `diagnostico`, `situacao_paciente`, `PACIENTE_id_paciente`, `COLABORADOR_id_colaborador`) VALUES
  (1, 'Retorno clínico', '2026-10-06', '09:30:00', NULL, NULL, NULL, NULL, 'Em acompanhamento', 2, 1),
  (2, 'Consulta pediátrica', '2026-10-07', '10:30:00', NULL, NULL, NULL, NULL, 'Em acompanhamento', 3, 2),
  (3, 'Avaliação de rotina', '2026-10-08', '11:30:00', NULL, NULL, NULL, NULL, 'Em acompanhamento', 4, 3),
  (4, 'Retorno clínico', '2026-10-09', '12:30:00', NULL, NULL, NULL, NULL, 'Em acompanhamento', 5, 4),
  (5, 'Consulta pediátrica', '2026-10-10', '13:30:00', NULL, NULL, NULL, NULL, 'Em acompanhamento', 6, 5),
  (6, 'Avaliação de rotina', '2026-10-11', '08:30:00', NULL, NULL, NULL, NULL, 'Em acompanhamento', 7, 6),
  (7, 'Retorno clínico', '2026-10-12', '09:30:00', NULL, NULL, NULL, NULL, 'Em acompanhamento', 8, 7),
  (8, 'Consulta pediátrica', '2026-10-13', '10:30:00', NULL, NULL, NULL, NULL, 'Em acompanhamento', 1, 8),
  (9, 'Avaliação de rotina', '2026-10-14', '11:30:00', NULL, NULL, NULL, NULL, 'Em acompanhamento', 2, 9),
  (10, 'Retorno clínico', '2026-10-15', '12:30:00', NULL, NULL, NULL, NULL, 'Em acompanhamento', 3, 10);

-- REGISTRO_MEDICACAO: 10 registros demonstrativos
INSERT INTO `registro_medicacao` (`id_registro_medicacao`, `nome`, `fabricante`, `lote`, `dose`, `data_aplicacao`, `observacao`, `PACIENTE_id_paciente`, `COLABORADOR_id_colaborador`) VALUES
  (1, 'Medicamento teste B', 'Laboratório demonstrativo', 'L-DEMO-001', 'Conforme prescrição fictícia', '2026-10-06', 'Registro simulado; não indica conduta clínica', 2, 1),
  (2, 'Medicamento teste C', 'Laboratório demonstrativo', 'L-DEMO-002', 'Conforme prescrição fictícia', '2026-10-07', 'Registro simulado; não indica conduta clínica', 3, 2),
  (3, 'Medicamento teste A', 'Laboratório demonstrativo', 'L-DEMO-003', 'Conforme prescrição fictícia', '2026-10-08', 'Registro simulado; não indica conduta clínica', 4, 3),
  (4, 'Medicamento teste B', 'Laboratório demonstrativo', 'L-DEMO-004', 'Conforme prescrição fictícia', '2026-10-09', 'Registro simulado; não indica conduta clínica', 5, 4),
  (5, 'Medicamento teste C', 'Laboratório demonstrativo', 'L-DEMO-005', 'Conforme prescrição fictícia', '2026-10-10', 'Registro simulado; não indica conduta clínica', 6, 5),
  (6, 'Medicamento teste A', 'Laboratório demonstrativo', 'L-DEMO-006', 'Conforme prescrição fictícia', '2026-10-11', 'Registro simulado; não indica conduta clínica', 7, 6),
  (7, 'Medicamento teste B', 'Laboratório demonstrativo', 'L-DEMO-007', 'Conforme prescrição fictícia', '2026-10-12', 'Registro simulado; não indica conduta clínica', 8, 7),
  (8, 'Medicamento teste C', 'Laboratório demonstrativo', 'L-DEMO-008', 'Conforme prescrição fictícia', '2026-10-13', 'Registro simulado; não indica conduta clínica', 1, 8),
  (9, 'Medicamento teste A', 'Laboratório demonstrativo', 'L-DEMO-009', 'Conforme prescrição fictícia', '2026-10-14', 'Registro simulado; não indica conduta clínica', 2, 9),
  (10, 'Medicamento teste B', 'Laboratório demonstrativo', 'L-DEMO-010', 'Conforme prescrição fictícia', '2026-10-15', 'Registro simulado; não indica conduta clínica', 3, 10);

-- ESTOQUE: 10 registros demonstrativos
INSERT INTO `estoque` (`id_item`, `nome_item`, `categoria`, `quantidade`, `validade`, `localizacao`, `FORNECEDOR_id_fornecedor`) VALUES
  (1, 'Item hospitalar de teste 1', 'Insumo', 15, '2026-12-06', 'Almoxarifado setor 2', 1),
  (2, 'Item hospitalar de teste 2', 'Higiene', 20, '2026-11-08', 'Almoxarifado setor 3', 2),
  (3, 'Item hospitalar de teste 3', 'Material de consumo', 25, '2026-12-10', 'Almoxarifado setor 1', 3),
  (4, 'Item hospitalar de teste 4', 'Insumo', 30, '2026-11-12', 'Almoxarifado setor 2', 4),
  (5, 'Item hospitalar de teste 5', 'Higiene', 35, '2026-12-14', 'Almoxarifado setor 3', 5),
  (6, 'Item hospitalar de teste 6', 'Material de consumo', 40, '2026-11-16', 'Almoxarifado setor 1', 6),
  (7, 'Item hospitalar de teste 7', 'Insumo', 45, '2026-12-18', 'Almoxarifado setor 2', 7),
  (8, 'Item hospitalar de teste 8', 'Higiene', 50, '2026-11-20', 'Almoxarifado setor 3', 8),
  (9, 'Item hospitalar de teste 9', 'Material de consumo', 55, '2026-12-22', 'Almoxarifado setor 1', 9),
  (10, 'Item hospitalar de teste 10', 'Insumo', 60, '2026-11-24', 'Almoxarifado setor 2', 10);

-- EPI: 10 registros demonstrativos
INSERT INTO `epi` (`id_epi`, `nome`, `tipo`, `quantidade`, `validade`, `FORNECEDOR_id_fornecedor`) VALUES
  (1, 'EPI de demonstração 1', 'Avental', 21, '2027-02-15', 1),
  (2, 'EPI de demonstração 2', 'Máscara', 22, '2027-03-15', 2),
  (3, 'EPI de demonstração 3', 'Luva', 23, '2027-04-15', 3),
  (4, 'EPI de demonstração 4', 'Avental', 24, '2027-05-15', 4),
  (5, 'EPI de demonstração 5', 'Máscara', 25, '2027-06-15', 5),
  (6, 'EPI de demonstração 6', 'Luva', 26, '2027-07-15', 6),
  (7, 'EPI de demonstração 7', 'Avental', 27, '2027-08-15', 7),
  (8, 'EPI de demonstração 8', 'Máscara', 28, '2027-09-15', 8),
  (9, 'EPI de demonstração 9', 'Luva', 29, '2027-01-15', 9),
  (10, 'EPI de demonstração 10', 'Avental', 30, '2027-02-15', 10);

-- EQUIPAMENTO: 10 registros demonstrativos
INSERT INTO `equipamento` (`id_equipamento`, `nome`, `tipo`, `numero_patrimonio`, `quantidade`, `estado_conservacao`, `FORNECEDOR_id_fornecedor`) VALUES
  (1, 'Equipamento de teste 1', 'Balança', 'PAT-DEMO-0001', 1, 'Bom', 1),
  (2, 'Equipamento de teste 2', 'Aparelho', 'PAT-DEMO-0002', 1, 'Bom', 2),
  (3, 'Equipamento de teste 3', 'Monitor', 'PAT-DEMO-0003', 1, 'Bom', 3),
  (4, 'Equipamento de teste 4', 'Balança', 'PAT-DEMO-0004', 1, 'Bom', 4),
  (5, 'Equipamento de teste 5', 'Aparelho', 'PAT-DEMO-0005', 1, 'Bom', 5),
  (6, 'Equipamento de teste 6', 'Monitor', 'PAT-DEMO-0006', 1, 'Bom', 6),
  (7, 'Equipamento de teste 7', 'Balança', 'PAT-DEMO-0007', 1, 'Bom', 7),
  (8, 'Equipamento de teste 8', 'Aparelho', 'PAT-DEMO-0008', 1, 'Bom', 8),
  (9, 'Equipamento de teste 9', 'Monitor', 'PAT-DEMO-0009', 1, 'Bom', 9),
  (10, 'Equipamento de teste 10', 'Balança', 'PAT-DEMO-0010', 1, 'Bom', 10);

-- REQUISICAO_DE_MATERIAIS: 10 registros demonstrativos
INSERT INTO `requisicao_de_materiais` (`id_requisicao`, `data_requisicao`, `quantidade`, `status`, `observacao`, `COLABORADOR_id_colaborador`, `ESTOQUE_id_item`) VALUES
  (1, '2026-11-01', 2, 'aprovada', 'Solicitação de demonstração', 1, 1),
  (2, '2026-11-02', 3, 'entregue', 'Solicitação de demonstração', 2, 2),
  (3, '2026-11-03', 4, 'pendente', 'Solicitação de demonstração', 3, 3),
  (4, '2026-11-04', 1, 'aprovada', 'Solicitação de demonstração', 4, 4),
  (5, '2026-11-05', 2, 'entregue', 'Solicitação de demonstração', 5, 5),
  (6, '2026-11-06', 3, 'pendente', 'Solicitação de demonstração', 6, 6),
  (7, '2026-11-07', 4, 'aprovada', 'Solicitação de demonstração', 7, 7),
  (8, '2026-11-08', 1, 'entregue', 'Solicitação de demonstração', 8, 8),
  (9, '2026-11-09', 2, 'pendente', 'Solicitação de demonstração', 9, 9),
  (10, '2026-11-10', 3, 'aprovada', 'Solicitação de demonstração', 10, 10);

COMMIT;
