# Prompt — Módulo 1: Setup do OpenClaw

> Cole este prompt no chat do seu OpenClaw depois de assistir o Módulo 1.

---

Acabei de assistir o Módulo 1 do curso "Construa Seu AI COO". Preciso que você me guie no setup inicial do OpenClaw.

**O que preciso fazer:**

1. **Verificar meu ambiente** — Confira se Node.js, npm e as dependências estão instalados corretamente. Se algo faltar, me explique o que é e me ajude a instalar.

2. **Configurar o provider** — Me ajude a configurar a API key do Anthropic (Claude). Me explique onde pegar a key e como configurar.

3. **Escolher o modelo** — Me explique a diferença entre Sonnet, Opus e Haiku. Me recomende qual usar pra começar (considerando custo x qualidade). Configure a failover chain (Opus → Sonnet → Cooldown).

4. **Conectar ao Telegram** — Me guie passo a passo pra criar um bot no BotFather e conectar ao OpenClaw. Me explique por que Telegram com tópicos é melhor que WhatsApp (sessão única vs múltiplas). Use `openclaw channels login` e `openclaw channels status --probe` pra validar.

5. **Primeiro teste** — Depois de tudo configurado, rode um health check e confirme que tá tudo funcionando.

6. **Otimização inicial de tokens** — Configure a session initialization rule pra não carregar 50KB de histórico a cada mensagem:
   - Carregar APENAS: SOUL.md, USER.md, IDENTITY.md, memory/YYYY-MM-DD.md
   - NÃO carregar automaticamente: MEMORY.md, histórico de sessões, outputs anteriores
   - Usar `memory_search()` sob demanda quando precisar de contexto anterior

**Regras:**
- Me explique o PORQUÊ de cada passo antes de executar
- Se algo der erro, me explique o que aconteceu e como resolver
- No final, me diga quanto isso vai custar por mês aproximadamente
- Referência de custos: antes da otimização ~$2-3/dia, depois ~$0.10/dia

**Comandos úteis pra este módulo:**
```
openclaw gateway start --mode local
openclaw channels login
openclaw channels status --probe
openclaw models list --all
openclaw models set <model>
```

Vamos começar?
