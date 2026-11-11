#!/usr/bin/env bash
set -euo pipefail

MYSQL_HOST="${MYSQL_HOST:-127.0.0.1}"
MYSQL_PORT="${MYSQL_PORT:-3306}"
MYSQL_USER="${MYSQL_USER:-root}"

query() {
  mysql --host="$MYSQL_HOST" --port="$MYSQL_PORT" --user="$MYSQL_USER" \
    --default-character-set=utf8mb4 --batch --skip-column-names -e "$1"
}

assert_equal() {
  local actual="$1"
  local expected="$2"
  local desc="$3"
  if [[ "$actual" != "$expected" ]]; then
    printf 'FALHOU: %s (esperado %s, obtido %s)\n' "$desc" "$expected" "$actual" >&2
    exit 1
  fi
  printf 'OK: %s (%s)\n' "$desc" "$actual"
}

assert_equal "$(query "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='hospital_infantil' AND table_type='BASE TABLE';")" 12 "12 tabelas"
assert_equal "$(query "SELECT COUNT(*) FROM information_schema.referential_constraints WHERE constraint_schema='hospital_infantil';")" 12 "12 relacionamentos FK"

tables=(paciente colaborador fornecedor usuario documentacao acompanhante atendimento registro_medicacao estoque epi equipamento requisicao_de_materiais)
for table in "${tables[@]}"; do
  assert_equal "$(query "SELECT COUNT(*) FROM hospital_infantil.\`$table\`;")" 10 "10 linhas em $table"
done

if query "INSERT INTO hospital_infantil.atendimento (motivo, data_atendimento, hora_atendimento, situacao_paciente, PACIENTE_id_paciente, COLABORADOR_id_colaborador) VALUES ('teste de FK', CURRENT_DATE(), '12:00', 'teste', 999999, 999999);" >/dev/null 2>&1; then
  echo "FALHOU: foi permitido atendimento com paciente e colaborador inexistentes" >&2
  exit 1
fi
printf 'OK: chave estrangeira rejeitou atendimento com responsáveis inexistentes\n'

echo 'Validação básica concluída (não representa aprovação clínica nem auditoria LGPD).'
