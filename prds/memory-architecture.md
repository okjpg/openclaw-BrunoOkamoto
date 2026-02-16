# PRD: Arquitetura de Memória

> Jogue este arquivo no agente: "Implementa esta arquitetura de memória"

## Contexto

Agentes AI esquecem tudo a cada sessão. Sem memória estruturada, você repete contexto todo dia. Esta arquitetura resolve isso.

## Tarefas

### 1. Criar estrutura de pastas

```
mkdir -p memory
```

### 2. Criar os topic files

Criar os seguintes arquivos em `memory/`:

| Arquivo | Propósito |
|---------|-----------|
| `decisions.md` | Decisões permanentes (nunca perder) |
| `lessons.md` | Lições aprendidas, erros, padrões |
| `projects.md` | Projetos ativos, em andamento, concluídos |
| `people.md` | Equipe, parceiros, contatos |
| `pending.md` | Aguardando input do usuário |

Cada arquivo deve ter header com propósito e formato.

### 3. Criar MEMORY.md (índice)

Na raiz do workspace, criar `MEMORY.md` como índice que aponta pros topic files. NÃO duplicar conteúdo — apenas referenciar.

### 4. Configurar ciclo de memória

Adicionar no AGENTS.md as seguintes regras:

1. **Notas diárias:** A cada sessão relevante, criar `memory/YYYY-MM-DD.md` com registro raw
2. **Consolidação periódica:** A cada poucos dias, consolidar notas em topic files
3. **Extração na compactação:** ANTES de cada compactação, extrair lições e decisões
4. **Retenção de lições:**
   - 🔒 Estratégicas = permanentes
   - ⏳ Táticas = expiram em 30 dias
   - Revisão mensal

### 5. Configurar feedback loops (opcional, avançado)

Criar `memory/feedback/` com JSONs por domínio:

```json
{
  "entries": [
    {
      "date": "2026-02-13",
      "context": "Sugeri formato X para post LinkedIn",
      "decision": "reject",
      "reason": "Tom muito formal",
      "tags": ["linkedin", "tom"]
    }
  ]
}
```

Domínios sugeridos: `content.json`, `tasks.json`, `recommendations.json`

## Resultado Esperado

Memória estruturada funcionando. Testar pedindo ao agente algo que ele deveria "lembrar" de uma sessão anterior.
