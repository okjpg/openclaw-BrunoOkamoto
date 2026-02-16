# Skills por Perfil de Usuário

> Guia curado de skills OpenClaw organizadas por perfil. Copie o comando de instalação e vá.

---

## ⚠️ Avisos Importantes

### Segurança Primeiro
**Sempre revise o código antes de instalar uma skill!** Skills têm acesso ao seu workspace, credenciais e podem executar comandos. Instale apenas de fontes confiáveis (ClawHub verificado, repositórios oficiais).

```bash
# Antes de instalar, inspecione o código:
git clone <repo> /tmp/skill-review
cat /tmp/skill-review/SKILL.md
```

### Evite Redundâncias
- **remind-me ≈ cron nativo** — OpenClaw já tem cron integrado. Só instale remind-me se precisar de features extras (recorrência complexa, snooze)
- **múltiplos skills de clima** — escolha um (weather built-in é suficiente)
- **creators duplicados** — um gerador de imagens basta (openai-image-gen built-in ou stable-diffusion)

### Creators São Skills, Não Agentes
❌ **Errado:** 8 agentes especializados (ImageAgent, VideoAgent, WriterAgent...)  
✅ **Certo:** 1 agente principal + 8 skills (image-gen, video-edit, grammar-check...)

**Por quê?** Um agente com contexto unificado e várias ferramentas > múltiplos agentes desconexos. Agents devem ter *propósitos*, não *funções*.

---

## Skills Essenciais (Todos os Perfis)

Independente do seu trabalho, estas são fundamentais:

### 1. **github** (built-in)
- **O que faz:** Cria issues, PRs, busca código, gerencia repos
- **Por que é essencial:** Seu workspace está no Git. Este é o controle de versão do seu agente.
- **Instalação:** `openclaw skill enable github`

### 2. **1password** (built-in)
- **O que faz:** Lê/cria/atualiza credenciais no 1Password via CLI
- **Por que é essencial:** Nunca hardcode credenciais. Seu agente precisa gerenciar segredos com segurança.
- **Instalação:** `openclaw skill enable 1password` (requer 1Password CLI configurado)

### 3. **weather** (built-in)
- **O que faz:** Consulta previsão do tempo via wttr.in
- **Por que é essencial:** Contexto físico importa. "Devo sair agora?" "Vai chover na reunião externa?"
- **Instalação:** `openclaw skill enable weather`

### 4. **healthcheck** (built-in)
- **O que faz:** Monitora serviços HTTP/HTTPS, notifica quando caem
- **Por que é essencial:** Proatividade. Saiba se seu site/API caiu antes dos clientes reclamarem.
- **Instalação:** `openclaw skill enable healthcheck`

---

## 👔 Empreendedor / Founder

Foco em operações, métricas, relatórios, tomada de decisão.

### 1. **gog (Google Workspace)** (built-in)
- **O que faz:** Acessa Gmail, Calendar, Drive, Sheets, Docs
- **Por que é útil:** Centraliza comunicação e dados. Leia emails, crie eventos, gere relatórios direto de Sheets.
- **Instalação:** `openclaw skill enable gog` (requer credenciais OAuth)

### 2. **stripe-api** (clawhub.com/stripe)
- **O que faz:** Consulta receita, clientes, assinaturas, faturas no Stripe
- **Por que é útil:** Métricas de receita em tempo real. "Quanto faturei hoje?" "Quantas assinaturas novas?"
- **Instalação:** `openclaw skill install clawhub/stripe`

### 3. **analytics-reports** (clawhub.com/analytics)
- **O que faz:** Puxa dados do Google Analytics e gera relatórios
- **Por que é útil:** Tráfego, conversão, funil — tudo acessível via chat.
- **Instalação:** `openclaw skill install clawhub/analytics`

### 4. **postgres-query** (clawhub.com/postgres)
- **O que faz:** Executa queries SQL no seu banco de produção (read-only recomendado)
- **Por que é útil:** "Quantos usuários ativos?" "Qual feature mais usada?" Respostas instantâneas.
- **Instalação:** `openclaw skill install clawhub/postgres`

### 5. **notion-db** (clawhub.com/notion)
- **O que faz:** Lê/cria/atualiza databases no Notion
- **Por que é útil:** Se você gerencia projetos/CRM no Notion, o agente acessa e atualiza tudo.
- **Instalação:** `openclaw skill install clawhub/notion`

### 6. **slack-admin** (clawhub.com/slack)
- **O que faz:** Envia mensagens, lê canais, cria threads no Slack
- **Por que é útil:** Delegue notificações ao time, resuma conversas importantes.
- **Instalação:** `openclaw skill install clawhub/slack`

### 7. **financial-dashboard** (clawhub.com/finance)
- **O que faz:** Conecta múltiplas APIs financeiras (Stripe, QuickBooks, PagSeguro) e gera dashboards
- **Por que é útil:** Visão unificada de receita, despesas, fluxo de caixa.
- **Instalação:** `openclaw skill install clawhub/finance`

---

## 🎨 Criador de Conteúdo

Foco em produção de conteúdo, redes sociais, design, edição.

### 1. **openai-image-gen** (built-in)
- **O que faz:** Gera imagens com DALL-E
- **Por que é útil:** Thumbnails, ilustrações, assets visuais sob demanda.
- **Instalação:** `openclaw skill enable openai-image-gen`

### 2. **openai-whisper-api** (built-in)
- **O que faz:** Transcreve áudio para texto (podcasts, entrevistas, vídeos)
- **Por que é útil:** Transcrições automáticas para legendas, blog posts, show notes.
- **Instalação:** `openclaw skill enable openai-whisper-api`

### 3. **video-frames** (built-in)
- **O que faz:** Extrai frames de vídeos para análise
- **Por que é útil:** Escolha o melhor frame para thumbnail, analise composição.
- **Instalação:** `openclaw skill enable video-frames`

### 4. **ffmpeg-edit** (clawhub.com/ffmpeg)
- **O que faz:** Corta, concatena, converte vídeos via ffmpeg
- **Por que é útil:** Edições rápidas sem abrir Premiere. "Corta os primeiros 10s e exporta em 720p."
- **Instalação:** `openclaw skill install clawhub/ffmpeg`

### 5. **youtube-metadata** (clawhub.com/youtube)
- **O que faz:** Faz upload, atualiza título/descrição/tags de vídeos no YouTube
- **Por que é útil:** Automatize publicação. "Faz upload desse vídeo com essa thumbnail e essa descrição."
- **Instalação:** `openclaw skill install clawhub/youtube`

### 6. **twitter-scheduler** (clawhub.com/twitter)
- **O que faz:** Agenda tweets, threads, analisa engajamento
- **Por que é útil:** Crie threads inteiras em uma conversa, o agente agenda e publica.
- **Instalação:** `openclaw skill install clawhub/twitter`

### 7. **canva-api** (clawhub.com/canva)
- **O que faz:** Cria designs via Canva API (posts, stories, banners)
- **Por que é útil:** Geração de assets visuais em escala. "Cria 5 variações desse post."
- **Instalação:** `openclaw skill install clawhub/canva`

### 8. **subtitle-sync** (clawhub.com/subtitles)
- **O que faz:** Gera e sincroniza legendas SRT/VTT
- **Por que é útil:** Acessibilidade automática. Transcrição → legendas sincronizadas.
- **Instalação:** `openclaw skill install clawhub/subtitles`

---

## 💻 Desenvolvedor

Foco em coding, CI/CD, debugging, deploy, monitoramento.

### 1. **github** (built-in)
- **O que faz:** Cria issues, PRs, busca código, gerencia repos
- **Por que é útil:** "Abre uma issue pra esse bug." "Lista PRs pendentes de review."
- **Instalação:** `openclaw skill enable github`

### 2. **tmux** (built-in)
- **O que faz:** Gerencia sessões tmux (cria, lista, mata, envia comandos)
- **Por que é útil:** Rode servidores/builds em background, monitore processos.
- **Instalação:** `openclaw skill enable tmux`

### 3. **docker-compose** (clawhub.com/docker)
- **O que faz:** Sobe/desce containers, lê logs, reinicia serviços
- **Por que é útil:** "Reinicia o container do Redis." "Logs do backend nos últimos 5min."
- **Instalação:** `openclaw skill install clawhub/docker`

### 4. **postgres-query** (clawhub.com/postgres)
- **O que faz:** Executa queries SQL no banco de dev/staging
- **Por que é útil:** Debugging rápido. "Mostra o último pedido do usuário X."
- **Instalação:** `openclaw skill install clawhub/postgres`

### 5. **sentry-alerts** (clawhub.com/sentry)
- **O que faz:** Consulta erros no Sentry, cria issues no GitHub automaticamente
- **Por que é útil:** Proatividade. Erros críticos viram issues sem intervenção manual.
- **Instalação:** `openclaw skill install clawhub/sentry`

### 6. **cloudflare-dns** (clawhub.com/cloudflare)
- **O que faz:** Gerencia DNS, cache, firewall rules na Cloudflare
- **Por que é útil:** "Adiciona um registro A pra staging." "Limpa o cache."
- **Instalação:** `openclaw skill install clawhub/cloudflare`

### 7. **aws-cli-wrapper** (clawhub.com/aws)
- **O que faz:** Executa comandos AWS (EC2, S3, Lambda, RDS)
- **Por que é útil:** "Lista instâncias ativas." "Faz deploy da Lambda." Infraestrutura via chat.
- **Instalação:** `openclaw skill install clawhub/aws`

### 8. **code-review-ai** (clawhub.com/code-review)
- **O que faz:** Analisa PRs, sugere melhorias, detecta bugs
- **Por que é útil:** Review automático antes de pedir ao time. Feedback instantâneo.
- **Instalação:** `openclaw skill install clawhub/code-review`

---

## 📅 Produtividade Pessoal

Foco em calendário, notas, tarefas, automação de rotina.

### 1. **gog (Google Workspace)** (built-in)
- **O que faz:** Acessa Gmail, Calendar, Drive, Docs
- **Por que é útil:** "Qual minha próxima reunião?" "Cria um doc com minhas notas de hoje."
- **Instalação:** `openclaw skill enable gog`

### 2. **todoist-sync** (clawhub.com/todoist)
- **O que faz:** Lê/cria/completa tarefas no Todoist
- **Por que é útil:** Gerenciamento de tarefas via chat. "Adiciona 'comprar café' pra amanhã."
- **Instalação:** `openclaw skill install clawhub/todoist`

### 3. **notion-db** (clawhub.com/notion)
- **O que faz:** Lê/cria/atualiza databases no Notion
- **Por que é útil:** Se você usa Notion como segundo cérebro, o agente acessa tudo.
- **Instalação:** `openclaw skill install clawhub/notion`

### 4. **obsidian-vault** (clawhub.com/obsidian)
- **O que faz:** Lê/cria/busca notas no Obsidian (vault local)
- **Por que é útil:** PKM integrado. "Busca minhas notas sobre X." "Cria uma nota com esse conteúdo."
- **Instalação:** `openclaw skill install clawhub/obsidian`

### 5. **calendar-assistant** (clawhub.com/calendar)
- **O que faz:** Agenda reuniões, detecta conflitos, sugere horários
- **Por que é útil:** "Agenda 30min com João na próxima semana, de manhã."
- **Instalação:** `openclaw skill install clawhub/calendar`

### 6. **email-summarizer** (clawhub.com/email-summary)
- **O que faz:** Resume inbox não lida, destaca urgências
- **Por que é útil:** "Resume meus emails de hoje." Zero-inbox assistido.
- **Instalação:** `openclaw skill install clawhub/email-summary`

### 7. **habit-tracker** (clawhub.com/habits)
- **O que faz:** Rastreia hábitos diários, envia lembretes
- **Por que é útil:** "Já bebi 2L de água hoje?" "Lembra de meditar às 19h."
- **Instalação:** `openclaw skill install clawhub/habits`

---

## 🔍 Como Descobrir Mais Skills

- **ClawHub oficial:** https://clawhub.com
- **GitHub topic:** procure por `openclaw-skill` no GitHub
- **Comunidade Discord:** pergunte no #skills o que as pessoas usam
- **Crie a sua:** se não existe, é uma oportunidade! Skills são só bash + SKILL.md

---

## 📝 Anatomia de uma Skill

Uma skill OpenClaw é simplesmente:

```
skill-name/
├── SKILL.md          # Documentação + declaração de tools
├── tool-one.sh       # Script executável
└── tool-two.sh       # Outro script
```

O agente lê `SKILL.md`, descobre as tools disponíveis, e executa os scripts quando necessário.

**Dica:** Comece simples. Uma skill de 50 linhas que resolve SEU problema > uma skill de 500 linhas genérica.

---

## ✅ Checklist de Instalação

Antes de instalar uma skill:

- [ ] Li o `SKILL.md` e entendo o que ela faz
- [ ] Revisei os scripts bash (procuro por `rm -rf`, `curl` suspeito, `eval`)
- [ ] Verifiquei que não duplica funcionalidade que já tenho
- [ ] Sei quais credenciais/APIs ela precisa
- [ ] Testei em ambiente isolado primeiro (se crítico)

Depois de instalar:

- [ ] Configurei credenciais no `.env` ou 1Password
- [ ] Testei cada tool manualmente
- [ ] Documentei uso específico no meu `TOOLS.md`
- [ ] Atualizei `AGENTS.md` se a skill requer regras especiais

---

**Lembre-se:** Skills amplificam o agente. Mas um agente sem identidade forte (SOUL.md, USER.md) continua genérico, independente de quantas skills instalar. Invista tempo em quem o agente É antes de multiplicar o que ele FAZ.
