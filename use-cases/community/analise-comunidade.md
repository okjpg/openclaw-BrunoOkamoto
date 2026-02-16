# 👥 Use Case: Análise de Comunidade

> Entenda o que sua comunidade está falando, pedindo e sentindo.

## O que faz

Conecta na API da sua comunidade (Circle, Discord, Slack) e analisa:
- Hot topics (o que está gerando mais discussão)
- Perguntas frequentes (FAQ natural da comunidade)
- Membros mais ativos e influentes
- Spam e posts duplicados
- Trends emergentes
- Sentimento geral

## Prompt

```
Quero uma análise completa da minha comunidade nos últimos [30/60] dias.

Minha comunidade é [CIRCLE/DISCORD/SLACK] com [NÚMERO] membros.

Me entregue:

1. **Hot Topics** — os 10 assuntos mais discutidos, com volume de posts
2. **Perguntas Frequentes** — as 10 perguntas que mais aparecem (base pra FAQ/conteúdo)
3. **Membros destaque** — top 10 mais ativos e top 10 que mais ajudam outros
4. **Spam check** — posts duplicados, cross-posting excessivo, padrões suspeitos
5. **Trends** — assuntos que estão CRESCENDO (não os maiores, os que estão acelerando)
6. **Sentimento** — como está o clima? Positivo? Frustrado? Qual a vibe?
7. **Oportunidades** — ideias de conteúdo, features, ou ações baseadas nos dados

Formato: report com insights acionáveis, não só números.

Dica: cruze os dados da comunidade com os tickets de suporte pra ver padrões completos.
```

## Exemplo real

A Amora analisou 345 posts da comunidade Micro-SaaS (20k membros):
- Spam puro: não encontrado
- Padrões de atenção: cross-posting e repetição
- "150 MVPs em 60 dias" — dado que virou post LinkedIn viral
- Cruzamento com Crisp revelou: vibe coding domina em ambos
