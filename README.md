# Template LaTeX para Trabalhos Acadêmicos (ABNT)

Um modelo de projeto $\LaTeX$ completo e pronto para uso, destinado à elaboração de trabalhos acadêmicos como teses, dissertações e monografias, em estrita conformidade com as normas da ABNT.

Este projeto utiliza a classe `abnTeX2` e o sistema de bibliografia `biblatex-abnt`  para garantir a máxima fidelidade às normas, permitindo que o autor se concentre exclusivamente no conteúdo do seu trabalho.

## Visualização

O template gera um documento elegante, com tipografia profissional e todos os elementos pré e pós-textuais exigidos pela ABNT, pronto para impressão ou submissão digital.


## Principais Funcionalidades

- **✔ Totalmente compatível com a ABNT:** Baseado na classe `abnTeX2`, uma referência na comunidade acadêmica brasileira.
- **✍ Foco no Conteúdo:** A filosofia do projeto é separar o conteúdo da formatação. Escreva seus capítulos em arquivos `.tex` dedicados e deixe que o template cuide do resto.
- **📚 Gerenciamento de Bibliografia Moderno:** Utiliza `biblatex` com `biber`, permitindo um controle robusto e flexível das citações e referências.
- **⚙ Estrutura Modular e Organizada:** A separação em diretórios (`chapters`, `includes`, `bib`, `img`) torna o projeto limpo e fácil de manter, mesmo para documentos extensos.
- **🎓 Exemplos Didáticos Reais:** O modelo é preenchido com uma tese fictícia que demonstra o uso de recursos essenciais:
   - **Capítulo 1:** Uma introdução histórica real sobre $\TeX$ e $\LaTeX$.
   - **Capítulos 2, 3 e 4:** Exemplos práticos aplicados a diversas áreas (Química, Físico-Química, IA, Física), com uso intensivo de equações, figuras, tabelas e citações para você consultar e aprender.

## Pré-requisitos

Para compilar este projeto, você precisará de uma distribuição $\LaTeX$ completa instalada em seu sistema. Recomenda-se:

- Distribuição $\LaTeX$:
   - [MiKTeX](https://miktex.org/) (mais amigável de usar);
   - [TeX Live](https://www.tug.org/texlive/) (mais previsível e melhor para automação);
   - [MacTeX](https://www.tug.org/mactex/) (para macOS).
- O backend de bibliografia [Biber](https://ctan.org/pkg/biber) (geralmente incluído no TeX Live e MacTeX).
- Um editor de $\LaTeX$, como o [Visual Studio Code](https://code.visualstudio.com/) com a extensão [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop), ou o [TeXstudio](https://www.texstudio.org/).

## Como Utilizar

1.  **Clone ou baixe** este repositório.
2.  **Configure seus dados:** Abra o arquivo `includes/preamble.tex` e preencha os metadados do seu trabalho (título, autor, orientador, instituição, etc.).
3.  **Escreva seu conteúdo:** Apague os arquivos de exemplo no diretório `chapters/` e crie seus próprios arquivos `.tex` para cada capítulo. Lembre-se de incluí-los no arquivo principal `main.tex`.
4.  **Adicione suas referências:** Coloque seu arquivo `.bib` (ou múltiplos arquivos) no diretório `bib/`. O template está configurado para carregar todos os arquivos `.bib` que encontrar nesse diretório.
5.  **Insira suas imagens:** Adicione seus arquivos de imagem (PNG, JPG, PDF) no diretório `img/`.

## Compilação

Para garantir que todas as referências cruzadas (figuras, tabelas), citações e a bibliografia sejam geradas corretamente, o projeto deve ser compilado na seguinte sequência:

```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

A maioria dos editores de $\LaTeX$ modernos, como o VS Code com a extensão [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop), automatiza esse processo com um único comando de compilação.

## Estrutura do Projeto

A organização dos arquivos foi pensada para ser intuitiva e escalável:

```
.
├── main.tex            # Arquivo principal que une todo o documento.
├── main.pdf            # O resultado final compilado.
├── README.md           # Este arquivo.
│
├── bib/                # Coloque seus arquivos .bib aqui.
│   └── references.bib
│
├── chapters/           # O conteúdo do seu trabalho. Cada capítulo em um arquivo.
│   ├── intro.tex
│   ├── exemplos.tex
│   └── instrucoes.tex
│
├── img/                # Armazene todas as suas imagens aqui.
│   └── ...
│
└── includes/           # Configuração e estrutura do template.
    ├── preamble.tex      # Pacotes, metadados e configurações globais.
    ├── pretextual.tex    # Gerencia os elementos pré-textuais (capa, listas, etc.).
    ├── postextual.tex    # Gerencia os elementos pós-textuais (apêndices, anexos).
    └── custom-commands.tex # Defina seus próprios comandos aqui.
```

## Agradecimentos

Este modelo só é possível graças ao trabalho voluntário e à dedicação da comunidade de software livre. Um agradecimento especial:

- Aos desenvolvedores do **LaTeX**, por um sistema robusto de qualidade tipográfica inigualável.
- À equipe do projeto **abnTEX2**, pela excelência na implementação das normas da ABNT, possibilitando a criação de trabalhos elegantes e padronizados.

## Licença

Este projeto é distribuído sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.
