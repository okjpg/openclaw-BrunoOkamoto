# 🔬 Use Case: Deep Research

> Pesquisa profunda sobre qualquer tópico com múltiplas fontes.

## O que faz

Spawna sub-agentes que pesquisam em paralelo e consolida tudo:
- Busca na web (Brave, Perplexity)
- Análise de papers e artigos longos
- Monitoramento de concorrentes
- Comparação de ferramentas/soluções
- Resumo executivo com recomendações

## Prompt

```
Faça uma pesquisa profunda sobre [TÓPICO].

Quero que você:
1. Pesquise em pelo menos 5 fontes diferentes (web, papers, artigos, discussões)
2. Analise os pontos de vista diferentes (prós, contras, debates)
3. Identifique tendências e o que está mudando
4. Compare as principais soluções/abordagens
5. Me dê uma recomendação baseada no meu contexto

Formato do output:
- **Resumo executivo** (3 parágrafos, pra quem tem pressa)
- **Análise detalhada** (por fonte, com links)
- **Comparativo** (tabela se aplicável)
- **Recomendação** (o que EU deveria fazer, considerando meu perfil)
- **Fontes** (links pra eu aprofundar se quiser)

Use thinking mode pra isso — quero qualidade, não velocidade.
```

## Variações

### Pesquisa de concorrentes
```
Pesquise meus concorrentes: [LISTA].
Pra cada um, me diga: preço, features, pontos fortes, pontos fracos, o que postaram recentemente, e onde eu tenho vantagem.
```

### Preparação para entrevista/podcast
```
Vou entrevistar [PESSOA]. Pesquise tudo sobre ela: trajetória, projetos, opiniões polêmicas, conteúdos recentes. Me dê 10 perguntas que NINGUÉM fez ainda.
```

### Análise de tendências
```
Quais são as tendências emergentes em [NICHO] para os próximos 6 meses? Pesquise newsletters, Twitter, Reddit, e HN. Me dê as 5 tendências com mais sinal.
```
