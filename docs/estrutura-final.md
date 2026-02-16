# 🎓 Estrutura Final do Curso

**"Construa Seu AI COO: De Zero a Agente Pessoal com OpenClaw"**

> 11 módulos, ~3h30 de conteúdo. Do zero ao agente em produção.
> Cada módulo entrega: 🎥 Vídeo + 📄 PDF + 💬 Prompt pro agente

---

## Módulo 0 — Abertura & Contexto (10 min)
**Formato:** Slides + talking head

**Conteúdo:**
- Por que agentes AI pessoais são o "next big thing"
- A analogia do Matrix (Trinity + skills = superpoderes)
- Demo rápido da Amora no Telegram (1 min, comandos reais)
- Mapa do curso: o que vamos construir juntos
- Apresentar o Kit: "Cada módulo vem com arquivos prontos pra jogar no seu agente"

**Kit do módulo:** Nenhum (só slides)

---

## Módulo 1 — Setup: Do Zero ao Primeiro "Oi" (25 min)
**Formato:** Live coding (tela + face cam)

**Conteúdo:**
1. O que é o OpenClaw e como funciona (arquitetura: gateway + agente + canal)
2. Criando a VPS na Hostinger (plano KVM 1, Ubuntu 24.04)
   - Docker vs Bare Metal — por que bare metal é melhor pra quem não é dev
3. Conectar via SSH (terminal local + painel Hostinger)
4. Instalar OpenClaw:
   ```bash
   curl -fsSL https://openclaw.ai/install.sh | bash
   openclaw onboard --install-daemon
   ```
5. Wizard de configuração (provider, model, serviço)
6. Criar bot no Telegram (BotFather → /newbot → token)
7. Conectar Telegram + primeiro "Oi" 🎉

**Quanto custa:**
| Item | Custo/mês |
|------|-----------|
| VPS Hostinger (KVM 1) | ~$5-10 |
| API Anthropic (uso moderado) | ~$10-30 |
| Telegram | Grátis |
| **Total** | **~$15-40** |

**Checkpoint:** Agente respondendo no Telegram ✅

**Kit:**
- `prds/vps-setup-hostinger.md`
- `configs/modelo-config.md`
- `prompts/modulo-01-setup.md`

---

## Módulo 2 — Segurança: Blindando Seu Agente (15 min)
**Formato:** Live coding

**Conteúdo:**
1. Por que agora? Mostrar log real: 1.015+ tentativas de brute force em 24h
2. Telegram Allowlist (dmPolicy) — de "open" pra "allowlist" com seu ID
3. Firewall UFW:
   ```bash
   sudo ufw default deny incoming
   sudo ufw allow ssh
   sudo ufw --force enable
   ```
4. Fail2ban (proteção SSH): 5 tentativas → ban 1h
5. Credenciais seguras: 1Password CLI ou variáveis de ambiente (NUNCA hardcodar)
6. Portas de aplicação: 127.0.0.1 (não 0.0.0.0) + Cloudflare Tunnel

**Checkpoint:** Servidor blindado ✅

**Kit:**
- `prds/security-hardening.md`
- `prompts/modulo-02-seguranca.md`

---

## Módulo 3 — Identidade: Dando Personalidade ao Agente (25 min)
**Formato:** Demo + slides

**Conteúdo:**
1. SOUL.md: a alma do agente
   - Mostrar diff: genérico vs personalizado da Amora
   - Anti-patterns concretos: exemplos ❌/✅
   - "Never dos" explícitos
   - Inspirational anchors (fale como X, nunca como Y)
2. USER.md: quem é você?
   - Contexto profundo > superficial
   - Tom de voz por plataforma
   - Dica: importar CLAUDE.md se já usa Claude Code
3. IDENTITY.md: dados concretos vs personalidade
   - Nome, email próprio, cofre de senhas próprio
   - "Trate como uma pessoa, não como um robô"
4. AGENTS.md: regras operacionais
   - O que pode fazer sozinho vs perguntar
5. Escolhendo modelo: Opus vs Sonnet vs Haiku
   - Economia real: Haiku pra heartbeats (90% economia)
6. Thinking mode: quando ligar o turbo e quanto custa

**Insight do Dia 7:** Amora reescreveu o próprio SOUL.md — a diferença foi absurda.

**Exercício:** Aluno pega templates, preenche os [campos], joga no agente.

**Checkpoint:** Agente com personalidade e contexto ✅

**Kit:**
- `templates/SOUL-template.md`
- `templates/USER-template.md`
- `templates/AGENTS-template.md`
- `templates/IDENTITY-template.md`
- `prompts/modulo-03-identidade.md`
- `prompts/onboarding.md`
- `prompts/interview-your-agent.md`

---

## Módulo 4 — Memória: O Segredo que Ninguém Ensina (25 min) ⭐
**Formato:** Demo + diagramas

**Conteúdo:**
1. O problema: agentes esquecem tudo a cada sessão (Alzheimer reset)
2. Arquitetura de memória em camadas:
   - Sessão → Nota diária → Topic files → MEMORY.md (índice)
3. Topic files especializados:
   - `decisions.md` — permanentes
   - `lessons.md` — categorizadas (estratégicas permanentes, táticas 30 dias)
   - `projects.md` — estado atual
   - `people.md` — contatos, equipe
   - `pending.md` — aguardando input
4. Regra INVIOLÁVEL: extrair lições/decisões ANTES de cada compactação
   - "Se não extrair antes de compactar, perde 80% do valor"
5. Compactação: tokens de contexto, reserva, evitar overflow
   - Caso real: token overflow de 173k+ no Dia 2
6. Consolidação periódica (a cada 15 dias)
7. Feedback Loops: approve/reject → evolução do agente
   - 4 domínios: content, tasks, recommendations, digest
   - Agente consulta ANTES de sugerir → evita repetir erros

**Demo ao vivo:** Mostrar como a Amora lembra de uma decisão do Dia 4 no Dia 13.

**Este é o módulo diferenciador.** Ninguém cobre memória estruturada + feedback loops.

**Checkpoint:** Sistema de memória configurado ✅

**Kit:**
- `prds/memory-architecture.md`
- `templates/MEMORY-template.md`
- `templates/HEARTBEAT-template.md`
- `templates/memory/` (5 arquivos)
- `prompts/modulo-04-memoria.md`

---

## Módulo 5 — Integrações & Crons: Conectando ao Mundo Real (25 min)
**Formato:** Live coding + demo

**Conteúdo:**
1. 1Password: segurança de credenciais (NUNCA hardcodar)
   - Cuidado: systemd override sobrescreve .env — atualizar AMBOS
2. Google Calendar & Drive via GOG CLI
3. YouTube: Data API + OAuth
4. RapidAPI como proxy universal:
   - Cloud IPs bloqueados por YouTube, X, Instagram → RapidAPI resolve
   - APIs: Instagram Statistics, X/Twitter API45, YouTube Transcripts
5. Telegram como hub operacional:
   - Tópicos = war room organizado
   - Por que não WhatsApp (sessão única vs múltiplas)
6. Crons — automatizar tarefas recorrentes:
   - **O bug que TODO MUNDO vai encontrar:**
     - systemEvent + main = dispara mas NÃO executa (durationMs ~0ms)
     - **Solução:** `sessionTarget: isolated` + `agentTurn` + `announce`
   - Colisão de horários → espaçar 15-30min
   - config.patch reinicia gateway e mata crons → fazer em horários sem crons
   - Lembretes: systemEvent NÃO notifica → usar agentTurn + message send

**Checkpoint:** Pelo menos 1 integração + 1 cron funcionando ✅

**Kit:**
- `prds/integrations-setup.md`
- `configs/cron-examples.md`
- `prompts/modulo-05-integracoes.md`

---

## Módulo 6 — Skills: Superpoderes Instantâneos (15 min)
**Formato:** Demo

**Conteúdo:**
1. O que são skills e como instalar (ClawHub + GitHub)
2. Skills essenciais por perfil:
   - Empreendedor: nano-pdf, excalidraw, perplexity
   - Creator: hand-draw-graphics, video-frames, openai-image-gen
   - Dev: github, coding-agent, tmux
3. Criando sua primeira skill customizada
4. Segurança de skills:
   - Referência: estudo sobre vulnerabilidades em skills de terceiros
   - Sempre revisar antes de instalar
5. Skills redundantes: remind-me ≈ cron nativo → auditar
6. Creators como skills, não agentes:
   - 1 agente com 8 skills > 8 agentes especializados

**Analogia Matrix:** "Tank, I need a pilot program"

**Checkpoint:** 2-3 skills instaladas e testadas ✅

**Kit:**
- `skills/skills-by-profile.md`
- `prompts/modulo-06-skills.md`

---

## Módulo 7 — Proatividade: Heartbeats & Automações (15 min)
**Formato:** Demo + slides

**Conteúdo:**
1. Heartbeats: o que são e como configurar
   - HEARTBEAT.md: checklist periódico (emails, calendário, projetos)
   - Modelo econômico: Haiku pra heartbeats (~$0.005 vs ~$0.10 em Opus)
2. O que checar automaticamente:
   - Emails urgentes
   - Eventos nas próximas 24-48h
   - Projetos parados há >5 dias
   - Métricas de negócio
3. Quando falar vs ficar quieto:
   - Horário silencioso (23h-8h)
   - Nada novo = HEARTBEAT_OK
4. Trabalho proativo sem pedir:
   - Organizar memória
   - Git status de projetos
   - Atualizar documentação
5. Exemplos reais da Amora:
   - Daily briefing de redes sociais
   - Alertas de agenda
   - Revisão semanal de projetos

**Checkpoint:** Heartbeat configurado + 2 automações ativas ✅

**Kit:**
- `templates/HEARTBEAT-template.md`
- `prompts/proactive-mandate.md`

---

## Módulo 8 — Multi-Agentes: De Solo a Time (20 min)
**Formato:** Slides + demo

**Conteúdo:**
1. Quando um agente não é suficiente (e quando É — menos é mais)
2. Arquitetura: single gateway + agents.list
3. Leveling System (Kevin Simback): L1→L4
   - L1 Observer → L2 Contributor → L3 Operator → L4 Trusted
   - Promoção via performance review semanal
   - Caso real: Content Agent caiu de L3 → L2 quando começou a "rushar"
4. Criando agentes com o Orchestrator:
   - Agente que cria agentes (SOUL, AGENTS, USER, memória)
5. Shared Context:
   - TEAM.md → registry (quem faz o quê)
   - shared/outputs/ → resultados compartilhados
   - shared/lessons/ → aprendizados do time
6. Coordenação: hub model > mesh model
   - Agente principal curadoria > todos leem tudo
   - Agentes sem binding Telegram — comunicam via principal
7. Economia real:
   - Sonnet pra execução/crons, Opus pra interação/análise
   - "Agentes que não precisam de Opus não devem usar Opus"
8. Sub-agents e delegação:
   - sessions_spawn para tasks paralelas
   - Retry + aviso ao usuário (NUNCA limbo silencioso)

**Checkpoint:** 1-2 agentes extras configurados com leveling ✅

**Kit:**
- `prds/multi-agent-setup.md`
- `prompts/modulo-07-multiagentes.md`

---

## Módulo 9 — O Sistema Imunológico: Manter Tudo Funcionando (20 min) ⭐
**Formato:** Slides + demo

**Conteúdo:**
1. "Agents are 30% of the work. The other 70% is the immune system." — Eric Siu
2. Watchdog com auto-retry (3x antes de alertar):
   - Monitora crons, detecta falhas, retry automático
3. Feedback Loops universais:
   - Ciclo: Feedback (JSON) → Lessons (curado) → Decisions (permanente)
4. Security hardening avançado:
   - Audit de segurança semanal (cron)
   - `openclaw security-audit` + `openclaw doctor fix`
   - Rotação trimestral de credenciais
5. Monitoramento de custos:
   - Sonnet/Opus/Haiku split
   - Breakdown real: quanto custa rodar 17 crons/dia + interação
6. Backup antes de mudanças estruturais:
   - Config + ROLLBACK.md com instruções
7. Sub-agents com autonomia = risco:
   - Capability Evolver: NÃO rodar automaticamente
   - Sempre revisar output antes de aprovar
8. Ralph Loop vs Feedback Loop:
   - Ralph (coding loop) vs Feedback (aprendizado entre sessões)

**Este módulo separa "tô brincando" de "tô em produção".**

**Checkpoint:** Watchdog + feedback loops + audit configurados ✅

**Kit:**
- `prds/immune-system.md`
- `prompts/modulo-08-immune-system.md`

---

## Módulo 10 — Mission Control: Seu Painel Operacional (10 min)
**Formato:** Demo

**Conteúdo:**
1. Por que uma UI visual ajuda (mesmo tendo Telegram)
2. Overview do Mission Control da Amora:
   - Kanban de tarefas
   - Memory Page
   - Crons Page
   - Content HQ (229 packs, 773 peças)
3. Como construir o seu:
   - Stack: Express + React + Supabase + Cloudflare Tunnel
   - QA automatizado: sub-agent rodou 23 endpoints, encontrou 5 bugs em 7min
4. Alternativas mais simples:
   - NocoDB (self-hosted, grátis)
   - Notion (integra com skill)
   - Google Sheets (simples e funcional)

**Checkpoint:** Pelo menos uma alternativa visual configurada ✅

**Kit:**
- `reports/report-templates.md`

---

## Módulo 11 — Wrap-up & Próximos Passos (10 min)
**Formato:** Talking head + slides

**Conteúdo:**
1. Recap: o que construímos juntos (checklist visual)
2. Os erros que eu cometi (consolidação real):
   - Token overflow no Dia 2
   - Crons que não executavam por 3 dias
   - Sub-agent que travou no limbo
   - Security "open" nos primeiros dias
3. Quanto custa rodar um agente AI? (breakdown REAL)
   - API costs com split Sonnet/Opus/Haiku
   - VPS + ferramentas + APIs externas
4. 10 regras invioláveis (consolidação)
5. Comunidade: Discord OpenClaw, ClawHub, awesome-skills
6. O futuro: agent-to-agent, MCP, Claude Code integration
7. CTA: Comunidade + próximos conteúdos

**Kit:**
- Checklist final de validação
- Links de recursos
- `docs/custos.md` (breakdown detalhado)

---

## Resumo por Módulo

| # | Módulo | Tempo | Formato | Kit |
|---|--------|-------|---------|-----|
| 0 | Abertura & Contexto | 10 min | Slides + face | — |
| 1 | Setup: Do Zero ao "Oi" | 25 min | Live coding | PRD + config + prompt |
| 2 | Segurança | 15 min | Live coding | PRD + prompt |
| 3 | Identidade & Personalidade | 25 min | Demo + slides | 4 templates + 3 prompts |
| 4 | Memória ⭐ | 25 min | Demo + diagramas | PRD + templates + prompt |
| 5 | Integrações & Crons | 25 min | Live coding | PRD + config + prompt |
| 6 | Skills | 15 min | Demo | Curadoria + prompt |
| 7 | Proatividade | 15 min | Demo + slides | Template + prompt |
| 8 | Multi-Agentes | 20 min | Slides + demo | PRD + prompt |
| 9 | Immune System ⭐ | 20 min | Slides + demo | PRD + prompt |
| 10 | Mission Control | 10 min | Demo | Templates |
| 11 | Wrap-up | 10 min | Talking head | Checklist + custos |
| **Total** | | **~3h35** | | **~50 arquivos** |

---

## Referências

- **Kevin Simback:** Agent team management, leveling L1-L4
- **Bhanu Teja (@pbteja1998):** Blueprint de 10 agentes (3.7M views)
- **Eric Siu:** "30 OpenClaw Jobs A Day" — immune system
- **Geoffrey Huntley:** Ralph Loop
- **Lenny's Newsletter:** Context engineering
- **Reddit Ultimate Guide:** r/ThinkingDeeplyAI
- **Alex Finn / Vibe Coding Academy:** Use cases, proactive mandate
- **Simon Willison:** Security research — 900+ servidores expostos

---

*Estrutura final v1 — 16/02/2026*
*Curado pelo agente curso-openclaw 🍇*
