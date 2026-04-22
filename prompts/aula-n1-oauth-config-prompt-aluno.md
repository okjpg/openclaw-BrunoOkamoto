# Prompt do Aluno — Aula N-1: Configurar API Key

> **Como usar:** Copie o prompt abaixo e cole no chat do seu agente OpenClaw após assistir a aula.
>
> ⚠️ **Nota:** Esta aula configura credenciais no OpenClaw. O caminho recomendado é **ChatGPT OAuth** (1 clique, usa sua assinatura existente). Também mostra API Key direta como alternativa.

---

## 📋 Prompt Principal

```
Olá! Acabei de assistir a aula N-1 do curso OpenClaw sobre configuração de API Keys. 

Preciso da sua ajuda para:
1. Verificar se minha configuração está correta
2. Fazer os exercícios práticos da aula
3. Resolver qualquer problema que encontrar

Vamos começar com um diagnóstico completo da minha configuração?
```

---

## 🧪 Exercício 1 — Diagnóstico da Configuração

```
Por favor, faça um diagnóstico completo da minha configuração atual do OpenClaw:

1. Execute `openclaw status` e me mostre o resultado
2. Identifique quais providers estão configurados (OpenAI/ChatGPT, Anthropic, Google, etc.)
3. Para cada provider, verifique se o status é "Connected"
4. Me diga se há algum problema ou alerta

Após o diagnóstico, me explique o que cada parte do output significa.
```

---

## 🔑 Exercício 2 — Configurar API Key (fluxo principal)

```
Quero configurar minha API Key no OpenClaw usando o fluxo correto.

Por favor, me guie pelo processo:
1. Me explique a diferença entre ChatGPT/OpenAI via OAuth, OpenAI API Key e OpenRouter — quando uso cada um?
2. Me guie para obter minha API Key da OpenAI (platform.openai.com)
3. Configure a key no OpenClaw usando o fluxo atual mais seguro
4. Se fizer sentido, me explique como adicionar OpenRouter depois para testar outros LLMs
5. Confirme que está funcionando com `openclaw status`

Importante: Não hardcode a key em nenhum arquivo de código ou .env — use o config do OpenClaw ou `openclaw secrets`.
```

---

## 🔍 Exercício 3 — Verificação de Segurança das Credenciais

```
Quero verificar se minhas credenciais estão armazenadas de forma segura.

Por favor:
1. Execute `openclaw secrets audit` para verificar se há credenciais expostas
2. Verifique as permissões do arquivo ~/.openclaw/config.json (deve ser 600)
3. Se estiver em um projeto git, verifique se config.json está no .gitignore
4. Confirme que NÃO há API keys hardcodadas em arquivos de código ou .env

Se houver algum problema, use `openclaw secrets apply` para migrar as credenciais para o local correto.
```

---

## 🔗 Exercício 4 — Teste Real de Conectividade

```
Agora vamos testar se as credenciais funcionam de verdade, não só se estão configuradas.

Por favor, faça um teste real:
1. Tente uma chamada simples à API da OpenAI (se configurada)
2. Confirme qual modelo está sendo usado
3. Me mostre o resultado — seja sucesso ou erro específico

Se o teste falhar, me ajude a diagnosticar o problema com detalhes.
```

---

## 🚨 Exercício 5 — Troubleshooting Guiado (use se tiver problemas)

```
Estou com um problema na minha configuração. 

[DESCREVA SEU ERRO AQUI — por exemplo:]
- "Aparece 'Invalid API Key' quando tento usar o Claude"
- "openclaw status mostra 'Not configured'"
- "Aparece 'Unauthorized' ou '401' ao testar"
- "A key foi aceita mas o modelo não responde"

Preciso de ajuda para resolver isso passo a passo. Por favor:
1. Explique o que esse erro significa
2. Me dê os passos exatos para resolver
3. Me ajude a verificar se funcionou após cada passo
```

---

## 📊 Exercício 6 — Entendendo Rate Limits vs Credencial Inválida

```
Quero entender a diferença entre rate limit e credencial inválida na prática.

Por favor, me explique:
1. Como identificar um erro de rate limit (qual mensagem, qual HTTP status)
2. Como identificar um erro de credencial inválida (qual mensagem, qual HTTP status)
3. O que fazer em cada caso
4. Como verificar meu plano/cota atual nos providers que configurei

Também quero saber: existe algum comando do OpenClaw para ver meu uso atual de tokens/requisições?
```

---

## 🔄 Exercício 7 — Reconfiguração (se precisar trocar a chave)

```
Quero praticar o processo de reconfiguração, como se precisasse trocar minha API Key.

Por favor, me guie pelo processo completo:
1. Como rotacionar (substituir) uma API Key sem interromper o serviço
2. Qual comando usar para atualizar as credenciais no OpenClaw
3. Como verificar que a nova chave está funcionando
4. Boas práticas: usar `openclaw secrets` para armazenar, nunca colocar em .env ou código

Não precisa executar de verdade — só me explique o processo passo a passo.
```

---

## ✅ Verificação Final de Aprendizado

```
Para encerrar os exercícios da aula N-1, me faça um quiz rápido com 5 perguntas sobre:
- Diferença entre OAuth, OpenAI API Key e OpenRouter
- Onde as credenciais devem ser armazenadas (spoiler: openclaw secrets ou config)
- Como interpretar o openclaw status
- Como distinguir rate limit de credencial inválida
- Boas práticas de segurança com API Keys

Após eu responder, me dê um feedback detalhado sobre o que acertei e o que preciso revisar.
```

---

## 💡 Dica de Uso

> Se você ainda não configurou suas credenciais e está vendo erros, use este prompt mais direto:

```
Preciso configurar minha API Key do OpenClaw do zero. 
Tenho minha API Key da OpenAI em mãos (obtida em platform.openai.com).

Por favor, me guie passo a passo pelo processo completo, desde o terminal até verificar que está funcionando. Estou usando [Linux/Mac/Windows — escolha um].

Lembre: quero usar API Key diretamente, não OAuth.
```

---

*Prompt para Aula N-1 · Curso OpenClaw · Pixel Educação*
