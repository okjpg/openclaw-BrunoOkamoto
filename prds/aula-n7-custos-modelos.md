# PRD — Aula N-7: Quanto Custa e Qual Modelo Usar

> **Nível:** Intermediário  
> **Duração estimada:** 15 minutos  
> **Pré-requisito:** OpenClaw instalado e funcionando, pelo menos um provider configurado

---

## 🎯 Objetivo da Aula

Ao final desta aula, o aluno será capaz de:

1. Entender a diferença entre **assinatura** e **API Key** e quando usar cada uma
2. Comparar os principais modelos de IA por **preço e capacidade**
3. Escolher o modelo certo para cada tipo de tarefa (economizando até 95%)
4. Configurar **modelos diferentes por função** (heartbeat, chat, análise)
5. Estimar o **gasto mensal real** do seu setup
6. Colocar **limites de gasto** para nunca ser surpreendido

---

## 📋 Script de Gravação — Seção por Seção

### 🎬 ABERTURA (0:00 – 1:00)

**[Bruno na tela, tom direto]**

> "Fala, pessoal! Aula N-7 — custos e modelos. Essa é a aula que vai te salvar de um susto na fatura."

> "Já vi aluno gastar $200 num único dia de teste. Já vi outro rodando o mesmo setup por $8/mês. A diferença? Escolha de modelo. Em 15 minutos você vai entender tudo."

---

### 💳 SEÇÃO 1: Assinatura vs API Key — Qual Usar? (1:00 – 4:30)

**[Tela: slide comparativo]**

> "Primeira decisão: você vai usar assinatura mensal ou API Key com pay-per-use?"

**[Mostrar na tela:]**

| | Assinatura (ChatGPT Plus/Pro) | API Key (pay-per-use) |
|---|---|---|
| **Custo fixo** | Valor mensal do seu plano | $0 se não usar |
| **Controle de gasto** | Limitado ao plano | ✅ Total |
| **Funciona com OpenClaw** | ✅ Sim, via OAuth OpenAI | ✅ Sim |
| **Ideal para** | Setup rápido, uso no mesmo ecossistema | Agentes, automação, controle fino |
| **Risco de surpresa** | Baixo | Médio sem limites |

> "O fluxo padrão do curso é: **OpenAI primeiro**. OAuth é o caminho mais rápido pra começar. API Key é o caminho mais flexível quando você quer medir custo, trocar modelo e automatizar com mais controle."

> "Se quiser testar outros modelos além da stack padrão, use OpenRouter como camada de experimentação. Anthropic fica como comparação opcional, não como fallback principal do curso."

---

### 📊 SEÇÃO 2: Tabela de Modelos e Preços (4:30 – 8:00)

**[Tela: tabela comparativa]**

> "Agora vamos falar de dinheiro concreto. Os modelos são cobrados por tokens — pedaços de texto de ~4 caracteres. O preço é por 1 milhão de tokens."

| Modelo | Preço Input (M tokens) | Preço Output (M tokens) | Velocidade | Qualidade |
|--------|----------------------|------------------------|------------|-----------|
| **GPT-5.4** | $2.50 | $15 | Médio | ⭐⭐⭐⭐⭐ |
| **GPT-4o** | $2.50 | $10 | Médio | ⭐⭐⭐⭐ |
| **GPT-4o-mini** | $0.15 | $0.60 | Rápido | ⭐⭐⭐ |
| **Gemini 3.1 Pro** | $1.25 | $5 | Médio | ⭐⭐⭐⭐ |
| **Mistral Small** | $0.10 | $0.30 | Muito rápido | ⭐⭐ |

> "Uma mensagem típica usa ~500 tokens de input + ~200 tokens de output. Vamos fazer a conta com a stack padrão do curso:"

> "Com GPT-5.4: $2.50/M × 0.0005M + $15/M × 0.0002M = $0.00125 + $0.003 = **$0.00425 por mensagem**"
> "Com GPT-4o-mini: $0.15/M × 0.0005M + $0.60/M × 0.0002M = $0.000075 + $0.00012 = **$0.000195 por mensagem**"

> "Diferença: **mais de 20x mais barato** com GPT-4o-mini para tarefas simples."

> "Anthropic continua útil como comparação opcional, e OpenRouter é o melhor jeito de experimentar esses modelos sem trocar a narrativa principal do curso."

---

### 🎯 SEÇÃO 3: Qual Modelo Para Cada Situação? (8:00 – 11:00)

**[Tela: cards de recomendação]**

> "A estratégia é: use o modelo MÍNIMO que resolve o problema."

**Heartbeats e Crons:**

> "Heartbeat é quando o agente acorda sozinho pra checar emails, calendário, notificações. Essas tarefas são simples — verificar, categorizar, decidir se precisa te avisar."
> "**Use GPT-4o-mini** — é o modelo econômico da stack padrão do curso. Para tarefas repetitivas, ele entrega o melhor custo-benefício sem sacrificar velocidade."

**Interação Diária (mensagens no Telegram):**

> "Quando você manda uma mensagem pro agente e quer uma resposta útil — pesquisa, organização, análise leve."
> "**Use GPT-4o** — ele é o ponto ideal da stack padrão para conversa diária: mais barato que o flagship e muito forte para uso geral."

**Análise Complexa:**

> "Quando você precisa analisar um documento longo, tomar uma decisão difícil, ou escrever algo importante."
> "**Use GPT-5.4** — mas só quando precisa. Ele é o topo da stack padrão do curso para contexto longo, decisões e escrita importante."

**Experimentação e comparação:**

> "Gemini 3.1 Pro é uma excelente alternativa econômica. Claude pode entrar como comparação opcional. Se quiser testar esses caminhos sem mexer no setup principal, use OpenRouter como camada de experimentação."

---

### ⚙️ SEÇÃO 4: Como Configurar Modelo por Função (11:00 – 13:00)

**[Tela: Terminal]**

> "O OpenClaw permite configurar modelos diferentes por função. Isso é poderoso."

```bash
# Modelo padrão para interações do dia a dia
openclaw config set model openai/gpt-5.4

# Modelo específico para heartbeats (econômico)
openclaw config set heartbeat.model openai/gpt-4o-mini

# Modelo para análises pesadas (opcional, usar com moderação)
openclaw config set analysis.model openai/gpt-5.4
```

> "Dessa forma, o agente usa GPT-4o-mini automaticamente nos heartbeats, GPT-4o para conversa diária e GPT-5.4 quando você realmente pedir análise pesada."

> "Para verificar a configuração atual:"

```bash
openclaw config get model
openclaw config get heartbeat.model
```

---

### 💰 SEÇÃO 5: Exemplo Real de Gasto Mensal (13:00 – 14:30)

**[Tela: breakdown de custos]**

> "Vamos montar um setup real e calcular:"

| Uso | Quantidade/mês | Modelo | Custo estimado |
|-----|---------------|--------|----------------|
| Heartbeats (2x/hora, 16h/dia) | ~960 execuções | GPT-4o-mini | ~$1 |
| Mensagens diárias (10/dia) | ~300 mensagens | GPT-4o | ~$4 |
| Análises semanais | ~4 análises longas | GPT-5.4 | ~$6 |
| Crons e automações | ~200 execuções | GPT-4o-mini | ~$1 |
| **Total estimado** | | | **~$12/mês** |

> "Setup moderado, agente funcionando 24/7 com heartbeats ativos: **~$12 a $25/mês**. Se você usar intensamente, pode passar disso, mas a stack padrão já nasce com controle de custo muito melhor."

> "Compare com: manter uma assinatura isolada sem automação, ou depender de execução manual. Com OpenAI como base, OpenRouter para experimentos e Anthropic opcional, você monta um stack profissional por uma fração do custo de operação humana."

---

### 🚨 SEÇÃO 6: Troubleshooting — "Minha Conta Zerou" (14:30 – 15:00)

**[Tela: como colocar limites]**

> "Isso acontece quando um loop de código ou skill mal configurada faz milhares de chamadas sem querer. Como se proteger:"

**Na OpenAI:**
```
platform.openai.com → Settings → Billing → Usage Limits
→ "Monthly spend limit" → Defina um valor (ex: $50)
→ "Notification threshold" → Defina um alerta (ex: $25)
```

**No OpenClaw:**
```bash
# Limitar requests por hora (proteção contra loops)
openclaw config set rateLimit.requestsPerHour 100

# Ver gasto estimado acumulado do mês
openclaw usage report
```

> "Configure esses limites **antes** de começar a usar intensamente. É o cinto de segurança — você espera não precisar, mas vai ficar feliz que existe."

---

## 🛠️ Configuração Recomendada Para Iniciantes

```bash
# Setup básico e econômico para começar
openclaw config set model openai/gpt-5.4
openclaw config set heartbeat.model openai/gpt-4o-mini

# Verificar configuração
openclaw config get model
openclaw config get heartbeat.model
```

E no platform.openai.com:
- Monthly spend limit: $50
- Notification at: $25

---

## 📊 Tabela Completa de Modelos (Referência Rápida)

| Modelo | Input/Output ($/M) | Uso Ideal | Evitar Para |
|--------|-------------------|-----------|-------------|
| GPT-5.4 | $2.50/$15 | Análise profunda, decisões importantes | Heartbeats e tarefas repetitivas |
| GPT-4o | $2.50/$10 | Conversa diária, pesquisa, código | Volume muito alto e tarefas triviais |
| GPT-4o-mini | $0.15/$0.60 | Heartbeats, crons, classificação | Análises complexas e escrita crítica |
| Gemini 3.1 Pro | $1.25/$5 | Alternativa econômica para comparar resultados | — |
| Mistral Small | $0.10/$0.30 | Routing e classificação simples | Qualquer tarefa que exige raciocínio |
| Claude (opcional) | Varia | Comparação qualitativa ou casos específicos | Virar fallback principal do curso |

---

## ✅ Checklist Final do Aluno

- [ ] Entende a diferença entre assinatura e API Key
- [ ] Modelo padrão configurado: `openclaw config set model openai/gpt-5.4`
- [ ] Modelo de heartbeat configurado: `openclaw config set heartbeat.model openai/gpt-4o-mini`
- [ ] Limite de gasto configurado no platform.openai.com
- [ ] Notificação de gasto configurada (threshold)
- [ ] `openclaw usage report` testado e funcionando

---

## ❓ Dúvidas Frequentes

**1. Posso trocar de modelo a qualquer hora?**

> Sim. `openclaw config set model NOVO-MODELO` e pronto. Válido a partir da próxima mensagem.

**2. O Mistral é muito mais barato — por que não usar sempre?**

> Qualidade inferior para raciocínio complexo. Para classificação simples funciona; para conversa diária, o mínimo recomendado da stack padrão é GPT-4o-mini, e para interação principal vale mais usar GPT-4o.

**3. Gemini é confiável para uso com OpenClaw?**

> Sim, desde a v2026.3.2. Boa alternativa econômica. É um ótimo candidato para comparação via OpenRouter, sem virar o caminho principal do curso.

**4. Como saber exatamente quanto gastei?**

> `openclaw usage report` mostra breakdown por modelo. Platform.openai.com mostra em tempo real com gráficos para a API da OpenAI. Se estiver testando outros modelos, OpenRouter oferece um dashboard separado para experimentação.

**5. Haiku é "burro"?**

> Não! Para tarefas estruturadas (checar emails, classificar mensagens, responder perguntas simples), Haiku é excelente. Ele fica atrás em raciocínio multi-step e criatividade. Para 80% das tarefas de automação, é mais que suficiente.
