# Prompt — Módulo 5: Integrações, Ferramentas e Crons

> Cole este prompt no chat do seu OpenClaw depois de assistir o Módulo 5.
> Anexe junto os arquivos: `prds/integrations-setup.md`, `configs/cron-examples.md`

---

Acabei de assistir o Módulo 5 do curso sobre integrações e crons. Leia o PRD de integrações e me guie.

**O que preciso que você faça:**

1. **Analise meu perfil** — baseado no que você já sabe sobre mim (USER.md), me recomende as 3-5 integrações mais úteis pra começar

2. **Me guie na instalação** de cada integração, uma por vez:
   - Me explique o que ela faz e por que é útil
   - Me ajude a configurar a API key de forma segura
   - Teste se funcionou

3. **Configure pelo menos 2 crons:**
   - Um lembrete/agenda (pra eu ver funcionando)
   - Um report automático (daily briefing ou métricas)
   - Use SEMPRE: `sessionTarget: isolated` + `agentTurn` + `announce` (isso é crítico pra funcionar!)

4. **Me explique os erros comuns:**
   - Por que `systemEvent` na main session não funciona como esperado
   - Por que crons no mesmo horário causam problemas
   - Como config.patch afeta crons rodando

**Regras:**
- Comece com integrações simples (calendário, clima) antes das complexas
- Ferramentas de mídia são built-in: `image_generate`, `video_generate` e `music_generate` estão disponíveis de graça no OpenClaw — não precisa de skill separada
- TODAS as credenciais vão no 1Password — zero hardcode nos arquivos
- Cuidado: systemd override sobrescreve .env — atualizar AMBOS ao trocar credenciais
- No final, me mostre os crons ativos e quando vão rodar

**Dica de produção:**
- Use Telegram com grupo + tópicos como hub central
- Cada cron entrega no tópico certo — zero ruído
- Crons usam o mesmo modelo primário do agente — não trocar modelo no cron isolado (causa `LiveSessionModelSwitchError`)
- Para produção do curso, mantenha a stack padrão em OpenAI (`openai/gpt-5.4`, `openai/gpt-4o`, `openai/gpt-4o-mini`)
- Use OpenRouter como camada de experimentação para testar outros LLMs ou opções econômicas sem trocar a narrativa principal do setup

**Comandos úteis:**
```
openclaw channels status --probe
openclaw models fallbacks add <model>
openclaw models aliases add <alias> <model>
```

> **📡 Posicionamento de modelos (2026.4+):** No curso, OpenAI continua sendo a stack padrão. OpenRouter entra como caminho recomendado para experimentar outros modelos, por exemplo `openrouter/minimax/minimax-m2.7`, sem substituir o setup principal. Crons devem usar o mesmo modelo primário do agente que os dispatcha.

Vamos conectar ao mundo real?
