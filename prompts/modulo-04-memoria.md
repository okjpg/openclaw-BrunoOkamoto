# Prompt — Módulo 4: Sistema de Memória

> Cole este prompt no chat do seu OpenClaw depois de assistir o Módulo 4.
> Anexe junto os arquivos: `prds/memory-architecture.md`, `templates/MEMORY-template.md`, `templates/HEARTBEAT-template.md` e a pasta `templates/memory/`

---

Acabei de assistir o Módulo 4 do curso sobre memória. Leia o PRD de arquitetura de memória e me guie na implementação.

**O que preciso que você faça:**

1. **Me explique como funciona sua memória** — quero entender o problema (Alzheimer entre sessões) e a solução (memória em camadas)

2. **Crie a estrutura de memória** baseada no PRD:
   - `memory/` com: decisions.md, lessons.md, pending.md, people.md, projects.md
   - MEMORY.md como índice
   - Configurar notas diárias automáticas

3. **Configure a regra de extração antes de compactação** — NUNCA compactar sem extrair lições, decisões e pendências primeiro. Isso é INVIOLÁVEL.

4. **Configure o HEARTBEAT.md** — o que checar periodicamente (emails, calendário, projetos parados)

5. **Configure a compactação** — me explique os tokens de contexto, reserva, e como evitar overflow. Configuração recomendada:
   - contextTokens: 160.000
   - reserveTokensFloor: 30.000 (garante que conclusão de raciocínio não é cortada)

6. **Configure o memory search** — me explique como funciona a busca semântica:
   - `memory_search()` para busca sob demanda (~400 tokens/chunk)
   - `memory_get()` para puxar só o trecho relevante
   - Provider: auto (local GGUF → OpenAI → Gemini → Voyage)
   - Indexar: `openclaw memory index --all`

7. **Configure feedback loops** — JSONs em `feedback/` que capturam approve/reject:
   - O agente consulta ANTES de sugerir novamente
   - Não repete erros — evolução real

**Regras:**
- Me explique cada arquivo e PRA QUE SERVE antes de criar
- Me mostre um exemplo prático de como uma decisão vira memória permanente
- Regra INVIOLÁVEL: antes de CADA compactação, rodar checklist de extração (lessons, decisions, people, projects, pending)
- No final, simule uma compactação pra eu ver o processo funcionando

**Comandos úteis:**
```
openclaw memory search "termo"
openclaw memory index --all
```

Vamos criar sua memória?
