# Prompt — Módulo 8: Sistema Imunológico

> Cole este prompt no chat do seu OpenClaw depois de assistir o Módulo 8.
> Anexe junto o arquivo: `prds/immune-system.md`

---

Acabei de assistir o Módulo 8 do curso sobre o sistema imunológico. "Agents are 30% of the work. The other 70% is the immune system." Leia o PRD e me guie.

**O que preciso que você faça:**

1. **Watchdog de crons** — Configure um cron que monitora se os outros crons estão executando. Se algum falhar, retry automático até 3x. Se falhar 3x, me avisa.

2. **Feedback Loops** — Me ajude a configurar um sistema de approve/reject:
   - Quando você me sugerir algo e eu rejeitar, anote o motivo
   - Consulte essas anotações antes de sugerir novamente
   - Me mostre como isso funciona na prática

3. **Monitoramento de custos:**
   - Configure o split de modelos (Haiku pra heartbeats, Sonnet pra crons, Opus pra interação)
   - Me mostre quanto estou gastando por dia/semana

4. **Audit de segurança periódico:**
   - Configure um cron semanal de security audit
   - Rode um agora pra eu ver o resultado

5. **Backup antes de mudanças:**
   - Crie uma regra: antes de qualquer mudança estrutural, salvar backup + ROLLBACK.md
   - Me mostre como reverter se algo der errado

**Regras:**
- Esse módulo é o que separa "tô brincando" de "tô em produção"
- Me explique cada proteção e qual problema ela previne
- No final, rode um health check completo e me dê o score

Vamos construir a imunidade?
