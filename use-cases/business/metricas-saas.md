# 📊 Use Case: Métricas SaaS Automáticas

> Dashboard de MRR, churn, LTV e conversão direto no Telegram.

## O que faz

Conecta na API do seu billing (ChartMogul, Stripe, Paddle) e gera reports automáticos:
- MRR atual e variação mês a mês
- Churn rate e motivos de cancelamento
- LTV médio e por plano
- Conversão de trial → pagante
- Failed payments e recuperação
- Top clientes e riscos de churn

## Prompt

```
Quero que você monitore as métricas do meu SaaS automaticamente.

Configuração:
- Meu billing é [CHARTMOGUL/STRIPE/PADDLE]
- API key está no 1Password no cofre [NOME DO COFRE]

Crie os seguintes reports automáticos:

1. **Daily quick** (todo dia às 9h, via cron):
   - MRR atual
   - Novos clientes ontem
   - Cancelamentos ontem
   - Failed payments pendentes

2. **Weekly digest** (segunda às 10h):
   - MRR variação semana
   - Top 5 motivos de churn
   - Conversão trial→paid
   - Comparativo com semana anterior

3. **Monthly deep dive** (dia 1 de cada mês):
   - Report completo com gráficos
   - Análise de tendências
   - Previsão de MRR próximo mês
   - Ações recomendadas

Entregue no tópico [NOME DO TÓPICO] do Telegram.
Me avise IMEDIATAMENTE se churn subir >5% ou MRR cair >3% em um dia.
```

## Exemplo real

A Amora monitora o MyGroupMetrics via ChartMogul:
- MRR: R$8.000 (+11.2% mês)
- Churn: 8% (caiu de 23% → 8% com a nova versão)
- Alerta: R$3.347 em failed payments (principalmente saldo insuficiente)
