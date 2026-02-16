# 🔒 10 Regras Invioláveis

> Lições destiladas de 13 dias rodando agentes AI em produção. Quebre qualquer uma e vai sentir.

---

## 1. SEMPRE usar `isolated` + `agentTurn` pra crons

**Regra:** Todo cron deve usar `sessionTarget: "isolated"` + `payload.kind: "agentTurn"` + `delivery: { mode: "announce" }`.

**Por quê:** `systemEvent` + `main` dispara com `status: "ok"` mas `durationMs` é ~0ms — ou seja, não executa nada. Esse bug sozinho travou nossos crons por 3 dias.

**Se quebrar:** Crons parecem funcionar mas nada acontece. Você perde confiança no sistema inteiro.

---

## 2. NUNCA hardcodar credenciais

**Regra:** Todas as API keys, tokens e senhas vivem no `.env` (ou 1Password). Zero exceções.

**Por quê:** Se alguém acessa seu servidor (e vão tentar — 1.000+ brute force/dia), pega TODAS as suas chaves de uma vez. O `.env` com `chmod 600` é a última linha de defesa.

**Se quebrar:** Um vazamento = todas as suas contas comprometidas.

---

## 3. `dmPolicy: allowlist` desde o Dia 1

**Regra:** Antes de fazer qualquer outra coisa, configurar allowlist com seu Telegram ID. Nunca deixar "open".

**Por quê:** Com dmPolicy "open", qualquer pessoa que encontrar seu bot pode comandar seu agente — ler seus arquivos, enviar emails, acessar suas integrações.

**Se quebrar:** Estranhos controlando seu agente com acesso a tudo que ele tem.

---

## 4. Extrair lições ANTES de cada compactação

**Regra:** Antes de CADA compactação de sessão, o agente deve extrair: lições → `lessons.md`, decisões → `decisions.md`, pendências → `pending.md`.

**Por quê:** Compactação descarta 80% do contexto. Se não extrair antes, informações valiosas desaparecem pra sempre. É como formatar o HD sem fazer backup.

**Se quebrar:** Agente perde memória de decisões, erros e aprendizados. Volta a cometer os mesmos erros.

---

## 5. Todo agente novo começa L1 (Observer)

**Regra:** Nenhum agente ganha autonomia sem histórico. L1 = output sempre revisado. Promoção via performance review semanal.

**Por quê:** Agentes sem supervisão "rusham" — entregam rápido mas com qualidade baixa. O Content Agent do Kevin Simback caiu de L3 → L2 quando começou a cortar caminho.

**Se quebrar:** Agentes tomando decisões erradas sem supervisão. Danos silenciosos que você só descobre dias depois.

---

## 6. Split de modelos: Sonnet pra crons, Opus pra interação, Haiku pra heartbeats

**Regra:** Nem toda tarefa precisa do modelo mais caro. Crons de execução em Sonnet. Heartbeats em Haiku (ou Ollama local). Só interação direta e análise estratégica em Opus.

**Por quê:** A diferença é brutal: ~$0.005/heartbeat em Haiku vs ~$0.10 em Opus. Com 17 crons/dia, o split economiza ~75-80% do custo mensal.

**Se quebrar:** Conta da API dispara pra $100-150/mês quando poderia ser $18-36.

---

## 7. Backup antes de mudanças estruturais

**Regra:** Antes de criar agentes, modificar gateway config, ou reorganizar workspace: salvar config + criar ROLLBACK.md com instruções de reversão.

**Por quê:** `config.patch` reinicia o gateway e mata crons em execução. Um erro de config pode derrubar tudo. Com backup, você reverte em 30 segundos.

**Se quebrar:** Servidor fora do ar sem saber como voltar ao estado anterior.

---

## 8. Sub-agent travou → retry 2x → avisar humano (NUNCA limbo silencioso)

**Regra:** Todo sub-agent spawnado DEVE ter follow-up. Sucesso = resumo pro usuário. Falha = retry automático (2x). Falhou 2x = alerta imediato. Nunca "fire and forget".

**Por quê:** Sub-agents podem travar silenciosamente. Sem follow-up, tarefas caem no limbo e ninguém fica sabendo. Você acha que foi feito, mas não foi.

**Se quebrar:** Tarefas perdidas no limbo. Descobertas dias depois quando já era tarde.

---

## 9. SOUL.md genérico = agente genérico

**Regra:** Investir tempo REAL na personalidade do agente. Anti-patterns com exemplos ❌/✅. "Never dos" explícitos. Inspirational anchors. Contexto profundo no USER.md (400+ linhas ideal).

**Por quê:** A diferença entre um SOUL.md genérico e um personalizado é absurda — é o que separa "chatbot" de "COO". O agente só é tão bom quanto o contexto que você dá.

**Se quebrar:** Respostas genéricas, sem opinião, sem personalidade. Basicamente um ChatGPT caro.

---

## 10. Creators são skills, não agentes

**Regra:** LinkedIn Creator, Newsletter Writer, Instagram Caption — são prompts/skills DENTRO de um agente. 1 agente com 8 skills > 8 agentes especializados.

**Por quê:** Cada agente extra = mais custo, mais coordenação, mais pontos de falha. Skills dentro de um agente compartilham contexto, memória e aprendizados. Agentes separados começam do zero.

**Se quebrar:** Custo multiplicado, coordenação caótica, cold starts constantes, aprendizado fragmentado.

---

## Bônus: As 3 regras operacionais

- **Espaçar crons por 15-30 min** — colisão = rate limit
- **`config.patch` em horário sem crons** — reinicia gateway e mata crons rodando
- **`systemEvent` não notifica no Telegram** — usar `agentTurn` + `message send` pra lembretes

---

*Destilado de 13 dias de produção real. Cada regra foi aprendida na dor. 🍇*
