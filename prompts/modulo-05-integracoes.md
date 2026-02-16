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
- Se der erro de cloud IP bloqueado, me explique a solução (RapidAPI como proxy)
- TODAS as credenciais vão no 1Password — zero hardcode nos arquivos
- Cuidado: systemd override sobrescreve .env — atualizar AMBOS ao trocar credenciais
- No final, me mostre os crons ativos e quando vão rodar

**Dica de produção:**
- Use Telegram com grupo + tópicos como hub central
- Cada cron entrega no tópico certo — zero ruído
- Modelo Split: Sonnet pra crons de execução (sync, watchdog, lembretes), Opus pra análise e estratégia (~90% economia)

**Comandos úteis:**
```
openclaw channels status --probe
openclaw models fallbacks add <model>
openclaw models aliases add <alias> <model>
```

Vamos conectar ao mundo real?
