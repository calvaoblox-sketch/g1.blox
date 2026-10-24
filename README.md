# BloxG1 🎮

Portal de notícias do universo **Roblox** com identidade visual inspirada no **G1**: paleta limpa (branco, cinza claro, vermelho escuro e preto), tipografia moderna (Roboto/Arial) e layout **100% responsivo**.

## ✨ Funcionalidades

- **Header** com logo `BloxG1`, data e relógio em tempo real e menu de categorias
- **Ticker "Últimas"** com manchetes rolando (pausa no hover)
- **Hero News** com manchete grande e 2 chamadas secundárias
- **Grade de notícias** com blocos sobre jogos populares
- **Jogos em Alta** com ranking e barras de popularidade
- **Promo Codes Ativos** em tabela com status
- **Vídeos & Em Alta** com cards e botão de play
- **Footer** com links institucionais, redes sociais e aviso de direitos autorais

## 📁 Estrutura

```
bloxg1/
├── index.html            # Estrutura e conteúdo da página
├── style.css             # Estilos (variáveis de cor no topo)
├── script.js             # Relógio, ticker e menu mobile
├── generate-images.ps1   # Gera as artes SVG temáticas (pasta /img)
└── img/                  # 14 imagens SVG locais (nunca quebram)
```

## 🚀 Como usar

1. Baixe a pasta do projeto.
2. Abra o arquivo `index.html` no navegador — pronto, não precisa de servidor.

### Recriar as imagens

```powershell
powershell -File generate-images.ps1
```

## 🎨 Personalização

- **Cores:** edite as variáveis em `:root` no topo do `style.css`.
- **Notícias:** duplique um `<article class="news-card">` no `index.html`.
- **Códigos:** duplique uma `<tr>` dentro de `.codes-table`.
- **Imagens reais:** troque o `src` das tags `<img>` pelas suas fotos.

## ⚠️ Aviso

Este projeto não é afiliado, associado ou endossado pela **Roblox Corporation**. Todas as marcas pertencem aos seus respectivos proprietários. Site de exemplo/estudo.
