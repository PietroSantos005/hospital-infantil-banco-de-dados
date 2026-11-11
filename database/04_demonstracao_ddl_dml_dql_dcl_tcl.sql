-- DDL / DML / DQL / DCL / TCL: GUIA DE DEMONSTRACAO EM MYSQL 8.0+
-- Executar manualmente, conferindo cada saída. Requer privilégios de administrador para DCL.
USE hospital_infantil;

-- DDL: tabela de ensaio independente, alteracao e remocao.
CREATE TABLE IF NOT EXISTS teste_comandos (id INT PRIMARY KEY, rotulo VARCHAR(50));
ALTER TABLE teste_comandos ADD COLUMN criado_em DATE NULL;
SHOW CREATE TABLE teste_comandos;

-- DML + TCL: demonstrar INSERT/UPDATE/DELETE e ROLLBACK sem mudar as entidades.
START TRANSACTION;
INSERT INTO teste_comandos (id, rotulo, criado_em) VALUES (1, 'demonstracao', CURRENT_DATE());
UPDATE teste_comandos SET rotulo = 'alterado' WHERE id = 1;
SELECT * FROM teste_comandos;
DELETE FROM teste_comandos WHERE id = 1;
ROLLBACK;
SELECT * FROM teste_comandos; -- vazio por causa do rollback

-- DML + TCL: persistencia apos COMMIT.
START TRANSACTION;
INSERT INTO teste_comandos (id, rotulo, criado_em) VALUES (2, 'confirmado', CURRENT_DATE());
COMMIT;
SELECT * FROM teste_comandos; -- id 2 deve existir

-- DQL: relatorio.
SELECT status, COUNT(*) AS total FROM requisicao_de_materiais GROUP BY status;

-- DCL: criar papel de consulta, conceder e remover direito de UPDATE.
CREATE ROLE IF NOT EXISTS 'papel_consulta_hospital';
GRANT SELECT, UPDATE ON hospital_infantil.paciente TO 'papel_consulta_hospital';
SHOW GRANTS FOR 'papel_consulta_hospital';
REVOKE UPDATE ON hospital_infantil.paciente FROM 'papel_consulta_hospital';
SHOW GRANTS FOR 'papel_consulta_hospital';

-- DDL: remocao da tabela de ensaio.
DROP TABLE teste_comandos;
