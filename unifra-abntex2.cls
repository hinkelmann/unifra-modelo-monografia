%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%
%%                                                          %%
%%              tfg.tex - v0.04 Hinkelmann                  %%
%%                                                          %%
%% Unifra - Centro Universitário Franciscano                %%
%% Modelo de Trabalho acadêmico                             %%
%%                                                          %%
%% Guilherme Hinkelmann <guilherme@hinkelmann.com.br>       %%
%%                                                          %%
%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%% 
%%
%% Customizações do abnTeX2 (http://abnTeX2.googlecode.com)
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is 
%% Guilherme Hinkelmann, guilherme@hinkelmann.com.br
%% Further information about abnTeX2 are available on 
%% http://abntex2.googlecode.com/
%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%-%%



%========================================================================
% Identificação
%========================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unifra-abntex2}%
              [2013/08/10 v0.1 Classe de Trabalhos Acâdemicos - UNIFRA]

%========================================================================
% Declaração de opções
%========================================================================
% Opções:
%   monografia:     Formata documento para uma monografia
% -----------------------------------------------------------------------

\DeclareOption{monografia}{%
    \def\@tipotrabalho{Trabalho Final de Gradua\c{c}\~ao}
}

\ProcessOptions\relax

%=========================================================================
% Herança da classe `abntex2' e inclusão de pacotes e arquivos necessários
%=========================================================================
\LoadClass[a4paper,12pt,oneside,brazil]{abntex2}

%=========================================================================
% Herança da classe `abntex2' e inclusão de pacotes e arquivos necessários
%=========================================================================
\RequirePackage{ae}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[alf,abnt-emphasize=bf,abnt-repeated-author-omit=yes,abnt-year-extra-label=yes]{abntex2cite}	
\RequirePackage{color}	
\RequirePackage{pifont}
\RequirePackage{lastpage}
\RequirePackage{pdfpages}
\RequirePackage{calc,graphicx}
\RequirePackage{etoolbox}
\RequirePackage{algorithm,algorithmic}
\RequirePackage{nomencl}
\RequirePackage{setspace}
\RequirePackage[none]{hyphenat}
%\RequirePackage{filehook}
\RequirePackage[brazil]{babel}
\RequirePackage[a4paper,top=30mm,left=30mm,right=20mm,bottom=10mm]{geometry}
\RequirePackage[labelfont=bf]{caption}
\counterwithout{equation}{chapter}
\setsecnumdepth{subsubsection}
\settocdepth{subsection}
\newsubfloat{figure}

%=========================================================================
% Configurações de aparência do PDF final
%=========================================================================
% alterando o aspecto da cor azul
\definecolor{blue}{RGB}{41,5,195}

% informações do PDF
\hypersetup{
     	%backref=true,
     	%pagebackref=true,
	%bookmarks=true,         		        % show bookmarks bar?
	pdftitle={\imprimirtitulo}, 
	pdfauthor={\imprimirautor},
    	pdfsubject={\imprimirpreambulo},
	pdfkeywords={PALAVRAS}{CHAVES}{abnt}{abntex}{abntex2},
	pdfproducer={LaTeX with abnTeX2},       % producer of the document
	pdfcreator={\imprimirautor},
    	colorlinks=true,                        % false: boxed links; true colored links
    	linkcolor=black,                        % color of internal links
    	citecolor=black,                        % color of links to bibliography
    	filecolor=magenta,                      % color of file links
	urlcolor=black,
	bookmarksdepth=4
}



%=========================================================================
% Comandos de dados para CAPA e FOLHAS DE ROSTO e APROVAÇÃO 
%=========================================================================

\newcommand{\rev}[1]{\textcolor{red}{[#1]}}
\renewcommand{\labelitemi}{\ding{111}}

%% - Comandos de dados - título do documento em português e inglês
\providecommand{\imprimirtitulo}{}
\newcommand{\@engtitle}{}
\renewcommand{\titulo}[2]{\title{#1}\renewcommand{\imprimirtitulo}{#1} \renewcommand{\@engtitle}{#2}}

%% - Comandos de dados - autor e autorbib
\newcommand{\@authorbib}{}
\providecommand{\imprimirautor}{}
\renewcommand{\autor}[2]{
    \author{#1}
    \renewcommand{
        \imprimirautor}{#1} 
        \renewcommand{\@authorbib}{#2}
}

%% - Comando de dados Nome do Curso
\providecommand{\imprimircursonome}{}
\newcommand{\cursonome}[1]{\renewcommand{\imprimircursonome}{#1}}

%% - Comando de dados  - Grau do Curso
\providecommand{\imprimircursograu}{}
\newcommand{\cursograu}[1]{\renewcommand{\imprimircursograu}{#1}}

%% - Comando de dados - Área do Curso
\providecommand{\imprimircursoarea}{}
\newcommand{\cursoarea}[1]{
    \renewcommand{\imprimircursoarea}{#1}
}

%% - Comando de dados - Professores da banca
\providecommand{\imprimirbancaa}{}
\newcommand{\bancaa}[2]{
    \renewcommand{\imprimirbancaa}{#1  --  Banca (#2)}
}
\providecommand{\imprimirbancab}{}
\newcommand{\bancab}[2]{
    \renewcommand{\imprimirbancab}{#1  --  Banca (#2)}
}
\newcommand{\imprimirinstituicaoorientador}{}
\providecommand{\imprimirorientador}{}
\renewcommand{\orientador}[2]{
    \author{#1}
    \renewcommand{
        \imprimirorientador}{#1} 
        \renewcommand{\imprimirinstituicaoorientador}{#2}
}

%% - Comando de dados de Aprovação
\providecommand{\imprimiraprovacao}{}
\newcommand{\dataaprovacao}[3]{
    \renewcommand{\imprimiraprovacao}{
    \center
    \setlength{\ABNTEXsignwidth}{110mm}
    \assinatura{\normalsize\imprimirorientador  --  Orientador (\imprimirinstituicaoorientador)}\vspace{5mm}%\par\vspace{30mm}
    \assinatura{\normalsize\imprimirbancaa}\vspace{5mm}%\par\vspace{30mm}
    \assinatura{\normalsize\imprimirbancab}%\par
    \vspace*{\fill}
    \centerline{Aprovado em {#1} de {#2} de {#3}}
    }
}

%=========================================================================
% Definição Geral
%=========================================================================
\newcommand{\arquivofolhaaprovacao}{}
\newcommand{\inserirfolhaaprovacao}[1]{\renewcommand{\arquivofolhaaprovacao}{#1}}

\renewcommand{\maketitle}{%
	% Capa
	\imprimircapa
    % Folha de Rosto
	\imprimirfolhaderosto{}
    % Folha de aprovação
	\ifthenelse{\not\equal{\arquivofolhaaprovacao}{}}{
    	\begin{folhadeaprovacao}
    	    \includepdf[pages={1}]{\arquivofolhaaprovacao}
    	\end{folhadeaprovacao}
	}{
        \imprimirfolhadeaprovacao
	}
}

%========================================================================
% Definição da capa, folha de rosto e folha de aprovação.
%========================================================================
% --- Definições de comprimento
\newlength{\largura}\setlength{\largura}{154mm}

\preambulo{ \@tipotrabalho~ apresentado ao Curso de \imprimircursonome – Área de \imprimircursoarea , do \imprimirinstituicao , como requisito parcial para obtenção do grau de \imprimircursograu~ em \imprimircursonome.}

% ---
% Impressão da Capa
% ---
\renewcommand{\imprimircapa}{%
  	\begin{capa}
    	\center
        \@formatacapalogo
        \parbox[t]{\textwidth}{%
            \center
            \vspace*{29mm}
            \@formataautor
            \vspace*{22mm}
            \@formatatitulo
        }
        \par\vspace*{\fill}
    
        \@formatafinaldata
  	\footskip-10mm
      \end{capa}  
      \cleardoublepage
}
%formata o logotipo da instituição
\def\@formatacapalogo{%
    \parbox[t]{\textwidth}{%
        \centerline{\includegraphics[ height=30mm ]{img/logoUnifra.pdf}}
        \par
    }
}
% Formata o titulo da capa
\def\@formatatitulo{%
	\parbox[t][30mm]{\largura}{
        \center
        {\large\textbf{\imprimirtitulo}}
   	}
    \par
}
% Formata o Autor
\def\@formataautor{
    \parbox[t][15mm]{\largura}{    
      	 \center
           {\textbf{\imprimirautor}}
   	}
    \par
}
\def\@formataorientador{
    \parbox[t][15mm]{\largura}{
        \center
        {Orientador: {\imprimirorientador}}
   	}
    \par
}
% Formata o preambulo
\def\@formatapreambulo{%
    \parbox[t][20mm]{\largura}{    
      
          {{\normalsize\imprimirpreambulo}}
   	}
    \par
}
%formata o local e a data
\def\@formatafinaldata{
    \parbox[t][13.6mm]{\largura}{
            \centerline{\imprimirlocal}
            \par 
            \centerline{\imprimirdata}
    }
}
% ---
% Conteudo padrao da Folha de Rosto
% ---
\makeatletter
\renewcommand{\folhaderostocontent}{%

    \begin{folhaderosto}
        \centering
        \noindent
        \@formataautor
        \vspace*{27.5mm}    
        \@formatatitulo
         \vspace*{16mm}    
        \@formatapreambulo
        \vspace*{25mm}
        %\vspace{\fill}
        \@formataorientador
        \vspace*{\fill}
        \@formatafinaldata
    \end{folhaderosto}
}
% ---
% Conteudo padrao da Folha de Aprovação
% ---
\newcommand{\imprimirfolhadeaprovacao}{
    \begin{folhadeaprovacao}
    \centering
   % \noindent
        \@formataautor
        \vspace*{17.5mm}           
        \@formatatitulo
        \vspace*{15mm}    
        \@formatapreambulo
        \vspace*{5mm}
        %\vspace{\fill}
        \imprimiraprovacao
    \end{folhadeaprovacao}
}
% ---
% Dedicatória
% ---
\newcommand{\imprimirdedicatoria}[1]{
	\begin{dedicatoria}
   		\vspace*{\fill}
   		\centering
   		\noindent
   		\textit{#1}
   		\vspace*{\fill}
	\end{dedicatoria}
}
% ---
% Agradecimentos
% ---
\newcommand{\imprimiragradecimentos}[1]{
	\begin{agradecimentos}
		#1
	\end{agradecimentos}
}
% ---
% Epígrafe
% ---
\newcommand{\imprimirepigrafe}[1]{
\begin{epigrafe}
    \vspace*{\fill}
	\begin{flushright}
		\textit{#1}
	\end{flushright}
\end{epigrafe}
}

%========================================================================
% Listas e Sumário
%========================================================================

% ---
% Lista de ilustrações
% ---
\newcommand{\listailustracoes}{
	\pdfbookmark[0]{\listfigurename}{lof}
	\listoffigures*
	\cleardoublepage
}
% ---
% Lista de tabelas
% ---
\newcommand{\listatabelas}{
	\pdfbookmark[0]{\listtablename}{lot}
	\listoftables*
	\cleardoublepage
}
% ---
% Lista de abreviaturas
% ---
\newcommand{\listasiglas}[1]{
	\thispagestyle{empty}
	\pagestyle{empty}
	\pdfbookmark[0]{Lista de siglas}{Lista de siglas} 
	\chapter*{Lista de siglas}
	\input{#1}
	\cleardoublepage
}
% ---
% Lista de algoritmos
% ---
\floatname{algorithm}{Algoritmo}
\renewcommand{\listalgorithmname}{Lista de algoritmos}
\newcommand{\cftalgorithmname}{\algorithmname\space} 
\newcommand{\listaalgoritmos}{
	\pdfbookmark[0]{\listalgorithmname}{loa}
	\thispagestyle{empty}
	\pagestyle{empty}
	\listofalgorithms
	\cleardoublepage
}
% ---
% Lista de símbolos
% ---
\renewcommand{\nompreamble}{\thispagestyle{empty}}
\renewcommand\nomname{Lista de símbolos}
\newcommand{\listasimbolos}{
	\thispagestyle{empty}
	\pagestyle{empty}
	\makenomenclature
	\pdfbookmark[0]{\nomname}{los}
	\printnomenclature
	\cleardoublepage
}
% ---
% Sumário
% ---
\newcommand{\sumario}{%
	\chapter*{SUM\'ARIO}
	\pdfbookmark[0]{\contentsname}{toc}
	\thispagestyle{empty}
	\pagestyle{empty}
	\@starttoc{toc}
	\cleardoublepage
}
%--
% !(Padrão ABNT) do índice da unifra...
%--
%Fix arrumar o espaçamento entre o numero e o titulo do capítulo 

%fontes dos titulos
\renewcommand*{\cftchapterfont}{\normalsize}
\renewcommand*{\cftsectionfont}{\normalsize}
\renewcommand*{\cftsubsectionfont}{\normalsize}
%fonte do numero da pag
\renewcommand*{\cftchapterpagefont}{\normalfont}
\renewcommand*{\cftsectionpagefont}{\normalfont}
\renewcommand*{\cftsubsectionpagefont}{\normalfont}
%
% espaçamento dos titulos

\renewcommand*{\l@section}{\@dottedtocline{1}{0mm}{14mm}}
\renewcommand*{\l@subsection}{\@dottedtocline{2}{0mm}{14mm}}
\renewcommand*{\l@subsubsection}{\@dottedtocline{3}{0mm}{14mm}}
% arruma os pontilhados dos titulos dos capitulos 
\renewcommand*{\cftchapterdotsep}{\cftdotsep}
\renewcommand*{\cftchapterleader}{\cftdotfill{\cftchapterdotsep}}
\setlength{\cftbeforesubsectionskip}{0mm}
\setlength{\cftbeforesectionskip}{0mm}
\setlength{\cftbeforesubsubsectionskip}{0mm}
\setlength{\cftbeforechapterskip}{0mm}


\setlength{\cftchapternumwidth}{14mm}

%========================================================================
% Resumo e Abstract
%========================================================================error
% ---
% Resumo
% ---
\renewenvironment{resumo}[1]{%
	\gdef\@abstractkw{#1}

	\chapter*{RESUMO\hfill} 
	\pdfbookmark[0]{Resumo}{Resumo} 
    \thispagestyle{empty}
    \SingleSpacing
    \setlength{\parindent}{0mm}
}{
   	\par\vspace{5mm}
   	\noindent\textbf{Palavras-chave:} \@abstractkw.
	\thispagestyle{empty} 
    \par\vspace{10mm}
    
}
% ---
% Abstract
% ---
\renewenvironment{abstract}[1]{%
	\gdef\@abstractkw{#1}
	\let\clearpage\relax\chapter*{ABSTRACT\hfill}%\par%
	\pdfbookmark[0]{Abstract}{Abstract} 
    \SingleSpacing
    \setlength{\parindent}{0mm}
}{
   	\par\vspace{5mm}
   	\noindent\textbf{Keywords:} \@abstractkw.
	\thispagestyle{empty}
}
%--
% !(Padrão ABNT) das Ref. Bib. da unifra...
%--
\let\oldbibliography\thebibliography
\renewcommand{\thebibliography}[1]{
    \setlength{\beforechapskip}{3mm}
    \oldbibliography{#1}
    \justificado
    \setlength{\itemsep}{10mm}
    \vspace{10mm}
  
}
%=======================================================================
% Ajuste do cabeçalho e rodapé
%=======================================================================
%Define um novo estilo
\makepagestyle{unifra}
\makeevenhead{unifra}{\ABNTEXfontereduzida\thepage}{}{}
\makeoddhead{unifra}{}{}{\ABNTEXfontereduzida\thepage}
\makeheadrule{unifra}{0mm}{0mm}


\renewcommand{\pretextual}{
    \aliaspagestyle{chapter}{empty}
    \pagestyle{empty}
    \aliaspagestyle{cleared}{empty}
}
\renewcommand{\frontmatter}{\pretextual} 

% Configura o layout de elementos textuais{Introdução-desenvolvimento-conclusão }
\renewcommand{\textual}{
    \pagestyle{unifra} 
    \aliaspagestyle{chapter}{unifra}
    \aliaspagestyle{cleared}{unifra}
}

% Configura layout para elementos pós-textuais
\renewcommand{\postextual}{
    \pagestyle{unifra}
    \aliaspagestyle{chapter}{unifra}
    \aliaspagestyle{cleared}{unifra}
}
%=========================================================================
% Configurações
%=========================================================================
\chapterstyle{unifra}
\renewcommand*{\figureautorefname}{\textbf{Figura}}
\renewcommand*\footnoteautorefname{Nota de Rodapé}%
\renewcommand*\itemautorefname{Item}%
\renewcommand*\tableautorefname{\textbf{Tabela}}%
\renewcommand*\partautorefname{Parte}%
\renewcommand*\appendixautorefname{Apêndice}%
\renewcommand*\chapterautorefname{Capítulo}%
\renewcommand*\sectionautorefname{Seção}%
\renewcommand*\subsectionautorefname{Subseção}%
\renewcommand*\subsubsectionautorefname{Subseção}%
\renewcommand*\paragraphautorefname{Parágrafo}%
\renewcommand*\subparagraphautorefname{Subparágrafo}%
\renewcommand*\FancyVerbLineautorefname{Linha}%
\renewcommand*\theoremautorefname{Teorema}%
\renewcommand*\pageautorefname{Página}%
\renewcommand*\contentsname{SUM\'ARIO}
\addto\captionsbrazil{%
  \renewcommand{\bibname}{\leftskip\z@skip REFER\^ENCIAS BIBlIOGR\'AFICAS}
  \renewcommand{\indexname}{SUM\'ARIO}
}
% --
% Configuração das fontes
% --
% Fonte padrão section, subsection e subsubsection
\renewcommand*{\ABNTEXchapterfont}{\fontfamily{ptm}\bfseries\selectfont}
\renewcommand*{\ABNTEXsectionfont}{\fontfamily{ptm}\selectfont{\normalfont}}

\renewcommand*{\ABNTEXchapterfontsize}{\normalsize}
\renewcommand*{\ABNTEXsectionfontsize}{\normalsize}
\renewcommand*{\ABNTEXsubsectionfontsize}{\normalsize}

% Remove o negrito da secao
\renewcommand\section{
    \@startsection {section}{1}{\z@}
    {-3.5ex \@plus -1ex \@minus -.2ex}%
    {2.3ex \@plus.2ex}%
    {\normalfont}
}
\renewcommand\subsection{
    \@startsection {subsection}{1}{\z@}
    {-3.5ex \@plus -1ex \@minus -.2ex}%
    {2.3ex \@plus.2ex}%
    {\normalfont}
}
\tipotrabalho{\@tipotrabalho}

% ---
% Configurações de espaços
% ---
%%% Recuo do parágrafo:
\setlength{\parindent}{12.5mm}

%% Recuo da citação compensando o \parindent
\setlength{\ABNTEXcitacaorecuo}{28mm}

% Espaçamento após o título do capitulo
\setlength{\afterchapskip}{5mm}

%\ Espaçamento do separador do cabeçalho}
\setlength{\headsep}{0mm}

% Controle do espaçamento entre linhas
\linespread{1.5}
  
%Justifica texto
\newcommand{\justificado}{%
  \rightskip\z@skip%
  \leftskip\z@skip
}


%Contorna os warnings da compilação ref a parágrafos
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000




