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

### 4. Portas de aplicação (se tiver web apps)

Se tiver aplicações web rodando (Mission Control, dashboards, etc.):
- Mudar binding de `0.0.0.0` para `127.0.0.1`
- Usar Cloudflare Tunnel ou Nginx reverse proxy para acesso externo
- NUNCA expor portas direto na internet

### 5. SSH Hardening

```bash
# Verificar se root login com senha está ativo
grep "PermitRootLogin" /etc/ssh/sshd_config
```

Ideal: `PermitRootLogin prohibit-password` (só SSH key, sem senha)

### 6. Credenciais

- NUNCA hardcodar API keys em arquivos
- Usar 1Password CLI (`op`) ou variáveis de ambiente
- Rotação trimestral de chaves sensíveis

## Checklist Final

- [ ] dmPolicy = allowlist ✅
- [ ] UFW ativo ✅
- [ ] Fail2ban ativo ✅
- [ ] Portas não expostas ✅
- [ ] SSH hardened ✅
- [ ] Credenciais seguras ✅

## Resultado Esperado

Servidor blindado contra os ataques mais comuns. Reportar status de cada item.
