# PRD: Setup de Integrações

> Jogue este arquivo no agente: "Configura estas integrações seguindo o PRD"

## Contexto

Um agente sem integrações é só um chatbot. Estas são as integrações mais úteis por categoria.

## Nível 1 — Essenciais (fazer primeiro)

### Google Calendar
```bash
# Instalar GOG CLI
npm install -g gog

# Autenticar
gog auth login --client=calendar-client --account=SEU_EMAIL
```
- Permite: ver compromissos, criar eventos, lembretes
- Cron sugerido: checar agenda a cada heartbeat

### Telegram (já configurado no setup)
- Criar grupo com tópicos para organizar conversas
- Tópicos sugeridos: Geral, Conteúdo, Métricas, Operacional
- dmPolicy: SEMPRE allowlist

## Nível 2 — Produtividade

### Google Drive
```bash
gog drive ls --client=drive-client --account=SEU_EMAIL
```
- Upload/download de arquivos
- Útil para compartilhar reports, docs, planilhas

### Notion API
- Criar integração em https://www.notion.so/my-integrations
- Guardar API key no 1Password
- Útil para: kanban, base de conteúdo, CRM

### 1Password CLI
```bash
# Instalar
# Ver: https://developer.1password.com/docs/cli/get-started/

# Uso
op item get "Nome do Item" --field credential --reveal
```
- TODA credencial deve viver no 1Password
- Nunca hardcodar API keys em arquivos

## Nível 3 — Conteúdo & Métricas

### YouTube (Data API + OAuth)
- Criar projeto no Google Cloud Console
- Habilitar YouTube Data API v3
- Gerar OAuth credentials
- Permite: listar vídeos, ver analytics, agendar uploads

### Social Media via RapidAPI
- Cloud IPs são bloqueados por Instagram, X, LinkedIn
- RapidAPI funciona como proxy:
  - Instagram Statistics API (50 req/mês free)
  - X/Twitter API45 (1000 req/mês free)
  - Fresh LinkedIn Scraper
- Cadastro: https://rapidapi.com

### Brave Search
- API para pesquisa web
- Já vem configurado no OpenClaw (verificar)

## Nível 4 — Avançado

### ChartMogul (se tiver SaaS)
- Métricas de MRR, churn, LTV
- Cron semanal para report

### Crisp / Intercom (se tiver suporte)
- Análise de conversas
- Insights de conteúdo a partir de dúvidas reais

## Crons Essenciais

Após configurar integrações, criar crons:

| Cron | Frequência | O que faz |
|------|-----------|-----------|
| Check agenda | A cada heartbeat | Compromissos próximos |
| Métricas sociais | Semanal | Puxar dados das redes |
| Revisão semanal | Sexta | Revisar projetos e pendências |

**REGRA CRÍTICA para crons:**
```
sessionTarget: "isolated"
payload.kind: "agentTurn"
delivery: { mode: "announce" }
```
NUNCA usar `systemEvent` + `main` — dispara mas não executa.

## Resultado Esperado

Agente conectado às suas ferramentas principais, com pelo menos 2 crons rodando.
