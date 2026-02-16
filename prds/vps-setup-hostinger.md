# PRD: Setup VPS na Hostinger (Bare Metal, sem Docker)

> Guia step-by-step para o Módulo 1 do curso.
> Bruno segue este roteiro na gravação.

---

## Pré-requisitos

- Conta na Hostinger (https://www.hostinger.com)
- Conta na Anthropic (https://console.anthropic.com) com billing ativo
- Telegram instalado no celular

## Tempo estimado: 15-20 minutos

---

## Passo 1: Criar a VPS na Hostinger (3 min)

1. Acesse https://www.hostinger.com/vps-hosting
2. Escolha o plano mais barato (KVM 1 — suficiente pra OpenClaw)
   - 1 vCPU, 4GB RAM, 50GB SSD — mais que suficiente
3. **IMPORTANTE:** NÃO use o template Docker/One-Click do OpenClaw
4. Selecione **Ubuntu 24.04** como sistema operacional
5. Defina uma senha root forte (ou SSH key se souber)
6. Anote o IP da VPS

> **Por que não o One-Click Docker?**
> O Docker isola o agente num container — instalar skills, integrações e ferramentas extras fica muito mais complicado. Pra quem não é técnico, é uma barreira desnecessária. Instalando direto, tudo funciona como esperado.

---

## Passo 2: Conectar na VPS via SSH (2 min)

### No Mac/Linux:
```bash
ssh root@SEU_IP_DA_VPS
```
(digita a senha quando pedir)

### No Windows:
- Use o PuTTY ou o Windows Terminal
- Host: SEU_IP_DA_VPS
- User: root

### Primeira vez? A Hostinger tem terminal no painel:
- hPanel → VPS → Terminal (botão no topo)
- Funciona direto no navegador, sem instalar nada

> 💡 **Dica pro curso:** Mostrar as duas opções (terminal local + terminal do painel) pra atender quem não sabe usar SSH.

---

## Passo 3: Instalar o OpenClaw (3 min)

```bash
# Instalar OpenClaw (1 comando)
curl -fsSL https://openclaw.ai/install.sh | bash
```

Isso instala o Node.js (se necessário) e o OpenClaw.

Depois, rodar o wizard de configuração:

```bash
openclaw onboard --install-daemon
```

O wizard vai perguntar:

1. **Gateway mode:** → Escolher `Local`
2. **AI Provider:** → Escolher `Anthropic`
3. **API Key:** → Colar a API key da Anthropic
4. **Model:** → Escolher `Claude Sonnet` (bom e barato pra começar)
5. **Instalar como serviço?** → Sim (roda 24/7 automaticamente)

> 💡 **Dica pro curso:** Mostrar onde pegar a API key na Anthropic (console.anthropic.com → API Keys → Create Key). Explicar que precisa ter billing ativo.

---

## Passo 4: Verificar se está rodando (30 seg)

```bash
openclaw gateway status
```

Deve mostrar: `running` ✅

Se quiser ver o painel web:
```bash
openclaw dashboard
```
Acesse: `http://SEU_IP:18789`

---

## Passo 5: Criar o Bot no Telegram (3 min)

1. Abra o Telegram no celular
2. Busque por `@BotFather`
3. Envie `/newbot`
4. Escolha um nome (ex: "Meu Agente AI")
5. Escolha um username (deve terminar em "bot", ex: "meuagenteai_bot")
6. **Copie o token** que o BotFather der

---

## Passo 6: Conectar Telegram ao OpenClaw (2 min)

De volta no terminal da VPS:

```bash
openclaw provider add telegram
```

Quando pedir, cole o token do bot.

Depois, abra o chat com seu bot no Telegram e envie `/start`.

---

## Passo 7: Segurança IMEDIATA (2 min)

**ANTES de fazer qualquer outra coisa**, blindar o acesso:

```bash
# Ver a config atual
cat ~/.openclaw/openclaw.json
```

Garantir que `dmPolicy` está como `allowlist` e que SÓ o seu Telegram ID está autorizado.

Para descobrir seu Telegram ID:
- Envie qualquer mensagem pro bot
- Cheque os logs: `openclaw gateway logs`
- O ID aparece nas mensagens recebidas

> 🔴 **ALERTA no curso:** Se dmPolicy estiver "open", QUALQUER PESSOA que encontrar seu bot pode comandar seu agente. Isso é um risco de segurança gravíssimo. Mostrar isso no vídeo com ênfase.

---

## Passo 8: Primeiro teste (1 min)

Envie uma mensagem pro bot no Telegram:

> "Oi! Me diz quem você é e o que pode fazer."

Se o agente responder → **SETUP COMPLETO!** 🎉

---

## Checkpoint do Módulo 1

- [ ] VPS rodando na Hostinger (Ubuntu 24.04)
- [ ] OpenClaw instalado (bare metal, não Docker)
- [ ] Gateway rodando como serviço (24/7)
- [ ] Bot do Telegram criado e conectado
- [ ] dmPolicy = allowlist (segurança básica)
- [ ] Primeiro "oi" respondido ✅

---

## Troubleshooting Comum

### "Command not found: openclaw"
```bash
# Recarregar o PATH
source ~/.bashrc
# Ou reinstalar
curl -fsSL https://openclaw.ai/install.sh | bash
```

### "API key inválida"
- Verificar se tem billing ativo na Anthropic
- Copiar a key novamente (sem espaços extras)

### "Bot não responde no Telegram"
```bash
# Ver logs
openclaw gateway logs
# Verificar status
openclaw gateway status
```

### "Gateway não inicia"
```bash
# Checar porta
ss -tlnp | grep 18789
# Reiniciar
openclaw gateway restart
```

---

## Quanto custa?

| Item | Custo mensal |
|------|-------------|
| VPS Hostinger (KVM 1) | ~$5-10/mês |
| API Anthropic (uso moderado) | ~$10-30/mês |
| Telegram | Grátis |
| **Total** | **~$15-40/mês** |

> 💡 **Dica pro curso:** "Menos que um almoço por semana pra ter um assistente AI 24/7"

---

*Este é o módulo mais técnico. Depois daqui, é só configurar o agente — e isso é a parte divertida.* 🍇
