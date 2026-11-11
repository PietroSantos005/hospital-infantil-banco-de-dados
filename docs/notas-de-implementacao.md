# Notas de implementação e limitações

## Contexto

O projeto representa um sistema web interno **planejado** para um hospital municipal infantil. Os diagramas oficiais da equipe vieram do Oracle SQL Developer Data Modeler; a implementação SQL anexada é uma **conversão acadêmica** voltada para MySQL 8.0+.

## Conversão Oracle → MySQL

| No modelo Oracle | Na proposta MySQL | Observação |
| --- | --- | --- |
| `NUMBER(10)` | `BIGINT UNSIGNED` nas PKs/FKs | Conversão de projeto; não é a reprodução exata de limite numérico do Oracle. |
| `VARCHAR2(n)` | `VARCHAR(n)` | Tamanhos em caracteres preservados conforme arquivo físico. |
| `CLOB` | `TEXT` | Pode ter limite de armazenamento diferente. |
| `DATE` | `DATE` | O Oracle permite componente de hora no `DATE`; o tipo `DATE` do MySQL não. |
| Integridade e unicidade | `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `CHECK` | Algumas regras exigem validação adicional na aplicação. |

O nome técnico `requisicao_de_materiais` segue o diagrama físico disponibilizado pela equipe. A coluna de vínculo a colaborador em `usuario` recebeu também uma restrição de unicidade, para representar o relacionamento de 0..1 conta por colaborador descrito no relatório.

## Regras ainda não implementadas

1. Movimentações auditáveis, entrada/saída de estoque e baixa automática mediante entrega.
2. Relação explícita entre aplicação de medicação e atendimento correspondente.
3. Cadastro e validação formal de responsáveis legais de menores.
4. Histórico imutável de alterações nos registros clínicos.
5. Autorização por perfil no backend, incluindo limites de acesso aos dados clínicos.
6. Tratamento de eventos com timestamp e critérios clínicos validados.
7. Implantação com autenticação, HTTPS, backups, retenção e consentimentos/bases legais pertinentes.

Os campos demonstrativos não comprovam funcionamento de login: `senha_hash` contém **valores intencionalmente não autenticáveis**. Registros não são adequados para uso assistencial.

## Proteção de dados

A base foi criada para exercícios com **dados inventados**. O contexto de prontuário médico pediátrico exige revisão jurídica e de segurança específica antes de uso fora da sala de aula; não se deve disponibilizar um dump de banco com informações pessoais reais em GitHub, ainda que o repositório seja privado.

## Evidências de execução

O arquivo [`pre-validacao-sqlite.txt`](pre-validacao-sqlite.txt) descreve um teste auxiliar do esquema em SQLite. **Não é laudo de conformidade nem evidência de MySQL Workbench.** A pasta [`evidencias`](evidencias/README.md) contém orientações para a equipe anexar capturas e relatórios gerados por execução efetiva.
