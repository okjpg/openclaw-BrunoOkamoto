# Checklist Final — Validação Completa do Curso

> Módulo 11: Wrap-up  
> Use este checklist para confirmar que tudo foi configurado corretamente.

---

## 🎯 Como Usar Este Checklist

1. Vá módulo por módulo, verificando cada item
2. Marque `[x]` conforme confirmar que funciona
3. Se algo falhar, volte ao módulo correspondente e corrija
4. **Não pule itens!** Cada um valida algo crítico
5. Ao final, você terá um agente OpenClaw de produção, 100% funcional

---

## ✅ Módulo 1: Setup & Infraestrutura

**Objetivo:** Gateway rodando, Telegram conectado, VPS seguro.

- [ ] `openclaw gateway status` retorna "running"
- [ ] Gateway está acessível via URL pública (se configurado)
- [ ] Telegram bot responde no chat 1:1
- [ ] VPS tem IP fixo e está acessível via SSH
- [ ] Node.js versão ≥ 18 instalado (`node --version`)
- [ ] Git configurado (`git config user.name` e `user.email`)
- [ ] Workspace em `/root/.openclaw/workspace-<nome>` existe
- [ ] `.env` existe e contém `TELEGRAM_TOKEN`

**Teste rápido:**
```bash
curl -I http://localhost:3339/health  # deve retornar 200 OK
```

---

## 🔒 Módulo 2: Segurança

**Objetivo:** Servidor hardened, credenciais seguras, allowlist ativo.

- [ ] UFW instalado e ativo (`ufw status`)
- [ ] Apenas portas necessárias abertas (22, 80, 443, 3339 se gateway público)
- [ ] Fail2ban instalado e rodando (`systemctl status fail2ban`)
- [ ] `dmPolicy: "allowlist"` configurado no `config.yaml`
- [ ] `.env` contém credenciais (não hardcodadas no código)
- [ ] `.env` está no `.gitignore`
- [ ] Root login via SSH desabilitado (ou usa chave SSH)
- [ ] Backups automáticos configurados (cron ou script)

**Teste rápido:**
```bash
cat ~/.openclaw/agents/<agente>/config.yaml | grep dmPolicy  # deve ser "allowlist"
grep ".env" .gitignore  # deve existir
```

---

## 🧬 Módulo 3: Identidade

**Objetivo:** Agente tem personalidade, conhece você, tem nome próprio.

- [ ] `SOUL.md` existe e tem ≥100 linhas
- [ ] `SOUL.md` contém personalidade forte (não genérico)
- [ ] `SOUL.md` tem anti-patterns com exemplos ❌/✅
- [ ] `USER.md` existe e tem ≥200 linhas (idealmente 400+)
- [ ] `USER.md` contém rotina, estilo de comunicação, negócios
- [ ] `USER.md` define horários de "não perturbe"
- [ ] `AGENTS.md` configurado com regras operacionais
- [ ] `IDENTITY.md` existe (nome, emoji, email próprio)
- [ ] `BOOT.md` existe com checklist de startup

**Teste rápido:**
Pergunte ao agente: "Quem é você?" e "Quem sou eu?" — as respostas devem ser detalhadas e personalizadas.

---

## 🧠 Módulo 4: Memória

**Objetivo:** Memória persistente, daily notes, compactação automática.

- [ ] Pasta `memory/` existe no workspace
- [ ] `memory/YYYY-MM-DD.md` sendo criado automaticamente todo dia
- [ ] `MEMORY.md` existe e contém insights curados (não raw logs)
- [ ] `memory/decisions.md` ou similar existe (opcional mas recomendado)
- [ ] Compactação configurada (cron semanal ou mensal)
- [ ] Agente extrai lições ANTES de compactar (não perde contexto)
- [ ] Workflow de compactação documentado em `AGENTS.md`

**Teste rápido:**
```bash
ls -la memory/  # deve ter arquivo da data de hoje
wc -l MEMORY.md  # deve ter pelo menos 50 linhas se já usou por alguns dias
```

---

## 🔌 Módulo 5: Integrações

**Objetivo:** Pelo menos 1 integração externa funcionando + 1 cron isolado.

- [ ] Pelo menos 1 integração configurada (Gmail, Calendar, GitHub, etc.)
- [ ] Credenciais da integração no `.env` ou 1Password
- [ ] Testei a integração manualmente (ex: "liste meus emails")
- [ ] Pelo menos 1 cron job configurado
- [ ] Cron usa `sessionMode: "isolated"` + `notifyMode: "agentTurn"`
- [ ] **Nunca** `systemEvent` + `main` (isso quebra contexto)
- [ ] Cron rodou pelo menos 1x e funcionou (confira logs)
- [ ] Notificações do cron chegam no canal correto

**Teste rápido:**
```bash
openclaw cron list  # deve listar pelo menos 1 cron
openclaw cron logs <id>  # deve mostrar execuções recentes
```

---

## 🛠️ Módulo 6: Skills

**Objetivo:** 2-3 skills instaladas e funcionando.

- [ ] Pelo menos 2 skills instaladas (`openclaw skill list`)
- [ ] Skills foram **revisadas** antes de instalar (segurança)
- [ ] Skills testadas manualmente e funcionam
- [ ] Configurações de skills documentadas em `TOOLS.md`
- [ ] Não tenho skills redundantes (ex: 3 geradores de imagem)
- [ ] Entendo quando usar skill vs quando criar cron vs quando pedir ao main agent

**Teste rápido:**
```bash
openclaw skill list --enabled  # deve listar as skills ativas
```
Peça ao agente para usar uma skill e confirme que funciona.

---

## 💓 Módulo 7: Proatividade

**Objetivo:** Heartbeats configurados, agente checa coisas periodicamente.

- [ ] `HEARTBEAT.md` existe e contém checklist curto
- [ ] Heartbeat configurado no `config.yaml` (interval ~30min)
- [ ] Heartbeat usa modelo barato (Haiku ou Sonnet, não Opus)
- [ ] `heartbeat-state.json` existe em `memory/` (tracking de checks)
- [ ] Agente checa email/calendar/notificações algumas vezes ao dia
- [ ] Agente sabe quando ficar quieto (HEARTBEAT_OK) vs quando avisar
- [ ] Não perturba de madrugada (23:00-08:00) a menos que urgente

**Teste rápido:**
Aguarde um heartbeat (ou force um manualmente) e veja se o agente faz alguma ação proativa ou retorna `HEARTBEAT_OK`.

---

## 🤝 Módulo 8: Multi-Agentes (Opcional)

**Objetivo:** Time de agentes configurado, com leveling e hierarquia.

Se você configurou multi-agentes:

- [ ] `TEAM.md` existe com descrição da equipe
- [ ] Cada agente tem seu próprio `SOUL.md`
- [ ] Sistema de níveis (L1-L5) documentado
- [ ] Agentes novos começam em L1 (Observer)
- [ ] Promoções baseadas em performance (não automáticas)
- [ ] Main agent sabe quando delegar vs fazer sozinho
- [ ] Subagents não tentam ser o main agent

**Teste rápido:**
Peça ao main agent para spawnar um subagent e execute uma tarefa delegada. Confirme que o subagent reporta de volta ao main.

---

## 🛡️ Módulo 9: Sistema Imunológico

**Objetivo:** Watchdog, feedback loops, model split, backups automáticos.

- [ ] Watchdog configurado (detecta agente travado/loop infinito)
- [ ] Retry policy: 2x retry → avisar humano (nunca limbo silencioso)
- [ ] Model split: Sonnet pra crons, Opus pra interação, Haiku pra heartbeats
- [ ] Feedback loops: agente aprende com erros e atualiza docs
- [ ] Backup automático antes de mudanças estruturais
- [ ] Logs de erro monitorados (manualmente ou via cron)
- [ ] Rollback plan documentado (se algo der errado)

**Teste rápido:**
Simule um erro (ex: cron que falha) e confirme que:
1. Retry acontece
2. Você é notificado após 2 falhas
3. Erro é logado em `memory/`

---

## 📊 Módulo 10: Mission Control (Opcional)

**Objetivo:** Painel visual para ver estado do sistema.

Se você configurou Mission Control:

- [ ] Ferramenta escolhida (NocoDB/Notion/Sheets/Custom) rodando
- [ ] Tabelas criadas (Tasks, Memory, Crons, Health)
- [ ] Agente consegue escrever no painel
- [ ] Crons atualizam painel automaticamente
- [ ] Dashboard acessível via browser
- [ ] Credenciais no `.env` (não hardcodadas)
- [ ] Setup documentado em `docs/mission-control-setup.md`

**Teste rápido:**
Peça ao agente para logar uma tarefa no painel. Abra o painel e confirme que apareceu.

---

## 🎓 Validação Final

**Meta-checklist — confirme que você domina:**

- [ ] Sei reiniciar o gateway (`openclaw gateway restart`)
- [ ] Sei onde ficam os logs (`~/.openclaw/logs/`)
- [ ] Sei criar um cron isolado com agentTurn
- [ ] Sei quando usar Sonnet vs Opus vs Haiku
- [ ] Sei fazer backup manual do workspace
- [ ] Sei revisar código de uma skill antes de instalar
- [ ] Sei editar `config.yaml` sem quebrar o agente
- [ ] Sei usar `.env` pra credenciais
- [ ] Sei quando o agente deve me perguntar vs fazer sozinho
- [ ] Li as 10 Regras Invioláveis e entendo por quê cada uma importa

---

## 🚀 Próximos Passos

Se marcou tudo acima, **parabéns!** Você tem um agente OpenClaw de produção rodando.

**Agora:**
1. **Use por 7 dias** — deixe ele trabalhar, veja o que funciona e o que não funciona
2. **Itere** — ajuste SOUL.md, HEARTBEAT.md, crons baseado no uso real
3. **Expanda** — adicione mais skills, integrações, automações conforme surgir necessidade
4. **Documente** — seu `AGENTS.md` e `TOOLS.md` devem crescer com o tempo
5. **Compartilhe** — ensine alguém, contribua na comunidade, crie skills

**Lembre-se das 10 Regras Invioláveis** (veja `docs/10-regras-inviolaveis.md`).

---

## 📝 Log de Validação

Registre quando completou este checklist:

```
Data: _______________
Itens completos: ___ / 70+
Tempo desde início do curso: ___ dias
Próxima revisão: _______________ (recomendado: 30 dias)
```

---

**Você não completou um curso. Você construiu um sistema.** 🎉
