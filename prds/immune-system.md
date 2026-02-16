# PRD: Sistema Imunológico

> "Agents are 30% of the work. The other 70% is the immune system." — Eric Siu
> Jogue no agente: "Implementa este sistema imunológico"

## Contexto

Agentes quebram silenciosamente. Crons falham sem avisar. Sub-agents travam no limbo. Sem monitoramento, você descobre problemas dias depois.

## 1. Watchdog de Crons

Criar um cron que monitora os outros crons:

**Lógica:**
1. Listar todos os crons ativos
2. Checar último run de cada um
3. Se algum falhou → retry automático (até 3x)
4. Se falhou 3x → alertar o usuário no Telegram

**Configuração:**
```json
{
  "name": "Watchdog - Monitor de Crons",
  "schedule": { "kind": "cron", "expr": "0 8 * * *", "tz": "America/Sao_Paulo" },
  "sessionTarget": "isolated",
  "payload": {
    "kind": "agentTurn",
    "message": "Checar saúde de todos os crons. Listar os que falharam nas últimas 24h. Fazer retry dos que falharam. Se algum falhar 3x, alertar no Telegram."
  },
  "delivery": { "mode": "announce" }
}
```

## 2. Feedback Loops

Sistema de aprendizado contínuo: o agente aprende com suas decisões (approve/reject).

### Setup

Criar `memory/feedback/` com arquivos JSON por domínio:

- `content.json` — feedback sobre conteúdo, drafts, sugestões
- `tasks.json` — feedback sobre entregas de tasks
- `recommendations.json` — feedback sobre sugestões de tools/processos

### Formato

```json
{
  "entries": [
    {
      "date": "2026-02-13",
      "context": "Sugeri thread sobre X para LinkedIn",
      "decision": "approve",
      "reason": "Tom certeiro, dados específicos",
      "tags": ["linkedin", "thread", "tom"]
    }
  ]
}
```

### Regras
- Max 30 entradas por arquivo (FIFO — remove as mais antigas)
- Agente DEVE consultar feedback antes de sugerir → evita repetir erros
- Consolidar padrões em `lessons/` mensalmente
- Ciclo: Feedback (granular, JSON) → Lessons (curado, prose) → Decisions (permanente)

## 3. Monitoramento de Custos

### Split de modelos
| Uso | Modelo | Custo relativo |
|-----|--------|---------------|
| Interação direta | Opus | $$$ |
| Crons e automação | Sonnet | $ |
| Heartbeats | Haiku | ¢ |

### Regra
- TODOS os crons devem rodar em Sonnet (nunca Opus)
- Heartbeats em Haiku
- Só a interação direta usa Opus

## 4. Sub-agents: Nunca "Fire and Forget"

Todo sub-agent spawnado DEVE ter follow-up:

1. **Ao spawnar:** informar o que vai fazer
2. **Follow-up:** checar status em 15-30 min
3. **Sucesso:** resumir resultado em linguagem humana
4. **Falha:** retry imediato → se falhar 2x → avisar o usuário
5. **Nunca** deixar cair no limbo silencioso

## 5. Backup antes de mudanças

Antes de criar agentes, modificar config, ou reorganizar workspace:

```bash
mkdir -p backups/$(date +%Y-%m-%d)
cp /root/.openclaw/openclaw.json backups/$(date +%Y-%m-%d)/
```

## Checklist

- [ ] Watchdog de crons ativo
- [ ] Feedback loops configurados (pelo menos 1 domínio)
- [ ] Split de modelos aplicado
- [ ] Regra de sub-agents documentada no AGENTS.md
- [ ] Backup automático antes de mudanças

## Resultado Esperado

Sistema resiliente que se auto-monitora, aprende com decisões e não deixa nada cair no limbo.
