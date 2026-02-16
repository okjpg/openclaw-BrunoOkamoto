# PRD: Setup Multi-Agentes

> Para quando um agente não é suficiente. Jogue no agente principal.

## Contexto

Quando as responsabilidades crescem, um único agente fica sobrecarregado. A solução: múltiplos agentes especializados, coordenados por um principal (hub).

## Arquitetura

```
Gateway (1 servidor)
├── Agente Principal (Opus) ← hub, coordena tudo
├── Agente de Conteúdo (Sonnet) ← produção, drafts
├── Agente Scraper (Sonnet) ← coleta de dados
└── [Outros conforme necessidade]
```

## Leveling System (Kevin Simback)

Todo agente novo começa em L1 e sobe conforme ganha confiança:

| Nível | Nome | Autonomia | Revisão |
|-------|------|-----------|---------|
| L1 | Observer | Zero — output sempre revisado | Cada entrega |
| L2 | Contributor | Baixa — pode sugerir, não executar | Semanal |
| L3 | Operator | Média — executa dentro de guidelines | Semanal |
| L4 | Trusted | Alta — autonomia quase total | Quinzenal |

**Regras:**
- Promoção via performance review semanal
- Rebaixamento é possível (se qualidade cair)
- NUNCA "rushar" um agente pra L3+ sem histórico

## Shared Context

Criar pasta `shared/` acessível por todos os agentes:

```
shared/
├── TEAM.md          ← Registry: quem faz o quê, nível, status
├── outputs/         ← Resultados compartilhados
└── lessons/         ← Aprendizados do time
```

**TEAM.md exemplo:**
```markdown
| Agente | Papel | Nível | Modelo | Status |
|--------|-------|-------|--------|--------|
| Amora | COO / Hub | L4 | Opus | Ativo |
| Content | Produção | L1 | Sonnet | Ativo |
| Scraper | Coleta | L1 | Sonnet | Ativo |
```

## Economia

- **Agente principal:** Opus (interação, decisões)
- **Agentes de execução:** Sonnet (crons, tarefas rotineiras)
- **Heartbeats:** Haiku (economia ~90%)
- Regra: agente que não precisa de Opus NÃO deve usar Opus

## Coordenação

- Agente principal é o HUB — usuário fala só com ele
- Agentes secundários não têm binding Telegram
- Hub model > Mesh model (aprendizado cruzado entre domínios distintos não funciona)
- Sub-agents (sessions_spawn) para tasks paralelas

## Tarefas

1. Definir quais agentes você precisa (max 2-3 pra começar)
2. Criar config de cada agente com SOUL.md próprio
3. Configurar shared/TEAM.md
4. Definir modelos (Opus vs Sonnet)
5. Fazer primeiro test drive com task simples
6. Review após 1 semana → decidir promoção

## Resultado Esperado

Time de 2-3 agentes coordenados, cada um com papel claro e nível definido.
