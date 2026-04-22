# Prompt — Módulo 1: Setup do OpenClaw

> Cole este prompt no chat do seu OpenClaw depois de assistir o Módulo 1.

---

Acabei de assistir o Módulo 1 do curso "Construa Seu AI COO". Preciso que você me guie no setup inicial do OpenClaw.

**O que preciso fazer:**

1. **Verificar meu ambiente** — Confira se Node.js, npm e as dependências estão instalados corretamente. Se algo faltar, me explique o que é e me ajude a instalar.

2. **Configurar o provider** — Me ajude a configurar o OpenClaw com ChatGPT/OpenAI. O caminho recomendado é via OAuth (login com conta ChatGPT Plus/Pro, sem precisar de API key). Se eu preferir usar API key da OpenAI, me ajude a configurar também e explique as diferenças. Depois, me explique como usar OpenRouter só como camada opcional de experimentação para testar outros LLMs.

3. **Ativar o perfil de ferramentas** — Execute `openclaw config set tools.profile full` e me explique por quê isso é obrigatório. Sem isso, você não executa comandos — só responde mensagens. Depois rode `openclaw config validate` pra confirmar que a configuração está válida.

4. **Escolher o modelo** — Me explique a diferença entre GPT-5.4, GPT-4o e GPT-4o-mini. Me recomende qual usar pra começar (considerando custo x qualidade). Configure a stack padrão do curso (GPT-5.4 → GPT-4o → GPT-4o-mini), e deixe OpenRouter só para testes opcionais.

5. **Conectar ao Telegram** — Me guie passo a passo pra criar um bot no BotFather e conectar ao OpenClaw. Me explique por que Telegram com tópicos é melhor que WhatsApp (sessão única vs múltiplas). Use `openclaw channels login` e `openclaw channels status --probe` pra validar.

6. **Primeiro teste** — Depois de tudo configurado, rode um health check e confirme que tá tudo funcionando. Inclua um teste de execução de comando (ex: `echo "SHELL_TEST_OK"`) pra provar que o tools.profile full está ativo.

7. **Otimização inicial de tokens** — Configure a session initialization rule pra não carregar 50KB de histórico a cada mensagem:
   - Carregar APENAS: SOUL.md, USER.md, IDENTITY.md, memory/YYYY-MM-DD.md
   - NÃO carregar automaticamente: MEMORY.md, histórico de sessões, outputs anteriores
   - Usar `memory_search()` sob demanda quando precisar de contexto anterior

**Regras:**
- Me explique o PORQUÊ de cada passo antes de executar
- Se algo der erro, me explique o que aconteceu e como resolver
- No final, me diga quanto isso vai custar por mês aproximadamente
- Referência de custos: antes da otimização ~$2-3/dia, depois ~$0.10/dia

8. **Timezone (OBRIGATÓRIO se vai usar crons)** — Configure o timezone do gateway para que seus crons disparem no horário correto do Brasil. Sem isso, um cron configurado "às 9h" vai disparar às 12h (UTC):

```bash
sudo systemctl edit openclaw
# Adicione dentro de [Service]:
# Environment="OPENCLAW_TZ=America/Sao_Paulo"
sudo systemctl daemon-reload && sudo systemctl restart openclaw
```

**Comandos úteis pra este módulo:**
```
openclaw gateway start --mode local
openclaw config set tools.profile full
openclaw config validate
openclaw channels login
openclaw channels status --probe
openclaw models list --all
openclaw models set <model>
```

Vamos começar?
