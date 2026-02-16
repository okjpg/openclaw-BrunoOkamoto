# PRD: Security Hardening do OpenClaw

> Jogue este arquivo no chat do seu agente e diga: "Executa este PRD de segurança"
> Ele vai blindar seu servidor seguindo cada passo.

## Contexto

Servidores OpenClaw expostos na internet recebem 1.000+ tentativas de brute force por dia. Sem proteção, qualquer pessoa pode acessar seu agente e seus dados.

## Tarefas (executar na ordem)

### 1. Telegram Allowlist (CRÍTICO)

Verificar se o OpenClaw está configurado com `dmPolicy: "allowlist"` e que APENAS os IDs autorizados estão na lista.

```bash
# Verificar config atual
cat /root/.openclaw/openclaw.json | grep -A5 dmPolicy
```

Se estiver "open", mudar IMEDIATAMENTE para "allowlist" com os IDs corretos.

### 2. Firewall (UFW)

```bash
# Instalar e configurar
sudo apt install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw --force enable
sudo ufw status
```

### 3. Fail2ban (proteção SSH)

```bash
# Instalar
sudo apt install -y fail2ban

# Configurar
sudo cat > /etc/fail2ban/jail.local << 'EOF'
[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 5
bantime = 3600
findtime = 600
EOF

# Ativar
sudo systemctl enable fail2ban
sudo systemctl restart fail2ban

# Verificar
sudo fail2ban-client status sshd
```

### 4. Cloudflare Tunnel (acesso remoto seguro)

Usar Cloudflare Tunnel pra expor serviços web (Mission Control, dashboards) sem abrir portas:

```bash
# Instalar cloudflared
curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb -o cloudflared.deb
sudo dpkg -i cloudflared.deb

# Autenticar
cloudflared tunnel login

# Criar tunnel
cloudflared tunnel create meu-tunnel

# Configurar (exemplo pra app na porta 3000)
cat > ~/.cloudflared/config.yml << 'EOF'
tunnel: meu-tunnel
credentials-file: /root/.cloudflared/<TUNNEL_ID>.json

ingress:
  - hostname: app.meudominio.com
    service: http://127.0.0.1:3000
  - service: http_status:404
EOF

# Rodar como serviço
cloudflared service install
systemctl enable cloudflared
systemctl start cloudflared
```

**Por que:**
- Zero portas expostas na internet — tunnel faz conexão de SAÍDA
- Servidor fica "invisível" (sem IP público exposto)
- SSL/TLS automático pelo Cloudflare
- Proteção DDoS gratuita inclusa
- NUNCA usar `0.0.0.0` — sempre `127.0.0.1` + tunnel

### 5. Portas de aplicação

Se tiver aplicações web rodando (Mission Control, dashboards, etc.):
- Mudar binding de `0.0.0.0` para `127.0.0.1`
- Usar Cloudflare Tunnel (acima) para acesso externo
- NUNCA expor portas direto na internet

### 6. SSH Hardening

```bash
# Verificar se root login com senha está ativo
grep "PermitRootLogin" /etc/ssh/sshd_config
```

Ideal: `PermitRootLogin prohibit-password` (só SSH key, sem senha)

### 7. Credenciais: Auditar e Corrigir

**O problema:** Muita gente coloca API keys direto nos arquivos de configuração (ex: `openclaw.json`, scripts, `.md`). Se alguém acessa seu servidor, pega TODAS as suas chaves de uma vez.

**Passo 1 — Auditar (descobrir se tem chaves expostas):**

```bash
# Escanear TODOS os arquivos procurando chaves hardcodadas
# Isso procura padrões comuns de API keys
grep -r -n -I \
  -e "sk-[a-zA-Z0-9]" \
  -e "ANTHROPIC_API_KEY.*=.*['\"]" \
  -e "OPENAI_API_KEY.*=.*['\"]" \
  -e "TELEGRAM.*TOKEN.*=.*['\"]" \
  -e "api[_-]key.*:.*['\"]" \
  -e "token.*:.*['\"]sk-" \
  -e "Bearer sk-" \
  --include="*.json" --include="*.md" --include="*.js" --include="*.sh" --include="*.yml" --include="*.yaml" \
  /root/.openclaw/ 2>/dev/null
```

Se aparecer qualquer resultado → tem chave exposta. Não entre em pânico, vamos corrigir.

**Passo 2 — Mover tudo pro .env:**

O `.env` é o ÚNICO lugar onde chaves devem ficar. Ele fica na raiz do OpenClaw:

```bash
# Editar o arquivo .env
nano /root/.openclaw/.env
```

Formato (um por linha, sem aspas, sem espaços ao redor do =):
```
ANTHROPIC_API_KEY=sk-ant-sua-chave-aqui
OPENAI_API_KEY=sk-sua-chave-aqui
TELEGRAM_BOT_TOKEN=123456:ABC-seu-token-aqui
```

**Passo 3 — Remover as chaves dos arquivos:**

Depois de colocar no `.env`, remover de onde estavam antes:

```bash
# Exemplo: se tinha chave no openclaw.json
# Abrir o arquivo e APAGAR a linha com a chave
nano /root/.openclaw/openclaw.json
# O OpenClaw lê automaticamente do .env, não precisa mais no JSON
```

**Passo 4 — Proteger o .env:**

```bash
# Só o root pode ler o .env
chmod 600 /root/.openclaw/.env

# Verificar que ficou certo (deve mostrar -rw-------)
ls -la /root/.openclaw/.env
```

**Passo 5 — Rodar o audit de novo pra confirmar:**

```bash
# Mesmo comando de antes — agora NÃO deve retornar nada
grep -r -n -I \
  -e "sk-[a-zA-Z0-9]" \
  -e "ANTHROPIC_API_KEY.*=.*['\"]" \
  -e "OPENAI_API_KEY.*=.*['\"]" \
  -e "TELEGRAM.*TOKEN.*=.*['\"]" \
  --include="*.json" --include="*.md" --include="*.js" --include="*.sh" \
  /root/.openclaw/ 2>/dev/null | grep -v ".env"
```

Se não retornar nada → tudo limpo ✅

**Rotação trimestral:** A cada 3 meses, gerar novas chaves nos painéis (Anthropic, OpenAI, Telegram) e atualizar o `.env`. Agendar lembrete no calendário pra não esquecer.

### 8. Sync systemd + .env (armadilha comum!)

Quando trocar qualquer credencial, atualizar em AMBOS os lugares:

```bash
# 1. Atualizar o .env
nano /root/.openclaw/.env

# 2. Atualizar o override do systemd (se existir)
sudo systemctl edit openclaw
# Adicionar/atualizar as variáveis em [Service] Environment=

# 3. Recarregar e reiniciar
sudo systemctl daemon-reload
sudo systemctl restart openclaw
```

**Por que:** O systemd override tem prioridade sobre o `.env`. Se trocar só o `.env`, o valor antigo do override continua valendo. Muita gente perde horas debugando isso.

## Checklist Final

- [ ] dmPolicy = allowlist
- [ ] UFW ativo
- [ ] Fail2ban ativo
- [ ] Cloudflare Tunnel configurado (se tiver web apps)
- [ ] Portas em 127.0.0.1 (não 0.0.0.0)
- [ ] SSH hardened (key-only)
- [ ] Credenciais no 1Password (zero hardcode)
- [ ] Rotação trimestral agendada
- [ ] systemd + .env sincronizados

## Resultado Esperado

Servidor blindado contra os ataques mais comuns. **9 camadas de proteção** ativas. Reportar status de cada item.
