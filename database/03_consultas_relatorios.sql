-- CONSULTAS/RELATORIOS (DQL) - EXECUTAR APOS 01 E 02
USE hospital_infantil;

-- Q1: Atendimentos vinculados ao paciente e ao profissional.
SELECT a.id_atendimento, p.nome AS paciente, c.nome AS profissional,
       a.data_atendimento, a.situacao_paciente
FROM atendimento a
JOIN paciente p ON p.id_paciente = a.PACIENTE_id_paciente
JOIN colaborador c ON c.id_colaborador = a.COLABORADOR_id_colaborador
ORDER BY a.data_atendimento DESC;

-- Q2: Rastreabilidade de aplicações de medicação.
SELECT p.nome AS paciente, m.nome AS medicamento, m.lote,
       m.data_aplicacao, c.nome AS profissional
FROM registro_medicacao m
JOIN paciente p ON p.id_paciente = m.PACIENTE_id_paciente
JOIN colaborador c ON c.id_colaborador = m.COLABORADOR_id_colaborador
ORDER BY m.data_aplicacao DESC;

-- Q3: Materiais com validade até 60 dias a partir de 11/11/2026.
SELECT nome_item, quantidade, validade, localizacao
FROM estoque
WHERE validade BETWEEN '2026-11-11' AND DATE_ADD('2026-11-11', INTERVAL 60 DAY)
ORDER BY validade;

-- Q4: Requisições e saldos.
SELECT r.id_requisicao, c.nome AS solicitante, e.nome_item,
       r.quantidade AS quantidade_solicitada, e.quantidade AS saldo_atual, r.status
FROM requisicao_de_materiais r
JOIN colaborador c ON c.id_colaborador = r.COLABORADOR_id_colaborador
JOIN estoque e ON e.id_item = r.ESTOQUE_id_item
ORDER BY r.id_requisicao;

-- Q5: Total de requisições por status.
SELECT status, COUNT(*) AS total
FROM requisicao_de_materiais GROUP BY status ORDER BY total DESC;

-- Q6: Quantidade de registros de CADA UMA DAS 12 entidades.
SELECT 'paciente' AS tabela, COUNT(*) AS linhas FROM paciente
UNION ALL SELECT 'colaborador', COUNT(*) FROM colaborador
UNION ALL SELECT 'fornecedor', COUNT(*) FROM fornecedor
UNION ALL SELECT 'usuario', COUNT(*) FROM usuario
UNION ALL SELECT 'documentacao', COUNT(*) FROM documentacao
UNION ALL SELECT 'acompanhante', COUNT(*) FROM acompanhante
UNION ALL SELECT 'atendimento', COUNT(*) FROM atendimento
UNION ALL SELECT 'registro_medicacao', COUNT(*) FROM registro_medicacao
UNION ALL SELECT 'estoque', COUNT(*) FROM estoque
UNION ALL SELECT 'epi', COUNT(*) FROM epi
UNION ALL SELECT 'equipamento', COUNT(*) FROM equipamento
UNION ALL SELECT 'requisicao_de_materiais', COUNT(*) FROM requisicao_de_materiais;

-- Q7: Pacientes cadastrados sem atendimento (regra permitida).
SELECT p.id_paciente, p.nome FROM paciente p
LEFT JOIN atendimento a ON a.PACIENTE_id_paciente = p.id_paciente
WHERE a.id_atendimento IS NULL;
