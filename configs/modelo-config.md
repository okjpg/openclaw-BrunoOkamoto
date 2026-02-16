# Configurações Recomendadas do OpenClaw

> Referência para configurar seu openclaw.json

## Modelo por Uso

| Uso | Modelo Recomendado | Por quê |
|-----|-------------------|---------|
| Interação direta | Claude Opus | Melhor raciocínio, mais criativo |
| Crons / automação | Claude Sonnet | 90% mais barato, suficiente pra tasks |
| Heartbeats | Claude Haiku | Mínimo custo, só checa e reporta |
| Imagens | Gemini Flash | Bom e barato |

## Config de Compaction (IMPORTANTE)

Se não configurar, sua sessão vai estourar tokens e o agente trava.

```json
{
  "compaction": {
    "mode": "default"
  },
  "contextTokens": 160000,
  "reserveTokensFloor": 30000
}
```

## Thinking Mode

| Nível | Quando usar | Custo |
|-------|------------|-------|
| off | Tasks simples, respostas rápidas | $ |
| low | Dia a dia, maioria das interações | $$ |
| medium | Análise, planejamento, conteúdo | $$$ |
| high | Coding, problemas complexos, estratégia | $$$$ |

## Crons: Regra de Ouro

**SEMPRE:**
```json
{
  "sessionTarget": "isolated",
  "payload": {
    "kind": "agentTurn",
    "message": "Sua tarefa aqui"
  },
  "delivery": { "mode": "announce" }
}
```

**NUNCA** usar `sessionTarget: "main"` + `payload.kind: "systemEvent"` — dispara mas não executa.

## Dicas de Economia

1. Heartbeats com Haiku: ~$0.005 cada (vs ~$0.10 com Opus)
2. Crons com Sonnet: economia de ~90% vs Opus
3. Espaçar crons: não colocar múltiplos no mesmo minuto (rate limit)
4. config.patch reinicia gateway — fazer em horários sem crons
