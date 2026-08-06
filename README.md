# Template LaTeX para Trabalhos Acadêmicos (ABNT)

Um modelo de projeto $\LaTeX$ completo e pronto para uso, destinado à elaboração de trabalhos acadêmicos como teses, dissertações e monografias, em estrita conformidade com as normas da ABNT.

Este projeto utiliza a classe `abnTeX2` e o sistema de bibliografia `biblatex-abnt`  para garantir a máxima fidelidade às normas, permitindo que o autor se concentre exclusivamente no conteúdo do seu trabalho.

## Visualização

O template gera um documento elegante, com tipografia profissional e todos os elementos pré e pós-textuais exigidos pela ABNT, pronto para impressão ou submissão digital.

> [!TIP]
> **Exemplo: [`main.pdf`](https://github.com/hellmrf/monografia-abnt-latex-template/releases/latest/download/main.pdf)**

## Principais Funcionalidades

- **🪄 Compilação Automática com Github Actions:** O projeto será compilado automaticamente sempre que um novo `git push` for enviado (_preview_ temporário) ou sempre que uma nova [_Github Release_](https://docs.github.com/pt/repositories/releasing-projects-on-github/managing-releases-in-a-repository) for publicada (resultado anexado permanentemente à _release_).
- **✍ Foco no Conteúdo:** A filosofia do projeto é separar o conteúdo da formatação. Escreva seus capítulos em arquivos `.tex` dedicados e deixe que o template cuide do resto.
- **✔ Totalmente compatível com a ABNT:** Baseado na classe `abnTeX2`, uma referência na comunidade acadêmica brasileira.
- **📚 Gerenciamento de Bibliografia Moderno:** Utiliza `biblatex` com `biber`, permitindo um controle robusto e flexível das citações e referências.
- **⚙ Estrutura Modular e Organizada:** A separação em diretórios (`chapters`, `includes`, `bib`, `img`) torna o projeto limpo e fácil de manter, mesmo para documentos extensos.
- **🎓 Exemplos Didáticos Reais:** O modelo é preenchido com uma tese fictícia que demonstra o uso de recursos essenciais:
   - **Capítulo 1:** Uma introdução histórica real sobre $\TeX$ e $\LaTeX$.
   - **Capítulos 2, 3 e 4:** Exemplos práticos aplicados a diversas áreas (Química, Físico-Química, IA, Física), com uso intensivo de equações, figuras, tabelas e citações para você consultar e aprender.

## Pré-requisitos

Este projeto está configurado para ser compilado automaticamente via Github Actions. Contudo, ele também está configurado para o fluxo de trabalho _offline_.

### Integração e Entrega Contínuas (Github Actions)

Este repositório está configurado para compilar o projeto automaticamente via [Github Actions](https://docs.github.com/pt/actions/get-started/understand-github-actions). Existem dois meios para disparar uma nova compilação:

#### Preview Temporário

Sempre que novas alterações na _branch_ `main` forem enviadas para o Github (normalmente via `git push origin main`), o fluxo de rascunho (`.github/workflows/draft.yml`) será disparado.

Ele fará a compilação do projeto usando [TeXlive](https://github.com/xu-cheng/texlive-action/tree/v3) e anexará o PDF como artefato do fluxo de trabalho. Por padrão, os artefatos ficarão disponíveis por 15 dias.

Para acompanhar o progresso da compilação ou ver o resultado final, basta verificar a aba [Actions](/actions) do repositório e fazer o _download_ do artefato `latex-preview`.

![](https://i.imgur.com/Tv3Spfj.png)

#### Versão Permanente

Também é possível tornar o resultado permanente publicando uma [_Github Release_](https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases).

Cada nova _Release_ publicada disparará o fluxo de compilação "release" (`.github/workflows/release.yml`), que fará:

1. Criação de uma `git tag` que congela a versão atual do código-fonte do projeto e pode ser recuperada no futuro
2. Compilação do projeto LaTeX
3. Upload do PDF final como artefato do _Release_
4. Atualização da tag `latest` para apontar para a nova versão

O repositório manterá o histórico das _Releases_ publicadas, sendo que cada versão específica conterá o PDF final e o código-fonte exato que gerou aquela compilação. Esse histórico de compilações permite visualizar claramente a evolução do projeto e recuperar qualquer versão antiga. Portanto, **recomendamos publicar _Releases_ com alguma frequência**.

Para publicar uma nova _Release_, siga [estas instruções](https://docs.github.com/pt/repositories/releasing-projects-on-github/managing-releases-in-a-repository#creating-a-release).

### Offline

Para compilar este projeto _offline_, você precisará de uma distribuição $\LaTeX$ completa instalada em seu sistema. Recomenda-se:

- Distribuição $\LaTeX$:
   - [MiKTeX](https://miktex.org/) (mais amigável de usar); ou
   - [TeX Live](https://www.tug.org/texlive/) (mais previsível e melhor para automação); ou
   - [MacTeX](https://www.tug.org/mactex/) (para macOS).
- O backend de bibliografia [Biber](https://ctan.org/pkg/biber) (geralmente incluído no TeX Live e MacTeX).
- Um editor de $\LaTeX$, como o [Visual Studio Code](https://code.visualstudio.com/) com a extensão [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop), ou o [TeXstudio](https://www.texstudio.org/).

## Como Utilizar

1.  Clique em **Usar este template** no Github e crie um novo repositório.
  ![](https://i.imgur.com/adlAwja.png)
2.  **Configure seus dados:** Abra o arquivo `includes/preamble.tex` e preencha os metadados do seu trabalho (título, autor, orientador, instituição, etc.).
3.  **Escreva seu conteúdo:** Apague os arquivos de exemplo no diretório `chapters/` e crie seus próprios arquivos `.tex` para cada capítulo. Lembre-se de incluí-los no arquivo principal `main.tex`.
4.  **Adicione suas referências:** Coloque seu arquivo `.bib` (ou múltiplos arquivos) no diretório `bib/`. O template está configurado para carregar todos os arquivos `.bib` que encontrar nesse diretório.
5.  **Insira suas imagens:** Adicione seus arquivos de imagem (PNG, JPG, PDF) no diretório `img/`.

## Compilação

Este projeto foi pensado para uso com [`latexmk`](https://mgeier.github.io/latexmk.html), que está disponível nas principais distribuições LaTeX. Para compilar o projeto, utilize o comando `latexmk`:

```bash
latexmk
```

Algumas opções estão disponíveis:

```bash
# Limpar arquivos auxiliares
latexmk -c

# Limpar todos os arquivos auxiliares
latexmk -C

# Limpar arquivos auxiliares e compilar em seguida
latexmk -gg
# equivalente a:
latexmk -c && latexmk
```

Configurações avançadas podem ser feitas através do arquivo [`.latexmkrc`](https://docs.overleaf.com/managing-projects-and-files/the-latexmkrc-file).

### Compilação "manual"

Ferramentas como o `latexmk` existem e foram utilizadas neste _template_ porque uma compilação completa de LaTeX não é exatamente determinística. Isso porque ela não é um processo único, mas sim a orquestração de várias ferramentas necessárias para chegar ao produto final.

Esse processo começa sempre com a invocação de um **compilador** LaTeX (como `pdflatex`, `xelatex` ou `lualatex`) e um arquivo principal (por exemplo, `main.tex`). O compilador então fará uma compilação inicial do conteúdo do arquivo `main.tex`, registrando todas as informações relevantes nos chamados arquivos auxiliares (como `main.aux`, `main.log` ou `main.blg`). Em documentos simples, isso pode ser o suficiente para a produção de um PDF final (`main.pdf`).

Contudo, é muito mais frequente que o conteúdo seja dinâmico e dependa do conteúdo posterior (como índices, listas de figuras, enumeração de flutuantes, etc). Como o compilador lê o arquivo `main.tex` de cima para baixo, ele marca que o conteúdo daquelas partes precisa ser preenchido no futuro. Ao final da compilação, quando o conteúdo estiver disponível, os valores serão então salvos nos arquivos de log e o programa chegará ao fim do arquivo `main.tex` e será encerrado.

Nesse momento, todos os valores dinâmicos terão sido registrados nos arquivos de log. Por exemplo, o título de cada seção do documento terá sido registrado e poderá ser usado para a construção de um sumário; cada referência bibliográfica utilizada foi registrada para ser consultada na bibliografia mais tarde.

O próximo passo natural é compilar a bibliografia. Como sabemos todas as vezes que comandos do `biblatex` foram utilizados e todas as referências citadas, podemos usar o `biber` para extrair os dados de cada chave das bases `*.bib` e gerar o conteúdo atualizado das citações e da bibliografia conforme as regras do projeto. Isso será registrado em arquivos log (como `main.blg`, `main.bcf` e `main.bbl`).

Contudo, embora vários logs tenham sido atualizados, o arquivo `main.pdf` que foi produzido ainda não reflete essas mudanças! É necessário, portanto, uma nova compilação. Neste caso, os comandos são:

```bash
pdflatex main.tex
biber main
pdflatex main.tex
```

Neste momento, o `main.pdf` pode estar pronto, ou o compilador pode ter registrado avisos no `log`. Pela dúvida, é comum usar, como padrão, a seguinte cadeia de comandos:

```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

Isso, na maioria das vezes, será suficiente para gerar um `main.pdf` finalizado. É importante sempre verificar os avisos registrados pelo compilador no log (`main.log`) e procurar pelo termo `Please`.

<!-- A maioria dos editores de $\LaTeX$ modernos, como o VS Code com a extensão [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop), automatiza esse processo com um único comando de compilação. -->

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

Este projeto é distribuído sob a licença *LaTeX project public license (LPPL) 1.3c*. O uso é livre para todos os fins e modificações são permitidas, desde que o novo produto seja distribuído publicamente sob a mesma licença e contenha os créditos originais. Veja o arquivo [`LICENSE`](./LICENSE) para mais detalhes.
