# Templates de Reports

> Referências de design para reports que o agente pode gerar.

## 📊 Tipos de Reports

### 1. Métricas Semanais
- **Uso:** Resumo semanal de métricas de negócio
- **Formato:** PDF dark mode, gráficos, comparativo semana anterior
- **Dados:** MRR, churn, novos clientes, métricas de redes sociais
- **Exemplo:** Reports ChartMogul da Amora

### 2. Social Media Report
- **Uso:** Performance das redes sociais
- **Formato:** PDF com cards por plataforma
- **Dados:** Followers, engagement rate, top posts, crescimento
- **Plataformas:** Instagram, YouTube, LinkedIn, X/Twitter

### 3. Sponsor Report
- **Uso:** Media kit / proposta para patrocinadores
- **Formato:** PDF premium (dark mode, stats hero, grid)
- **Dados:** Audiência, demographics, use cases, pricing
- **Exemplo:** Sponsor report da Amora (7 páginas, design premium)

### 4. QA Report
- **Uso:** Auditoria de qualidade de projetos
- **Formato:** Markdown → PDF
- **Dados:** Bugs encontrados, severidade, status, recomendações

### 5. Competitive Intelligence
- **Uso:** Análise de concorrentes
- **Formato:** PDF com SWOT, comparativos
- **Dados:** Features, pricing, positioning, gaps

## 🎨 Diretrizes de Design

### Para reports HTML → PDF:
```css
/* Dark mode premium */
body { background: #0d1117; color: #c9d1d9; }
.card { background: #161b22; border: 1px solid #30363d; border-radius: 8px; }
.stat { color: #58a6ff; font-size: 2rem; font-weight: bold; }
.label { color: #8b949e; font-size: 0.85rem; }

/* Accent colors */
.positive { color: #3fb950; }
.negative { color: #f85149; }
.neutral { color: #d29922; }
```

### Estrutura padrão:
1. **Header:** Logo/nome + período + data de geração
2. **Hero stats:** 3-4 métricas de destaque (números grandes)
3. **Seções:** Cards com dados detalhados
4. **Footer:** Fonte dos dados + "Gerado por [Nome do Agente]"

## 💡 Dica

Pra gerar PDFs bonitos sem instalar LaTeX:
1. Agente gera HTML estilizado
2. Abre no browser (Playwright/Puppeteer)
3. Exporta como PDF via browser

Funciona em qualquer servidor sem dependências pesadas.
