# Evidências de funcionamento (a produzir)

Esta pasta contém as instruções para evidências da defesa. **Nenhuma captura de MySQL foi apresentada como se já tivesse sido executada.**

Depois de executar os scripts em MySQL Workbench 8.0+, adicionar capturas **verdadeiras** e, se desejado, sua descrição no pull request:

1. `01-show-tables.png` — versão do servidor e relação de 12 tabelas (`SHOW TABLES;`).
2. `02-contagem-por-tabela.png` — resultado da consulta Q6: dez linhas em cada uma das 12 entidades.
3. `03-relatorio-atendimentos.png` — consulta Q1 com JOIN entre atendimento, paciente e colaborador.
4. `04-relatorio-medicacao.png` — consulta Q2 com rastreabilidade.
5. `05-relatorio-estoque.png` — consulta Q3 e/ou Q4.
6. `06-comandos-ddl-dml.png` — saída dos exemplos CREATE, ALTER, INSERT, UPDATE e DELETE.
7. `07-transacoes.png` — resultados coerentes de ROLLBACK e COMMIT.
8. `08-privilegios.png` — comandos GRANT/REVOKE executados apenas com permissões adequadas.

**Cuidados:** omitir credenciais, endereços privados, dados pessoais reais e telas com informações sigilosas. Não editar imagens para simular sucesso de comandos que falharam.

Quando os testes estiverem documentados, registrar data, versão do MySQL, autor da captura e observações. O fluxo de GitHub Actions também pode registrar resultados automáticos, **se tiver sido executado**.
