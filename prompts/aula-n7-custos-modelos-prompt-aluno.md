# Prompt do Aluno — Aula N-7: Quanto Custa e Qual Modelo Usar

> **Como usar:** Copie o prompt abaixo e cole no chat do seu agente OpenClaw após assistir a aula.

---

## 📋 Prompt Principal

```
Olá! Acabei de assistir a aula N-7 do curso OpenClaw sobre custos e modelos de IA.

Preciso da sua ajuda para:
1. Verificar quais modelos estão configurados no meu setup
2. Otimizar a configuração para economizar sem perder qualidade
3. Entender quanto estou gastando (ou vou gastar)

Vamos começar com um diagnóstico da minha configuração de modelos?
```

---

## 🧪 Exercício 1 — Diagnóstico de Modelos Configurados

```
Por favor, verifique minha configuração atual de modelos:

1. Execute `openclaw config get model` — qual é o modelo padrão?
2. Execute `openclaw config get heartbeat.model` — tem modelo específico para heartbeat?
3. Me diga se estou usando o modelo certo ou se devo otimizar
4. Calcule o custo estimado por mensagem com o modelo atual

Baseado na tabela de preços:
- GPT-4o-mini: ~$0.15/$0.60 por M tokens
- GPT-4o: $2.50/$10 por M tokens  
- GPT-5.4: $2.50/$15 por M tokens
- Gemini 3.1 Pro: $1.25/$5 por M tokens
```

---

## 💰 Exercício 2 — Calcular Gasto Mensal Estimado

```
Quero estimar quanto vou gastar por mês. Me ajude com esse cálculo:

Meu uso estimado:
- Heartbeats: [X] vezes por hora, [Y] horas por dia
- Mensagens diretas: [Z] por dia
- Análises longas: [W] por semana

Para cada tipo de uso:
1. Qual modelo deveria usar?
2. Qual o custo estimado por execução?
3. Qual o custo mensal total desse item?

Ao final, some tudo e me dê um total mensal estimado.
(Preencha os valores acima com o seu uso real ou estimado)
```

---

## ⚙️ Exercício 3 — Configurar Modelos Otimizados

```
Quero configurar modelos diferentes para diferentes situações no meu OpenClaw.

Por favor, me guie pelos comandos para:
1. Configurar `openai/gpt-4o` como modelo padrão para interações
2. Configurar `openai/gpt-4o-mini` para heartbeats (econômico)
3. Separar `openai/gpt-5.4` para análises mais pesadas, quando fizer sentido
4. Verificar que as configurações ficaram corretas
5. Me dizer o impacto estimado no custo mensal dessa mudança

Execute os comandos e confirme cada passo.
```

---

## 🛡️ Exercício 4 — Configurar Limites de Gasto

```
Preciso configurar proteções para não ter surpresas na fatura.

Por favor:
1. Me diga como configurar o limite de gasto mensal no platform.openai.com (instruções passo a passo)
2. Configure o rateLimit no OpenClaw: `openclaw config set rateLimit.requestsPerHour 100`
3. Me ensine a verificar o gasto atual com `openclaw usage report`
4. Sugira um limite de gasto adequado para o meu perfil de uso

Queremos garantir que se algo der errado (loop infinito, bug em skill), o dano financeiro seja limitado.
```

---

## 📊 Exercício 5 — Comparação Real de Custo: Haiku vs Sonnet vs Opus

```
Quero ver na prática a diferença de custo entre os modelos.

Por favor, me faça uma demonstração:
1. Crie uma tarefa de heartbeat simples (ex: "verifique se há emails urgentes e responda em 1 linha")
2. Estime o custo dessa tarefa em cada modelo: GPT-4o-mini, GPT-4o e GPT-5.4
3. Calcule quanto isso significa em 30 dias com 2 heartbeats por hora

Mostre o cálculo detalhado para eu entender por que o GPT-4o-mini é tão importante para tarefas repetitivas.
```

---

## 🔍 Exercício 6 — Análise do Uso Real (se já estiver usando há algum tempo)

```
Já estou usando o OpenClaw há algum tempo e quero analisar meu uso real.

Por favor:
1. Execute `openclaw usage report` e me mostre o resultado
2. Identifique qual modelo estou usando mais
3. Calcule se estaria gastando menos com uma configuração mais otimizada
4. Sugira ajustes na minha configuração baseado no uso real

Se `openclaw usage report` não estiver disponível, me explique como ver o uso no console da OpenAI. Se eu estiver testando outros modelos, inclua também como ver isso no OpenRouter.
```

---

## ✅ Verificação Final de Aprendizado

```
Para encerrar os exercícios da aula N-7, me faça um quiz rápido com 5 perguntas sobre:
- Quando usar GPT-4o-mini vs GPT-4o vs GPT-5.4
- Como o preço por token funciona na prática
- Como configurar modelos diferentes por função
- Como se proteger de gastos inesperados
- Diferença entre assinatura e API Key

Após eu responder, me dê feedback sobre o que acertei e o que preciso revisar.
```

---

## 💡 Dica Rápida

> Se quiser uma análise rápida do seu setup atual:

```
Faça um diagnóstico completo do meu setup de custos:
1. Modelos configurados atualmente
2. Frequência de heartbeats ativos
3. Custo mensal estimado com a configuração atual
4. Sugestão de otimização se aplicável
5. Alerta se alguma configuração pode causar custo excessivo
```
