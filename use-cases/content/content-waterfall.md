# 🎬 Use Case: Content Waterfall

> Um vídeo vira 10+ peças de conteúdo em múltiplas plataformas.

## O que faz

Pega um vídeo gravado (YouTube, Tella, Loom) e automaticamente gera:
- Post LinkedIn (formato longo, storytelling)
- Thread X/Twitter (5-8 tweets)
- Carrossel Instagram (slides com design)
- Newsletter (formato editorial)
- Reels/Shorts (roteiro de 60s)
- Tweets avulsos (insights isolados)

## Como a Amora faz isso

1. Transcreve o vídeo (Whisper API ou Apify)
2. Extrai os insights principais
3. Adapta pra cada plataforma (tom, formato, limitações)
4. Gera todas as peças
5. Agenda publicação (Late API ou manual)

## Prompt

```
Acabei de gravar um vídeo sobre [TEMA]. Aqui está a transcrição:

[COLE A TRANSCRIÇÃO OU LINK DO VÍDEO]

Quero que você aplique o Content Waterfall:

1. Extraia os 5-7 insights principais do vídeo
2. Gere as seguintes peças de conteúdo:
   - 1 post LinkedIn (formato storytelling, 1200-1500 caracteres, gancho forte na primeira linha)
   - 1 thread X/Twitter (5-8 tweets, primeiro tweet é o gancho)
   - 1 roteiro de Reel/Short (60 segundos, formato: hook + conteúdo + CTA)
   - 1 bloco de newsletter (formato editorial, 300-500 palavras)
   - 3 tweets avulsos (insights isolados, cada um independente)

Regras:
- Use MEU tom de voz (consulte USER.md)
- Cada plataforma tem formato diferente — adapte
- LinkedIn: profissional mas humano, sem hashtags excessivas
- Twitter: direto, provocativo, opinião forte
- Reel: visual, dinâmico, gancho nos primeiros 3 segundos
- Newsletter: mais profundo, contexto, bastidores

Me mostre todas as peças e pergunte se quer ajustar algo antes de finalizar.
```

## Resultado esperado

De 1 vídeo de 20 minutos → 7+ peças prontas pra publicar em ~10 minutos.

## Dica

Configure um cron pra rodar o waterfall automaticamente toda vez que um novo vídeo é detectado no Tella/YouTube.
