# Como publicar no GitHub

Este pacote já está organizado como a raiz de um repositório Git. Ele **não foi publicado automaticamente** em nenhuma conta.

## Opção 1 — Pelo site (mais simples)

1. Extraia o `.zip` no computador.
2. Entre em [github.com/new](https://github.com/new) e crie um repositório, por exemplo `hospital-infantil-banco-de-dados`.
3. Se desejar que somente o grupo e o professor tenham acesso, escolha **Private**; se for público, confira os nomes e os documentos que ficarão visíveis.
4. No repositório vazio, escolha **uploading an existing file** (ou **Add file → Upload files**).
5. Arraste **os arquivos e pastas de dentro** de `hospital-infantil-banco-de-dados`, preservando `database`, `docs`, `tests` e `.github`. Não envie apenas o ZIP esperando que o GitHub o descompacte.
6. Confira o `README.md` na página inicial e finalize com o commit `Entrega acadêmica: modelagem hospital infantil`.
7. Na aba **Actions**, caso disponível, acompanhe a execução do fluxo de validação MySQL. Isso não substitui as capturas da defesa em Workbench.

**Observação:** o navegador pode não permitir enviar pastas ocultas facilmente (por exemplo `.github` e `.gitignore`). Nesse caso use o Git pelo terminal, conforme abaixo.

## Opção 2 — Pelo Git no terminal

Abra o **Git Bash** ou terminal **dentro da pasta extraída**:

```bash
git init
git add .
git commit -m "Entrega academica: sistema de gestao hospital infantil"
git branch -M main
git remote add origin https://github.com/SEU-USUARIO/hospital-infantil-banco-de-dados.git
git push -u origin main
```

Substitua `SEU-USUARIO` pelo nome real do usuário/organização e crie antes o repositório vazio no GitHub. O GitHub exigirá autenticação (normalmente pelo gerenciador de credenciais, SSH ou token conforme sua configuração).

## Antes de marcar o projeto como concluído

- Confirme que os cinco integrantes e o nome do professor estão corretos.
- Não publique registros de pacientes reais, documentos pessoais, senhas, tokens, arquivos `.env` ou dumps privados.
- Execute a carga em **MySQL 8.0+** para obter evidências reais.
- Confira a aba **Actions** para saber se a verificação automatizada passou; ela ainda não foi executada como parte da criação do pacote.
- Peça autorização à equipe caso pretenda disponibilizar publicamente o relatório e os nomes.
