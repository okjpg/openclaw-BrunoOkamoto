# 💰 Custos — Breakdown Real de Rodar um Agente AI

> Quanto custa na prática, com otimizações aplicadas.

---

## Infraestrutura

| Item | Custo/mês | Notas |
|------|-----------|-------|
| VPS Hostinger KVM 1 | ~R$25-50 | 2 vCPU, 4GB RAM, Ubuntu 24.04 |
| VPS Hostinger KVM 2 | ~R$39-60 | 2 vCPU, 8GB RAM (recomendado pra multi-agent) |
| Domínio (opcional) | ~R$5-10 | Pra Mission Control |
| Cloudflare Tunnel | Grátis | Acesso remoto seguro |
| **Subtotal infra** | **R$25-60** | |

## API do Modelo (Anthropic)

### Sem otimização (tudo Opus)
| Uso | Custo/dia | Custo/mês |
|-----|-----------|-----------|
| Interação diária | ~$2-3 | ~$70-90 |
| 17 crons | ~$1-2 | ~$30-60 |
| Heartbeats | ~$0.50 | ~$15 |
| **Total** | **~$3-5** | **~$100-150** |

### Com otimização (split inteligente) ✅
| Uso | Modelo | Custo/dia | Custo/mês |
|-----|--------|-----------|-----------|
| Interação (chat) | Opus | ~$0.50-1.00 | ~$15-30 |
| Crons execução | Sonnet | ~$0.10-0.20 | ~$3-6 |
| Heartbeats | Haiku | ~$0.01-0.02 | ~$0.30-0.60 |
| Heartbeats | Ollama local | $0 | $0 |
| **Total otimizado** | | **~$0.60-1.20** | **~$18-36** |

### Economia
| Métrica | Antes | Depois |
|---------|-------|--------|
| Custo diário | $3-5 | $0.60-1.20 |
| Custo mensal | $100-150 | $18-36 |
| **Economia** | | **~75-80%** |

### Dica: Assinatura Anthropic
- Plano Pro ($20/mês) inclui uso generoso do Claude
- Se usar via assinatura em vez de API, custo cai drasticamente
- Bruno usa assinatura e nunca estourou o limite

## APIs e Ferramentas Externas

| Ferramenta | Custo/mês | Pra quê |
|------------|-----------|---------|
| 1Password | Grátis (pessoal) ou $3 | Gerenciar credenciais |
| RapidAPI | Grátis (free tier) | Proxy pra YouTube, Instagram, X |
| Apify | Grátis ($5 crédito/mês) | YouTube transcripts (~714 vídeos) |
| Brave Search API | Grátis (2k buscas/mês) | Web search |
| Google APIs | Grátis | Calendar, Drive, YouTube Data |
| OpenAI (Whisper) | ~$1-3 | Transcrição de áudio |
| **Subtotal APIs** | **$0-10** | Maioria tem free tier |

## Custo Total Estimado

### Iniciante (1 agente, uso moderado)
| Item | Custo/mês |
|------|-----------|
| VPS KVM 1 | R$25-50 |
| API Anthropic (otimizado) | R$90-180 (~$18-36) |
| APIs externas | R$0-25 |
| **Total** | **R$115-255/mês** |
| **Por dia** | **~R$4-8** |

> "Menos que um café por dia pra ter um assistente AI 24/7"

### Avançado (6 agentes, 22 crons, stack completo)
| Item | Custo/mês |
|------|-----------|
| VPS KVM 2 | R$39-60 |
| API Anthropic (otimizado) | R$180-360 (~$36-72) |
| APIs externas | R$25-50 |
| Supabase (MC) | Grátis (free tier) |
| **Total** | **R$244-470/mês** |
| **Por dia** | **~R$8-16** |

> "O equivalente a 1/10 de um funcionário CLT, trabalhando 24/7"

## Comparativo com Alternativas

| Solução | Custo/mês | Disponibilidade | Personalização |
|---------|-----------|-----------------|----------------|
| **OpenClaw otimizado** | R$115-255 | 24/7 | Total |
| Assistente freelancer | R$2.000-5.000 | Horário comercial | Média |
| Funcionário CLT | R$3.000-8.000 | Horário comercial | Alta |
| ChatGPT Pro | R$100 | Sob demanda | Baixa |
| N8N + Zapier | R$200-500 | 24/7 (limitado) | Média |

## Dicas de Economia

1. **Sonnet pra crons** — 90% de economia vs Opus
2. **Haiku pra heartbeats** — ou Ollama local (grátis)
3. **Session initialization** — 8KB vs 50KB = 80% menos tokens
4. **Rate limits** — previne runaway de automações
5. **Free tiers** — RapidAPI, Apify, Brave, Google APIs são generosos
6. **Assinatura vs API** — assinatura Anthropic pode ser mais barato pra uso pessoal

---

*Valores baseados em produção real — Fev/2026*
*Câmbio aproximado: $1 = R$5*
