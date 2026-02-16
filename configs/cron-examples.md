# Exemplos de Crons Úteis

> Copie e adapte. Todos usam isolated + agentTurn (a forma que funciona).

## 📅 Check de Agenda (diário, 8h)

```json
{
  "name": "Check Agenda",
  "schedule": { "kind": "cron", "expr": "0 8 * * *", "tz": "America/Sao_Paulo" },
  "sessionTarget": "isolated",
  "payload": {
    "kind": "agentTurn",
    "message": "Checar agenda do Google Calendar para hoje e amanhã. Se tiver compromissos, avisar no Telegram com horários e contexto.",
    "model": "anthropic/claude-sonnet-4-5"
  },
  "delivery": { "mode": "announce" }
}
```

## 🔍 Watchdog de Crons (diário, 8h30)

```json
{
  "name": "Watchdog - Monitor de Crons",
  "schedule": { "kind": "cron", "expr": "30 8 * * *", "tz": "America/Sao_Paulo" },
  "sessionTarget": "isolated",
  "payload": {
    "kind": "agentTurn",
    "message": "Listar todos os crons. Checar último run de cada um. Se algum falhou nas últimas 24h, tentar re-executar. Se falhar de novo, alertar no Telegram.",
    "model": "anthropic/claude-sonnet-4-5"
  },
  "delivery": { "mode": "announce" }
}
```

## 📊 Revisão Semanal (sexta, 16h)

```json
{
  "name": "Revisão Semanal",
  "schedule": { "kind": "cron", "expr": "0 16 * * 5", "tz": "America/Sao_Paulo" },
  "sessionTarget": "isolated",
  "payload": {
    "kind": "agentTurn",
    "message": "Fazer revisão semanal: 1) Ler notas diárias da semana 2) Consolidar em topic files 3) Atualizar MEMORY.md 4) Listar pendências 5) Reportar resumo no Telegram.",
    "model": "anthropic/claude-sonnet-4-5"
  },
  "delivery": { "mode": "announce" }
}
```

## ⏰ Lembrete One-shot (exemplo)

```json
{
  "name": "Lembrete: Reunião com Fulano",
  "schedule": { "kind": "at", "at": "2026-02-15T09:00:00-03:00" },
  "sessionTarget": "isolated",
  "payload": {
    "kind": "agentTurn",
    "message": "Lembrete: Reunião com Fulano em 30 minutos. Enviar mensagem no Telegram.",
    "model": "anthropic/claude-sonnet-4-5"
  },
  "delivery": { "mode": "announce" }
}
```

## 🔴 Dicas Importantes

1. **Sempre** usar `model: "anthropic/claude-sonnet-4-5"` (nome completo, não alias)
2. **Espaçar** crons por 15-30 min (evita rate limit)
3. **Nunca** usar `sessionTarget: "main"` com `systemEvent` (não funciona direito)
4. **Teste** com `cron run <id>` antes de confiar que vai funcionar
