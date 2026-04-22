# PRD — Aula N-1: Configurar Credenciais — ChatGPT OAuth (Padrão) + OpenAI API Key

> **Nível:** Iniciante / Setup
> **Duração estimada:** 15–20 minutos
> **Pré-requisito:** OpenClaw instalado, acesso à internet, conta ChatGPT (Plus ou Pro)
> **Atualizado:** ChatGPT OAuth como caminho recomendado (2026-04)

---

## 🎯 Objetivo da Aula

Ao final desta aula, o aluno será capaz de:

1. Configurar o OpenClaw com **ChatGPT/OpenAI via OAuth** (recomendado — 1 clique, sem API key)
2. Configurar **OpenAI API Key** como fallback de controle fino
3. Entender quando usar **OpenRouter** para testar outros LLMs sem sair da stack principal
4. Configurar **Anthropic API Key** opcionalmente, apenas se quiser Claude de forma direta
5. Configurar as credenciais no OpenClaw via `openclaw auth login`
6. Verificar se a configuração está funcionando com `openclaw status`
7. Diagnosticar e resolver os **erros mais comuns** de autenticação

---

## 📋 Script de Gravação — Seção por Seção

### 🎬 ABERTURA (0:00 – 2:00)

**[Bruno na tela, tom direto]**

> "Fala, pessoal! Aula N-1 do curso OpenClaw — configurar credenciais. Essa é a aula onde a maioria das pessoas trava, e o objetivo aqui é acabar com essa dúvida de vez."

> "Vou te mostrar o caminho mais simples: usar sua conta do ChatGPT que você já tem. Sim — se você já paga R$99/mês de ChatGPT Plus, o OpenClaw pode usar essa mesma conta via OAuth. Um clique, sem API key, sem configurar billing separado."

> "Também vou mostrar como configurar via API key direta, que é útil pra quem quer mais controle. E, se você quiser experimentar outros LLMs depois, o caminho recomendado é adicionar OpenRouter como camada de testes, sem mexer no fluxo principal do curso."

---

### 📚 SEÇÃO 1: Os dois caminhos de autenticação (2:00 – 5:00)

**[Tela: diagrama comparativo]**

> "Existem dois caminhos pra conectar o OpenClaw na OpenAI:"

| Caminho | Como funciona | Melhor pra |
|---------|-------------|-----------|
| **OAuth (recomendado)** | 1 clique no navegador, usa sua assinatura existente | Quem já tem ChatGPT Plus/Pro |
| **API Key** | Gera chave na plataforma, cola no terminal | Quem quer controle fino de gasto, usa múltiplos modelos |

> "O OAuth é mais simples. A API Key é mais flexível. Os dois funcionam — escolhe o que faz mais sentido pra você."

---

### 🔐 SEÇÃO 2: ChatGPT OAuth — O caminho recomendado (5:00 – 10:00)

**[Tela: terminal + navegador lado a lado]**

> "Vamos pelo OAuth. Esse é o caminho mais simples."

> "No terminal, digita:"

```bash
openclaw auth login --provider openai
```

> "O OpenClaw vai abrir o navegador automaticamente. Faz login com sua conta ChatGPT — pode ser Plus ou Pro. Autoriza o acesso."

> "Na tela que aparecer, confirma. O terminal vai mostrar algo como:"

```
✅ OAuth completo
📧 Conta: seu-email@exemplo.com
🔗 Provider: openai (OpenAI)
📊 Plano: ChatGPT Plus
⏰ Validade: ~30 dias (renova automaticamente)
```

> "Pronto. Sem chave pra copiar, sem billing pra configurar. Você já tem tudo."

> "**Importante:** o OAuth usa a assinatura existente. Se você tem ChatGPT Plus, o OpenClaw vai usar o mesmo modelo que você tem acesso no chat. Não gasta nada adicional."

---

### 🔑 SEÇÃO 2.5: OpenAI API Key — O caminho flexível (10:00 – 14:00)

**[Tela: browser em platform.openai.com]**

> "Se você prefere API Key — seja por controle de gasto, seja porque quer usar modelos que não estão no Plus — vamos configurar."

> "Acesse **platform.openai.com/api-keys** e clica em **'Create new secret key'**."

> "Dá um nome (ex: `openclaw`), copia a chave. Começa com `sk-proj-` ou `sk-`. **Copia agora — não aparece de novo.**"

> "Verifica se tem crédito em **Billing → Usage**."

> "Volta pro terminal:"

```bash
openclaw config set provider openai
# O OpenClaw vai pedir a chave
```

> "Cole a chave. Pronto."

> "**Dica:** API Key dá acesso a todos os modelos da OpenAI, incluindo os mais novos. Mas precisa gerenciar créditos."

> "Se a sua meta é testar Gemini, Claude, Llama e outras opções sem reescrever seu setup principal, o caminho recomendado é ligar OpenRouter depois. Assim você mantém OpenAI como base do curso e usa OpenRouter só para experimentação."

---

### 🔑 SEÇÃO 3: Anthropic API Key — O caminho opcional (14:00 – 17:00)

**[Tela: browser em console.anthropic.com]**

> "Se você quer comparar com Claude especificamente, a Anthropic continua opcional. A Anthropic **não tem OAuth funcional** para a maioria dos planos — então é API Key direto. Para testar vários LLMs sem trocar a narrativa principal do curso, prefira OpenRouter; Anthropic direta faz sentido quando Claude for uma escolha consciente."

> "Acesse **console.anthropic.com** (não claude.ai — é outro sistema)."

> "Se você tem plano Pro ($20/mês): atenção — assinatura Pro e API são **sistemas de billing separados**. Você pode ter Pro no chat e não ter acesso à API. Verifica em Settings → Billing."

> "Se não tiver billing, adiciona um cartão ou créditos."

> "Clica em **API Keys → Create Key**. Copia imediatamente."

> "No terminal:"

```bash
openclaw auth login --provider anthropic
# Escolhe "API Key" (não OAuth — não funciona pra maioria)
# Cole a chave
```

> "**Resumo rápido:** ChatGPT OAuth = mais simples. Anthropic API Key = mais trabalho mas acesso ao Claude."

---

### ✅ SEÇÃO 4: Verificando tudo com `openclaw status` (17:00 – 19:00)

**[Tela: Terminal]**

> "Pra confirmar que tá tudo certo:"

```bash
openclaw status
```

> "Saída esperada:"

```
✅ OpenClaw Status
─────────────────────────────
Provider: OpenAI (OAuth)     ✅ Connected
Provider: Anthropic (API Key) ✅ Connected
─────────────────────────────
All providers configured ✓
```

> "Se aparecer Connected — perfeito! Próxima seção pra troubleshootings."

---

### 🔧 SEÇÃO 5: Erros Comuns e Como Resolver (19:00 – 22:00)

**[Tela: Slides com erros]**

**[Erro 1]**

> "**'OAuth access denied' ou 'Authorization failed'** — o login OAuth foi cancelado ou a conta não tem permissão. Tenta de novo: `openclaw auth login --provider openai`. Verifica se aceitou todos os termos."

**[Erro 2]**

> "**'Invalid API Key'** — a chave tá errada, expirou ou foi revogada. Vai no console do provider, cria uma nova."

**[Erro 3]**

> "**'HTTP 402 Payment Required'** — sem billing. Anthropic: console.anthropic.com → Billing. OpenAI API: platform.openai.com → Billing → créditos."

**[Erro 4]**

> "**'Insufficient credits'** — OpenAI API sem créditos. Adiciona em platform.openai.com → Billing."

**[Erro 5]**

> "**Rate limit (HTTP 429)** — limite temporário do provider. Espera 1-5 minutos. Considere modelos mais econômicos (GPT-4o-mini) se acontecer muito."

**[Erro 6]**

> "**'model_not_available'** — modelo não disponível no seu plano. Tenta com `gpt-4o-mini` ou `gpt-4o`."

---

### 🎯 ENCERRAMENTO (22:00 – 23:00)

> "Resumo da aula: o caminho mais simples é ChatGPT/OpenAI via OAuth — 1 clique, usa sua assinatura existente. OpenAI API Key entra quando você quer mais controle. Configuramos com `openclaw auth login`, verificamos com `openclaw status`."

> "Pra testar outros LLMs, o caminho recomendado do curso é OpenRouter como camada de experimentação. Anthropic direta continua opcional, não o fallback principal."

> "Próxima aula: a gente começa a usar de verdade!"

---

## 🛠️ Passo a Passo Técnico Detalhado

### 1. ChatGPT OAuth (Recomendado)

```bash
# Passo 1: No terminal
openclaw auth login --provider openai

# Passo 2: O navegador abre — faz login no ChatGPT
# Aceita a autorização

# Passo 3: Confirmação no terminal
# ✅ OAuth completo
```

### 2. OpenAI API Key (Fallback)

1. Acesse [platform.openai.com/api-keys](https://platform.openai.com/api-keys)
2. Clique em **"Create new secret key"**
3. Nome: `openclaw`
4. **COPIE A CHAVE** — não aparece de novo
5. Verifique créditos em **Billing → Usage**

```bash
openclaw config set provider openai
# Cole a chave quando solicitado
```

### 3. OpenRouter para testar outros LLMs (Recomendado para experimentação)

1. Acesse [openrouter.ai](https://openrouter.ai)
2. Crie sua conta e gere uma API key
3. Use essa chave quando quiser testar outros modelos mantendo OpenAI como base do curso
4. Trate OpenRouter como camada de experimentação, não como substituição obrigatória do setup inicial

### 4. Anthropic API Key (Opcional)

1. Acesse [console.anthropic.com](https://console.anthropic.com)
2. Verifique billing em **Settings → Billing**
3. **API Keys → Create Key**
4. **COPIE A CHAVE** — não aparece de novo
5. Configure no terminal:
```bash
openclaw auth login --provider anthropic
# Escolha API Key (não OAuth)
# Cole a chave
```

### 4. Verificar

```bash
openclaw status
# Saída: All providers configured ✅
```

### 5. Onde as Credenciais são Armazenadas

| SO | Caminho |
|----|---------|
| Linux / macOS | `~/.openclaw/config.json` |
| Windows | `C:\Users\<SeuNome>\.openclaw\config.json` |

> 🔒 **Segurança:** Esse arquivo nunca vai pro git. **Nunca commite esse arquivo.**

---

## 🚨 Tabela de Erros Comuns + Solução

| Erro | Causa | Solução |
|------|-------|---------|
| `OAuth access denied` | Login OAuth cancelado | `openclaw auth login --provider openai` de novo |
| `Invalid API Key` | Chave errada/expirada | Recriar chave no console do provider |
| `HTTP 402 Payment Required` | Sem billing ativo | Adicionar cartão/créditos no provider |
| `Insufficient credits` | OpenAI sem créditos | platform.openai.com → Billing → créditos |
| `HTTP 429 Too Many Requests` | Rate limit temporário | Esperar 1-5 min. Considerar modelo menor |
| `model_not_available` | Modelo indisponível no plano | Trocar para `gpt-4o-mini` |
| Chave funciona mas agente não responde | `tools.profile = messaging` | `openclaw config set tools.profile full` |

---

## ✅ Checklist Final do Aluno

- [ ] ChatGPT OAuth configurado (`openclaw auth login --provider openai`) — **recomendado**
- [ ] (Opcional) OpenAI API Key configurada
- [ ] (Opcional) Anthropic API Key configurada
- [ ] `openclaw status` mostrando Connected
- [ ] Primeiros testes realizados com sucesso
- [ ] `~/.openclaw/config.json` não está no git

---

## ❓ Dúvidas Frequentes

**1. Qual provider eu preciso configurar?**

> Só um é suficiente. **ChatGPT/OpenAI via OAuth é o mais simples** — usa sua assinatura existente. Se depois quiser testar outros modelos, adicione OpenRouter como etapa extra. Anthropic direta fica opcional.

**2. OAuth e API Key — qual a diferença de custo?**

> OAuth usa sua assinatura existente (Plus R$99/mês ou Pro). Não gasta mais. API Key cobra por uso real (~$5-15/mês com uso moderado).

**3. Posso usar os dois (ChatGPT + Claude)?**

> Sim! Configure os dois providers. O OpenClaw pode usar os dois. Você escolhe qual usar por padrão.

**4. Minha assinatura Pro da Anthropic funciona pro OAuth do OpenClaw?**

> Não. A Anthropic bloqueou OAuth para planos Pro. O que funciona é API Key direta. Por isso o ChatGPT/OpenAI OAuth continua sendo o caminho mais simples, e OpenRouter vira a opção mais prática para experimentação multi-modelo.

**5. Como trocar o provider padrão depois?**

> `openclaw config set model openai/gpt-5.4` (padrão do curso), ou troque temporariamente por outro modelo só quando estiver testando via OpenRouter ou Anthropic opcional.

**6. O OpenClaw almacena minhas chaves na nuvem?**

> Não. Chaves ficam em `~/.openclaw/config.json` — localmente. O OpenClaw não envia credenciais pra servidores externos.
