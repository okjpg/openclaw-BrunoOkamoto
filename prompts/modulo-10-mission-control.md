# Prompt — Módulo 10: Mission Control

> Cole este prompt no chat do seu OpenClaw depois de assistir o Módulo 10.

---

Acabei de assistir o Módulo 10 sobre Mission Control — criar uma interface visual para gerenciar o agente. Mesmo usando Telegram pra interação, preciso de um painel pra ver o estado do sistema num relance.

**O que preciso que você faça:**

## 1. Me explique por que isso importa

Antes de começarmos, me explique:
- Por que um painel visual ajuda (mesmo tendo Telegram)?
- Que tipo de informação deveria estar sempre visível?
- Como isso se encaixa na filosofia de "proatividade"?
- Exemplos: o que um founder vê vs um dev vê no painel?

## 2. Me ajude a escolher a ferramenta certa

Apresente as opções e me ajude a decidir baseado no **meu nível técnico e necessidades**:

### Opção A: NocoDB (recomendado iniciantes/intermediários)
- **O que é:** Notion-like, self-hosted, gratuito, interface pronta
- **Prós:** Setup rápido, GUI amigável, API REST, relações entre tabelas
- **Contras:** Menos customizável que código próprio
- **Melhor pra:** Quem quer resultado rápido sem codar muito
- **Setup:** Docker Compose + SQLite/Postgres

### Opção B: Notion
- **O que é:** Ferramenta SaaS, databases relacionais
- **Prós:** Já uso no dia a dia, mobile nativo, compartilhamento fácil
- **Contras:** API com rate limits, dados na nuvem (não self-hosted)
- **Melhor pra:** Quem já é power user do Notion
- **Setup:** Notion API + integration

### Opção C: Google Sheets
- **O que é:** Planilhas com API
- **Prós:** Simplicidade máxima, todo mundo sabe usar, gráficos nativos
- **Contras:** Não é um banco de dados de verdade, limites de linhas
- **Melhor pra:** Prototipagem rápida, dashboards simples
- **Setup:** Google Sheets API (via gog skill)

### Opção D: Custom (Express + React + Supabase)
- **O que é:** App web totalmente customizado
- **Prós:** Controle total, UI sob medida, real-time, hospedagem grátis (Vercel/Supabase)
- **Contras:** Requer conhecimento de dev full-stack
- **Melhor pra:** Devs que querem algo profissional e escalável
- **Setup:** Next.js app + Supabase backend + API routes

**Me pergunte:**
- Qual meu nível técnico? (iniciante/intermediário/avançado)
- Já uso alguma dessas ferramentas?
- Prefiro algo rápido ou algo perfeito?
- Vou gerenciar só meu agente ou uma equipe de agentes?

## 3. Setup da opção escolhida

Depois que eu escolher, **me guie passo a passo**:

### Se escolhi NocoDB:
1. Criar `docker-compose.yml` pro NocoDB
2. Subir o serviço (`docker-compose up -d`)
3. Acessar interface web (localhost:8080)
4. Criar as tabelas necessárias (veja estrutura abaixo)
5. Gerar API token
6. Criar skill `nocodb-api` pra conectar o agente
7. Configurar crons pra atualizar dados automaticamente

### Se escolhi Notion:
1. Criar workspace no Notion
2. Criar databases (Tasks, Memory, Crons, Health)
3. Criar integration (https://notion.so/my-integrations)
4. Dar permissões às databases
5. Instalar/configurar skill `notion-db` (clawhub)
6. Testar conexão e escrita

### Se escolhi Google Sheets:
1. Criar spreadsheet "Mission Control"
2. Criar abas (Tasks, Memory, Crons, Health)
3. Configurar `gog` skill (se ainda não configurado)
4. Criar funções helper no agente pra escrever nas sheets
5. Configurar dashboard com gráficos

### Se escolhi Custom:
1. Scaffold projeto Next.js (`npx create-next-app@latest mission-control`)
2. Setup Supabase (projeto grátis)
3. Criar tabelas no Supabase
4. Criar API routes no Next.js
5. Conectar agente às API routes
6. Deploy no Vercel (grátis)

## 4. Estrutura de dados (base comum)

Independente da ferramenta, essas são as "tabelas" essenciais:

### Tasks
- `id`, `title`, `status` (pending/done/blocked), `priority`, `created_at`, `due_date`, `assigned_to` (qual agente/humano)

### Memory Events
- `id`, `date`, `category` (decision/lesson/insight), `content`, `source` (main/heartbeat/cron)

### Cron Jobs
- `id`, `name`, `schedule`, `last_run`, `next_run`, `status` (active/paused), `last_result` (success/error)

### Health Checks
- `id`, `service` (gateway/telegram/skills), `status` (healthy/degraded/down), `last_check`, `uptime_%`

### Agent Stats (métricas)
- `id`, `date`, `messages_sent`, `skills_used`, `errors`, `model_tokens_used`, `uptime_hours`

Me ajude a criar essas estruturas na ferramenta escolhida.

## 5. Conectar o agente ao painel

Depois do setup, **crie as funções necessárias**:

### Funções que o agente precisa:
- `dashboard_log_task(title, priority)` — cria tarefa no painel
- `dashboard_update_task(id, status)` — marca como done/blocked
- `dashboard_log_memory(content, category)` — salva insight importante
- `dashboard_update_health(service, status)` — atualiza status de serviço
- `dashboard_get_stats()` — retorna resumo do dia

### Crons necessários (isolated + agentTurn):
- **stats-collector** (a cada 1h): Coleta métricas (uptime, erros, skills usadas) e escreve no painel
- **health-monitor** (a cada 15min): Testa se gateway/telegram/skills estão respondendo
- **task-reminder** (a cada 4h): Verifica tarefas com due_date próximo e avisa

Me ajude a criar esses crons e funções.

## 6. Personalizar o painel pro meu perfil

Com base no meu USER.md e no meu trabalho (founder/dev/criador/produtividade), **customize o que é mostrado**:

**Se sou Founder:**
- Métricas de negócio (MRR, usuários ativos, churn)
- Pipeline de vendas
- OKRs da semana

**Se sou Dev:**
- Deploys recentes
- Erros críticos (via Sentry)
- PRs pendentes de review
- Uptime dos serviços

**Se sou Criador:**
- Conteúdos publicados essa semana
- Performance (views, engajamento)
- Pipeline de produção (ideias → roteiro → gravação → edição → publicado)

**Se sou Produtividade:**
- Reuniões de hoje
- Tasks completadas vs pendentes
- Hábitos rastreados
- Tempo em deep work

Me pergunte qual o meu perfil e sugira widgets específicos.

## 7. Fazer o primeiro teste

Depois de tudo configurado:
1. Peça pro agente logar uma tarefa de teste
2. Abra o painel e confirme que apareceu
3. Marque como "done" via agente
4. Atualize o painel e veja a mudança
5. Verifique se os crons estão rodando (confira logs)

## 8. Documentar o setup

Crie um arquivo `docs/mission-control-setup.md` com:
- Ferramenta escolhida e por quê
- Credenciais necessárias (onde estão armazenadas)
- Estrutura de dados
- Como acessar o painel (URL, login)
- Comandos úteis (resetar dados, backup, etc.)
- Screenshots (se relevante)

**Regras importantes:**
- ❌ Não hardcode credenciais — tudo no `.env` ou 1Password
- ✅ Use crons `isolated` + `agentTurn` pra atualizar dados (nunca systemEvent no main)
- ✅ Teste em produção devagar — comece com read-only, depois adicione write
- ✅ Faça backup antes de conectar sistema crítico ao painel

---

**Vamos construir seu Mission Control?** Me conte seu nível técnico e preferências, e eu te guio!
