%%
%% This is file `ufopthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ufopthesis.dtx  (with options: `class')
%%
%% This is a generated file.
%%
%% Copyright (C) 2004,2005 by Vilar Camara Neto and Eduardo Nakamura.
%%
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.2 of this license or (at your option) any later
%% version.  The latest version of this license is in:
%%
%%     http://www.latex-project.org/lppl.txt
%%
%% and version 1.2 or later is part of all distributions of
%% LaTeX version 1999/12/01 or later.
%%
%% Currently this work has the LPPL maintenance status "maintained".
%%
%% The Current Maintainer of this work is Vilar Camara Neto.
%%
%% This work consists of the files ufopthesis.dtx and
%% ufopthesis.ins and the derived file ufopthesis.cls.
%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{ufopthesis}
  [2005/07/24 v0.13 DECOM/UFOP class for thesis/dissertations and proposals and monograph]


\RequirePackage{keyval}
\RequirePackage{setspace}

%% General options:

\newif\if@phd                   % phd dissertation option
\newif\if@msc                   % master thesis option
\newif\if@proposal              % proposal/project option
\newif\if@mono                  % phd dissertation option
\newif\if@showcover             % Show cover page?
\newif\if@showtitle             % Show title page?
\newif\if@showapproval          % Show approval sheet?
\newif\if@showabstract          % Show abstract page(s)?
\newif\if@showdedication        % Show dedication page?
\newif\if@showack               % Show acknowledgment page?
\newif\if@showpublication       % Show publication page?
\newif\if@showtoc               % Show Table of Contents?
\newif\if@showlof               % Show List of Figures?
\newif\if@showlot               % Show List of Tables?
\newif\if@showloa               % Show List of Algorithm?  (menotti 2006/11/20)
\newif\if@extraporttitlepage    % Show also a title page in Portuguese?
\newif\if@extrafrenchtitlepage  % Show also a title page in French?
\newif\if@extraitaliantitlepage  % Show also a title page in Italian?
\newif\if@putmainmatter         % Put \mainmatter after TOC/LOF/LOT?

\def\ufop@showall{%
  \@showcovertrue
  \@showtitletrue
  \@showapprovaltrue
  \@showabstracttrue
  \@showdedicationtrue
  \@showacktrue
  \@showpublicationtrue
  \@showtoctrue
  \@showloftrue
  \@showlottrue
}

\def\ufop@hideall{%
  \@showcoverfalse
  \@showtitlefalse
  \@showapprovalfalse
  \@showabstractfalse
  \@showdedicationfalse
  \@showackfalse
  \@showpublicationfalse
  \@showtocfalse
  \@showloffalse
  \@showlotfalse
}

\@proposalfalse
\ufop@showall
\@putmainmattertrue

%% Bibliography options:

\newif\if@bibnorepauthor  % Substitute repeating names by a long line?
\newif\if@nobreakitems    % Dissalow page breaks between lines of each item?

\@bibnorepauthorfalse
\@nobreakitemsfalse

\def\BreakableUppercase#1{%
  \bgroup
  \let\ufop@prevdbs=\\%
  \def\\{\protect\ufop@prevdbs}%
  \MakeUppercase{#1}%
  \egroup
}

\newcommand{\ufop@defspacing}{\onehalfspace}

\def\ufop@redefchaptitlefont{}

\newcommand*{\university}[1]{\gdef\@university{#1}}  % University name
\newcommand*{\course}[1]{\gdef\@course{#1}}          % Course name
\newcommand*{\address}[1]{\gdef\@address{#1}}        % Address

\newcommand*{\advisorT}[1]{\gdef\@advisorT{#1}}      % advisorT
\newcommand*{\coadvisorT}[1]{\gdef\@coadvisorT{#1}}  % coadvisorT

\newcommand*{\degree}[1]{\gdef\@degree{#1}}          % Degree
\newcommand*{\logo}[1]{\gdef\@logo{#1}}              % Logo
\newcommand{\brokentitle}[1]{\gdef\@brokentitle{#1}} % Long broken title
\renewcommand*{\title}[1]                            % Title
  {\gdef\@title{#1}\brokentitle{#1}}

\newcommand*{\portuguesetitle}[1]                    % Pt. title
  {\gdef\@portuguesetitle{#1}\portuguesebrokentitle{#1}}
\newcommand{\portuguesebrokentitle}[1]               % Pt. long broken title
  {\gdef\@portuguesebrokentitle{#1}}
\newcommand*{\portugueseuniversity}[1]               % Pt. university name
  {\gdef\@portugueseuniversity{#1}}
\newcommand*{\portuguesecourse}[1]                   % Pt. course
  {\gdef\@portuguesecourse{#1}}
\newcommand*{\portugueseshortcourse}[1]                   % Pt. course
  {\gdef\@portugueseshortcourse{#1}}

\newcommand*{\frenchtitle}[1]                        % Fr. title
  {\gdef\@frenchtitle{#1}\frenchbrokentitle{#1}}
\newcommand{\frenchbrokentitle}[1]                   % Fr. long broken title
  {\gdef\@frenchbrokentitle{#1}}
\newcommand*{\frenchuniversity}[1]                   % Fr. university name
  {\gdef\@frenchuniversity{#1}}
\newcommand*{\frenchcourse}[1]                       % Fr. course
  {\gdef\@frenchcourse{#1}}

\newcommand*{\italiantitle}[1]                       % It. title
  {\gdef\@italiantitle{#1}\italianbrokentitle{#1}}
\newcommand{\italianbrokentitle}[1]                   % It. long broken title
  {\gdef\@italianbrokentitle{#1}}
\newcommand*{\italianuniversity}[1]                   % It. university name
  {\gdef\@italianuniversity{#1}}
\newcommand*{\italiancourse}[1]                       % It. course
  {\gdef\@italiancourse{#1}}

\DeclareOption{mono}{\@phdfalse\@mscfalse\@monotrue}
\DeclareOption{msc}{\@phdfalse\@msctrue\@monofalse}
\DeclareOption{phd}{\@phdtrue\@mscfalse\@monofalse}
\DeclareOption{proposal}{\@proposaltrue}
\DeclareOption{project}{\@proposaltrue}

\DeclareOption{single}{\renewcommand{\ufop@defspacing}{\singlespace}}
\DeclareOption{onehalf}{\renewcommand{\ufop@defspacing}{\onehalfspace}}
\DeclareOption{double}{\renewcommand{\ufop@defspacing}{\doublespace}}

\DeclareOption{hideall}{\ufop@hideall}
\DeclareOption{hidecover}{\@showcoverfalse}
\DeclareOption{hidetitle}{\@showtitlefalse}
\DeclareOption{hideapproval}{\@showapprovalfalse}
\DeclareOption{hideabstract}{\@showabstractfalse}
\DeclareOption{hidededication}{\@showdedicationfalse}
\DeclareOption{hideack}{\@showackfalse}
\DeclareOption{hidepublication}{\@showpublicationfalse}
\DeclareOption{hidetoc}{\@showtocfalse}
\DeclareOption{hidelof}{\@showloffalse}
\DeclareOption{hidelot}{\@showlotfalse}

\DeclareOption{showall}{\ufop@showall}
\DeclareOption{showcover}{\@showcovertrue}
\DeclareOption{showtitle}{\@showtitletrue}
\DeclareOption{showapproval}{\@showapprovaltrue}
\DeclareOption{showabstract}{\@showabstracttrue}
\DeclareOption{showdedication}{\@showdedicationtrue}
\DeclareOption{showack}{\@showacktrue}
\DeclareOption{showpublication}{\@showpublicationtrue}
\DeclareOption{showtoc}{\@showtoctrue}
\DeclareOption{showlof}{\@showloftrue}
\DeclareOption{showlot}{\@showlottrue}

\DeclareOption{nomainmatter}{\@putmainmatterfalse}

\DeclareOption{centertitles}{%
   \def\ufop@redefchaptitlefont{%
    \expandafter\renewcommand\expandafter{\expandafter\chaptitlefont
    \expandafter}\expandafter{\chaptitlefont\centering}%
  }%
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

\ExecuteOptions{phd,onehalf,showall}
\ProcessOptions

\def\ufop@setdoctype{%
  \if@phd % this is a PhD thesis
    \degree{\ufop@phd}
    \if@proposal
      \gdef\@documenttype{\ufop@phddocproj}%
      \ufop@set@phddocproj
    \else
      \gdef\@documenttype{\ufop@phddoc}%
      \ufop@set@phddoc
    \fi
  \fi  
  \if@msc % this is a MSc dissertation
    \degree{\ufop@msc}
    \if@proposal
      \gdef\@documenttype{\ufop@mscdocprop}%
      \ufop@set@mscdocprop
    \else
      \gdef\@documenttype{\ufop@mscdoc}%
      \ufop@set@mscdoc
    \fi
  \fi
  
  \if@mono % this is a graduate disseration
    \degree{\ufop@mono}
    \if@proposal
      \gdef\@documenttype{\ufop@monodocprop}%
      \ufop@set@monodocprop
    \else
      \gdef\@documenttype{\ufop@monodoc}%
      \ufop@set@monodoc
    \fi
  \fi 
}

\LoadClass{memoir}

\setlrmarginsandblock{3cm}{2.5cm}{*}
\setulmarginsandblock{3cm}{3cm}{*}
\setlength{\cftpartnumwidth}{2em} % menotti (22/11/2006)



\checkandfixthelayout

\maxsecnumdepth{subsubsection}
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{4}

\def\ufop@langgroup{\@ifundefined{languagename}{english}{\languagename}}
\def\ufop@langgroup{\@ifundefined{languagename}{brazil}{\languagename}}
\def\ufop@langgroup{\@ifundefined{languagename}{french}{\languagename}}
\def\ufop@langgroup{\@ifundefined{languagename}{italian}{\languagename}}

\def\ufop@deflanguage#1{%
  \@ifundefined{ufop@lang@#1}{%
    \ClassWarning{ufopthesis}{Language not defined: #1^^J
    Using default language `brazil'.^^J}%
    \def\ufop@langgroup{brazil}}
    {\def\ufop@langgroup{#1}}%
}
\def\ufop@selectlanguage{%
  \csname ufop@lang@\ufop@langgroup\endcsname\ufop@setdoctype
}

\newif\if@ufopdateerror

\newcommand{\ufop@formatdate}[2][]{%
  \begingroup
    \def\ufop@templang{#1}%
    \ifx\ufop@templang\empty\let\ufop@templang\ufop@langgroup\fi
    \expandafter\ufop@parsedate#2---\relax
  \endgroup
}
\def\ufop@parsedate#1-#2-#3-#4\relax{%
  \@ufopdateerrortrue
  \def\ufop@year{\number#1}\def\ufop@month{\number#2}%
  \def\ufop@day{#3}\ifx\ufop@day\empty\else\def\ufop@day{\number#3}\fi
  \ifx\ufop@month\empty\else\ifnum#1>99\relax
    \@ufopdateerrorfalse
    \csname ufop@expanddate@\ufop@templang\endcsname
  \fi\fi
  \if@ufopdateerror
    \ClassError{ufopthesis}{Invalid date format.^^J%
    When using the `date=' option for \string\ufopthesis\space or the
    \string\date\string{...\string} command,^^J%
    always provide the date in the format yyyy-mm-dd or yyyy-mm^^J%
    (note the year-month-day order and the hyphen separator)}%
    \endinput
  \fi
}

\def\ufop@expandmonth@brazil#1{%
  \ifcase\ufop@month\or
  janeiro\or fevereiro\or mar\c{c}o\or abril\or maio\or junho\or
  julho\or agosto\or setembro\or outubro\or novembro\or dezembro\fi
}
\def\ufop@expanddate@brazil{%
  \edef\text@month{\ufop@expandmonth@brazil{\ufop@month}}%
  \ifx\ufop@day\empty\expandafter\MakeUppercase\text@month
    \else \two@digits\ufop@day\ de\ \text@month\fi
  \ de\ \ufop@year
}
\def\ufop@lang@brazil{%
  \@extraporttitlepagefalse

  \def\alg@floatname{\textsc{Alg}}
  \def\alg@listname{Liste des Algorithmes}

  \def\@deflang@title{%
    \@ifundefined{@portuguesetitle}{\@title}{\@portuguesetitle}}
  \def\@deflang@brokentitle{%
    \@ifundefined{@portuguesebrokentitle}{\@brokentitle}%
    {\@portuguesebrokentitle}}
  \def\@deflang@university{%
    \@ifundefined{@portugueseuniversity}{\@university}%
    {\@portugueseuniversity}}
  \def\@deflang@course{%
    \@ifundefined{@portuguesecourse}{\@course}{\@portuguesecourse}}
  \def\@deflang@shortcourse{%
    \@ifundefined{@portugueseshortcourse}{\@shortcourse}{\@portugueseshortcourse}}

  \def\ufop@titleuppertext{%
    \@deflang@university\\%
    Instituto de Ci�ncias Exatas\\
    \if@phd Programa de P�s-Gradua��o em \fi
    \if@msc Programa de P�s-Gradua��o em \fi
    \@deflang@course}

  \def\ufop@mono{Bacharel}
  \def\ufop@msc{Mestre}
  \def\ufop@phd{Doutor}
  \def\ufop@monodoc{Monografia}
  \def\ufop@monodocprop{Proposta de monografia}
  \def\ufop@mscdoc{Disserta\c{c}\~{a}o}
  \def\ufop@mscdocprop{Proposta de disserta\c{c}\~{a}o}
  \def\ufop@phddoc{Tese}
  \def\ufop@phddocproj{Projeto de tese}
  \def\ufop@approvaltitle{Folha de Aprova\c{c}\~{a}o}
  \def\ufop@advisor{Orientador}
  \def\ufop@coadvisor{Co-orientador}
  \def\ufop@docdescription{%
    \@documenttype{} apresentad\ufop@doctype@gender{} ao Curso de
    \if@phd P\'{o}s-Gradua\c{c}\~{a}o em \fi
    \if@msc P\'{o}s-Gradua\c{c}\~{a}o em \fi
    \@deflang@course{} da
    \@deflang@university{} como requisito parcial para a obten\c{c}\~{a}o
    do grau de \@degree{} em \@deflang@shortcourse.}
  \def\ufop@approvaltext{%
    \@documenttype{} defendid\ufop@doctype@gender{} e
    aprovad\ufop@doctype@gender{} pela banca examinadora constitu\'{i}da
    por:}
  \def\ufop@abstractX{Resumo Estendido}
  \def\ufop@abstract{Resumo}
  \def\ufop@acknowledgments{Agradecimentos}
  \def\ufop@publications{Publica\c{c}\~{o}es}

  \def\ufop@set@phddocproj{\def\ufop@doctype@gender{o}}
  \def\ufop@set@phddoc{\def\ufop@doctype@gender{a}}
  \def\ufop@set@mscdocprop{\def\ufop@doctype@gender{a}}
  \def\ufop@set@mscdoc{\def\ufop@doctype@gender{a}}
  \def\ufop@set@monodocprop{\def\ufop@doctype@gender{a}}
  \def\ufop@set@monodoc{\def\ufop@doctype@gender{a}}


  \def\ufopbibauthorsep{;}
  \def\ufopbibauthorlastsep{}
  \def\ufopbibauthorand{e}
  \def\ufopciteauthorand{e}
  \def\ufopbibpagestring{p.\@}
  \def\ufopbibpagesstring{pp.\@}
  \def\ufopbibeditorstring{editor}
  \def\ufopbibeditorsstring{editores}
  \def\ufopbibeditionstring{edi��o}
}

\def\ufop@lang@french{%
  \@extrafrenchtitlepagefalse

  \def\@deflang@title{%
    \@ifundefined{@frenchtitle}{\@title}{\@frenchtitle}}
  \def\@deflang@brokentitle{%
    \@ifundefined{@frenchbrokentitle}{\@brokentitle}%
    {\@frenchbrokentitle}}
  \def\@deflang@university{%
    \@ifundefined{@frenchuniversity}{\@university}%
    {\@frenchuniversity}}
  \def\@deflang@course{%
    \@ifundefined{@frenchcourse}{\@course}{\@frenchcourse}}

  \def\ufop@titleuppertext{%
    \@deflang@university\\%
    Instituto de Ci�ncias Exatas\\
    Programa de P�s-Gradua��o em \@deflang@course}

  \def\ufop@mono{Bacharel}
  \def\ufop@msc{Master}
  \def\ufop@phd{Docteur}
  \def\ufop@monodoc{xxx}
  \def\ufop@monodocprop{xxx de xxx}
  \def\ufop@mscdoc{Dissertation}
  \def\ufop@mscdocprop{Proposition de dissertation}
  \def\ufop@phddoc{Th�se}
  \def\ufop@phddocproj{Projet de th�se}
  \def\ufop@approvaltitle{Feuille de approuvation}
  \def\ufop@advisor{Directeur de th�se}
  \def\ufop@coadvisor{Co-directeur de th�se}
  \def\ufop@docdescription{%
    \@documenttype{} apresentad\ufop@doctype@gender{} ao Curso de
    P\'{o}s-Gradua\c{c}\~{a}o em \@deflang@course{} da
    \@deflang@university{} como requisito parcial para a obten\c{c}\~{a}o
    do grau de \@degree{} em \@deflang@course.}
  \def\ufop@approvaltext{%
    \@documenttype{} defendid\ufop@doctype@gender{} e
    aprovad\ufop@doctype@gender{} pela banca examinadora constitu\'{i}da
    por:}
  \def\ufop@abstract{R�sum�}
  \def\ufop@acknowledgments{Agradecimentos}
  \def\ufop@publications{Publica\c{c}\~{o}es}

  \def\ufop@set@phddocproj{\def\ufop@doctype@gender{o}}
  \def\ufop@set@phddoc{\def\ufop@doctype@gender{a}}
  \def\ufop@set@mscdocprop{\def\ufop@doctype@gender{a}}
  \def\ufop@set@mscdoc{\def\ufop@doctype@gender{a}}
  \def\ufop@set@monodocprop{\def\ufop@doctype@gender{a}}
  \def\ufop@set@monodoc{\def\ufop@doctype@gender{a}}


  \def\ufopbibauthorsep{;}
  \def\ufopbibauthorlastsep{}
  \def\ufopbibauthorand{e}
  \def\ufopciteauthorand{e}
  \def\ufopbibpagestring{p.\@}
  \def\ufopbibpagesstring{pp.\@}
  \def\ufopbibeditorstring{editeur}
  \def\ufopbibeditorsstring{editeurs}
  \def\ufopbibeditionstring{edition}
}

\def\ufop@lang@italian{%
  \@extraitaliantitlepagefalse

  \def\@deflang@title{%
    \@ifundefined{@italiantitle}{\@title}{\@italiantitle}}
  \def\@deflang@brokentitle{%
    \@ifundefined{@italianbrokentitle}{\@brokentitle}%
    {\@italianbrokentitle}}
  \def\@deflang@university{%
    \@ifundefined{@italianuniversity}{\@university}%
    {\@italianuniversity}}
  \def\@deflang@course{%
    \@ifundefined{@italiancourse}{\@course}{\@italiancourse}}

  \def\ufop@titleuppertext{%
    \@deflang@university\\%
    Instituto de Ci�ncias Exatas\\
    Programa de P�s-Gradua��o em \@deflang@course}

  \def\ufop@msc{Mestre}
  \def\ufop@phd{Dottore}
  \def\ufop@mscdoc{Dissertazione}
  \def\ufop@mscdocprop{Proposizione di dissertazione}
  \def\ufop@phddoc{Tese}
  \def\ufop@phddocproj{Progeto di tese}
  \def\ufop@approvaltitle{xx}
  \def\ufop@advisor{xx}
  \def\ufop@coadvisor{x}
  \def\ufop@docdescription{%
    \@documenttype{} apresentad\ufop@doctype@gender{} ao Curso de
    P\'{o}s-Gradua\c{c}\~{a}o em \@deflang@course{} da
    \@deflang@university{} como requisito parcial para a obten\c{c}\~{a}o
    do grau de \@degree{} em \@deflang@course.}
  \def\ufop@approvaltext{%
    \@documenttype{} defendid\ufop@doctype@gender{} e
    aprovad\ufop@doctype@gender{} pela banca examinadora constitu\'{i}da
    por:}
  \def\ufop@abstract{Risumo}
  \def\ufop@acknowledgments{x}
  \def\ufop@publications{x}

  \def\ufop@set@phddocproj{\def\ufop@doctype@gender{o}}
  \def\ufop@set@phddoc{\def\ufop@doctype@gender{a}}
  \def\ufop@set@mscdocprop{\def\ufop@doctype@gender{a}}
  \def\ufop@set@mscdoc{\def\ufop@doctype@gender{a}}
  \def\ufop@set@monodocprop{\def\ufop@doctype@gender{a}}
  \def\ufop@set@monodoc{\def\ufop@doctype@gender{a}}

  \def\ufopbibauthorsep{;}
  \def\ufopbibauthorlastsep{}
  \def\ufopbibauthorand{e}
  \def\ufopciteauthorand{e}
  \def\ufopbibpagestring{p.\@}
  \def\ufopbibpagesstring{pp.\@}
  \def\ufopbibeditorstring{editeur}
  \def\ufopbibeditorsstring{editeurs}
  \def\ufopbibeditionstring{edition}
}


\def\ufop@expandmonth@english#1{%
  \ifcase\ufop@month\or
  january\or february\or march\or april\or may\or june\or
  july\or august\or september\or october\or november\or december\fi
}
\def\ufop@expanddate@english{%
  \edef\text@month{\ufop@expandmonth@english{\ufop@month}}%
  \expandafter\MakeUppercase\text@month
  \ifx\ufop@day\empty\else\ \ufop@day,\fi
  \ \ufop@year
}
\def\ufop@lang@english{%
  \@extraporttitlepagetrue

  \def\@deflang@title{\@title}
  \def\@deflang@brokentitle{\@brokentitle}
  \def\@deflang@university{\@university}
  \def\@deflang@course{\@course}

  \def\ufop@titleuppertext{%
    \@deflang@university\\%
    Instituto de Ci�ncias Exatas\\
    Graduate Program in \@deflang@course}

  \def\ufop@msc{Bachelor}
  \def\ufop@msc{Master}
  \def\ufop@phd{Doctor}
  \def\ufop@monodoc{Monograph}
  \def\ufop@monodocprop{Monograph proposal}
  \def\ufop@mscdoc{Dissertation}
  \def\ufop@mscdocprop{Dissertation proposal}
  \def\ufop@phddoc{Thesis}
  \def\ufop@phddocproj{Thesis project}
  \def\ufop@approvaltitle{Approval Sheet}
  \def\ufop@advisor{Advisor}
  \def\ufop@coadvisor{Co-advisor}
  \def\ufop@docdescription{%
    \@documenttype{} presented to the Graduate Program in \@course{} of the
    \@university{} in partial fulfillment of the requirements for the
    degree of \@degree{} in \@course.}
  \def\ufop@approvaltext{%
    \@documenttype{} presented to and approved by the committee
    composed by:}
  \def\ufop@abstract{Abstract}
  \def\ufop@acknowledgments{Acknowledgments}
  \def\ufop@publications{Publications}

  \let\ufop@set@phddocproj\relax
  \let\ufop@set@phddoc\relax
  \let\ufop@set@mscdocprop\relax
  \let\ufop@set@mscdoc\relax
  \let\ufop@set@monodocprop\relax
  \let\ufop@set@monodoc\relax


  \def\ufopbibauthorsep{,}
  \def\ufopbibauthorlastsep{,}
  \def\ufopbibauthorand{and}
  \def\ufopciteauthorand{and}
  \def\ufopbibpagestring{page}
  \def\ufopbibpagesstring{pages}
  \def\ufopbibeditorstring{editor}
  \def\ufopbibeditorsstring{editors}
  \def\ufopbibeditionstring{edition}
}
\newcommand{\makecoverpage}{%
  \if@showcover\begingroup
    \ufop@deflanguage{brazil}\ufop@selectlanguage
    \ufop@maketitlepage{\z@}
  \endgroup\fi
}
\newcommand{\maketitlepage}{%
  \if@showtitle
    \if@extraporttitlepage\begingroup
      \ufop@deflanguage{brazil}\ufop@selectlanguage
      \ufop@maketitlepage{\@ne}%
    \endgroup\fi
    \ufop@maketitlepage{\@ne}%
  \fi
}

\def\ufop@docdescriptionwidth{0.5\textwidth}

\def\ufop@makedocdescription{%
  \begin{minipage}{\ufop@docdescriptionwidth}
    \ufop@docdescription
  \end{minipage}
}

\def\ufop@titpag@fmtupper#1{\large\textsc{#1}}
\def\ufop@titpag@fmttitle#1{\Large\textbf{\BreakableUppercase{#1}}}
\def\ufop@titpag@fmtauthor#1{\large\BreakableUppercase{#1}}
\def\ufop@titpag@fmtaddress#1{\large #1}
\def\ufop@titpag@fmtdate#1{\large #1}

\def\ufop@maketitlepage#1{%
  \begin{titlingpage}
  \begin{singlespace}
  {\centering
    \vbox to48ex{%
      \ifx#1\z@
        {\ufop@titpag@fmtauthor{\@author}} \\%
    \vspace{2ex}        
                               {\ufop@advisor:  \@advisorT} \\%
\@ifundefined{@coadvisorT}{}{
                              {\ufop@coadvisor: \@coadvisorT} \\%
                              }
      \else
        {\ufop@titpag@fmtupper{\ufop@titleuppertext}}%
      \fi
      \par\vfil
    }%

    \begin{doublespace}
    {\ufop@titpag@fmttitle{\@deflang@brokentitle}}\par

    \vspace{10ex}
    \end{doublespace}

    \ifx#1\@ne
      \hspace*{\stretch{1}}\ufop@makedocdescription\par
    \fi

    \vspace{\stretch{1}}

    \ifx#1\@ne
      {\ufop@titpag@fmtauthor{\@author}}\par
      \vspace{30ex}
    \fi

    {\ufop@titpag@fmtaddress{\@address}}\par
    \vspace{1ex}

    {\ufop@titpag@fmtdate{\ufop@formatdate{\@date}}}\par
  }
  \end{singlespace}
  \end{titlingpage}
}

\newcounter{ufop@banca}

\newcommand{\addtocomitee}[4][\relax]{%
  \addtocounter{ufop@banca}{1}
  \expandafter\def\csname ufop@banca@\theufop@banca name\endcsname
    {#2}
  \expandafter\def\csname ufop@banca@\theufop@banca title\endcsname
    {#3}
  \def\ufop@temp{#4}
  \if\ufop@temp.
    \expandafter\def\csname ufop@banca@\theufop@banca instit\endcsname
      {\@university}
  \else
    \expandafter\def\csname ufop@banca@\theufop@banca instit\endcsname
      {#4}
  \fi
  \ifx#1\relax\else
    \expandafter\def\csname ufop@banca@\theufop@banca rel\endcsname
      {#1}
  \fi
}

\newcommand{\advisor}[3]{\addtocomitee[\ufop@advisor]{#1}{#2}{#3}}
\newcommand{\coadvisor}[3]{\addtocomitee[\ufop@coadvisor]{#1}{#2}{#3}}

\def\ufop@fmtbancatitle{}
\def\ufop@fmtbancaname{\textsc}
\def\ufop@fmtbancainstit{}
\def\ufop@fmtbancarel{}

\newcommand{\ufop@makecomiteelist}{%
  \setcounter{ufop@banca}{1}
  \loop\expandafter\ifx\csname ufop@banca@\theufop@banca name\endcsname\relax
    \else
    {\centering
    \vspace{\stretch{1}}
    {\ufop@fmtbancatitle{%
      \csname ufop@banca@\theufop@banca title\endcsname}}~%
    {\ufop@fmtbancaname{%
      \csname ufop@banca@\theufop@banca name\endcsname}}%
    \@ifundefined{ufop@banca@\theufop@banca rel}{}{%
      \ -- {\ufop@fmtbancarel{%
        \csname ufop@banca@\theufop@banca rel\endcsname}}%
    }%
    \\%
    {\ufop@fmtbancainstit{%
      \csname ufop@banca@\theufop@banca instit\endcsname}}\\%
    }
    \stepcounter{ufop@banca}
  \repeat
  \vspace{\stretch{1.5}}
}

\def\ufop@apprpag@fmtuniv#1{\normalsize\MakeUppercase{#1}}
\def\ufop@apprpag@fmttitle#1{\large\MakeUppercase{#1}}
\def\ufop@apprpag@fmtauthor#1{\large\BreakableUppercase{#1}}
\def\ufop@apprpag@fmttext{}
\def\ufop@apprpag@fmtaddrdate{}

\newcommand{\makeapproval}{%
  \if@showapproval
    \begingroup
    \ufop@deflanguage{brazil}\ufop@selectlanguage
    \begin{titlingpage}
    \begin{singlespace}
    {\centering
      \ifx\@logo\@undefined
        {\ufop@apprpag@fmtuniv{\@deflang@university}}\par
        \vspace{12ex}
      \else
        \raisebox{-0.5\height}{\includegraphics{\@logo}}\quad
        {\ufop@apprpag@fmtuniv{\@deflang@university}}\par
        \vspace{6ex}
      \fi

      {\ufop@apprpag@fmttitle{\ufop@approvaltitle}}\par
      \vspace{5ex}

      {\Large\@deflang@brokentitle\par}
      \vspace{5ex}

      {\ufop@apprpag@fmtauthor{\@author}}\par
      \vspace{5ex}
    }

    {\ufop@apprpag@fmttext{\ufop@approvaltext}}\par
    \vspace{4ex}

    \ufop@makecomiteelist

    {\centering
      {\ufop@apprpag@fmtaddrdate{\@address, \ufop@formatdate{\@date}}}%
      \par
    }
    \end{singlespace}
    \end{titlingpage}
    \endgroup
  \fi
}

\newcommand{\includeabstract}[2][]{%
  \if@showabstract
    \ufop@redefchaptitlefont
    \def\@temp{#1}
    \ifx\@temp\empty\def\@temp{\ufop@abstract}\else\def\@temp{#1}\fi
    \chapter*{\@temp}
    \input{#2}
    \cleardoublepage
  \fi
}

\newcommand{\includeabstractX}[2][]{%
  \if@showabstract
    \ufop@redefchaptitlefont
    \def\@temp{#1}
    \ifx\@temp\empty\def\@temp{\ufop@abstractX}\else\def\@temp{#1}\fi
    \chapter*{\@temp}
    \input{#2}
    \cleardoublepage
  \fi
}

\newcommand{\includededication}[1]{%
  \if@showdedication
    \vspace*{\stretch{1}}
    \textit{\input{#1}}
    \vspace*{\stretch{1}}
    \cleardoublepage
  \fi
}



\newcommand{\includeack}[1]{%
  \if@showack
    \ufop@redefchaptitlefont
    \def\@temp{#1}
    \ifx\@temp\empty\def\@temp{\ufop@abstractX}\else\def\@temp{#1}\fi
%    \chapter*{\@temp}
    \chapter*{\ufop@acknowledgments}
    \input{#1}
    \cleardoublepage
  \fi
}

\newcommand{\includepublication}[1]{%
  \if@showpublication
    \ufop@redefchaptitlefont
    \chapter*{\ufop@publications}
    \input{#1}
    \cleardoublepage
  \fi
}



\if@twoside
  \makeheadrule{headings}{\textwidth}{\normalrulethickness}
  \makeoddhead{headings}{\textsc{\rightmark}}{}{\thepage}
  \makeevenhead{headings}{\thepage}{}{\textsc{\leftmark}}

  \copypagestyle{contents}{plain}

  \copypagestyle{listoffigures}{plain}

  \copypagestyle{listoftables}{plain}
  
  \copypagestyle{listofalgorithmes}{plain} % (menotti - 2006/11/20)

  \copypagestyle{bibliography}{headings}
  \makeoddhead{bibliography}{\textsc{\bibname}}{}{\thepage}
  \makeevenhead{bibliography}{\thepage}{}{\textsc{\bibname}}
\else
  \makeheadrule{headings}{\textwidth}{\normalrulethickness}
  \makeoddhead{headings}{\textsc{\leftmark}}{}{\thepage}

  \copypagestyle{contents}{plain}

  \copypagestyle{listoffigures}{plain}

  \copypagestyle{listoftables}{plain}
  
  \copypagestyle{listofalgorithmes}{plain} % (menotti - 2006/11/20)

  \copypagestyle{bibliography}{headings}
  \makeoddhead{bibliography}{\textsc{\bibname}}{}{\thepage}
\fi

\def\ufop@chaptermark#1{%
  \markboth{%
    \ifnum\c@secnumdepth>\m@ne
      \if@mainmatter
        \if@twoside\@chapapp\ \fi
        \thechapter.
      \fi
    \fi
    #1}{}}%

\def\ufop@sectionmark#1{%
  \markright{%
    \ifnum\c@secnumdepth>\z@\thesection. \ \fi
    #1}}%

\def\ufoprestoremarks{%
  \let\chaptermark=\ufop@chaptermark
  \let\sectionmark=\ufop@sectionmark
}

\ufoprestoremarks
\g@addto@macro\mainmatter{\pagestyle{headings}\ufoprestoremarks}

\let\ufop@orig@tableofcontents=\tableofcontents
\renewcommand{\tableofcontents}{{%
  \if@showtoc\begingroup
    \ufop@redefchaptitlefont
    \let\ufop@save@tableofcontents=\tableofcontents
    \let\tableofcontents=\ufop@orig@tableofcontents
    \pagestyle{contents}
    \tableofcontents*
    \cleardoublepage
  \endgroup\fi
}}

\let\ufop@orig@listoffigures=\listoffigures
\renewcommand{\listoffigures}{{%
  \if@showlof\begingroup
    \ufop@redefchaptitlefont
    \let\ufop@save@listoffigures=\listoffigures
    \let\listoffigures=\ufop@orig@listoffigures
    \pagestyle{listoffigures}
    \listoffigures*
    \cleardoublepage
  \endgroup\fi
}}

\let\ufop@orig@listoftables=\listoftables
\renewcommand{\listoftables}{{%
  \if@showlot\begingroup
    \ufop@redefchaptitlefont
    \let\ufop@save@listoftables=\listoftables
    \let\listoftables=\ufop@orig@listoftables
    \pagestyle{listoftables}
    \listoftables*
    \cleardoublepage
  \endgroup\fi
}}

\def\ufop@setabstractfile#1{\def\ufop@abstractfile{#1}}
\def\ufop@setportabstractfile#1{\def\ufop@portabstractfile{#1}}
\def\ufop@setfrenchabstractfile#1{\def\ufop@frenchabstractfile{#1}}
\def\ufop@setitalianabstractfile#1{\def\ufop@italianabstractfile{#1}}
\def\ufop@setextendedabstractfile#1{\def\ufop@extendedabstractfile{#1}}
\def\ufop@setdedicationfile#1{\def\ufop@dedicationfile{#1}}
\def\ufop@setackfile#1{\def\ufop@ackfile{#1}}
\def\ufop@setpublicationfile#1{\def\ufop@publicationfile{#1}}

\define@key{ufop}{title}{\title{#1}}
\define@key{ufop}{brokentitle}{\brokentitle{#1}}
\define@key{ufop}{author}{\author{#1}}
\define@key{ufop}{university}{\university{#1}}
\define@key{ufop}{course}{\course{#1}}
\define@key{ufop}{portuguesetitle}{\portuguesetitle{#1}}
\define@key{ufop}{portuguesebrokentitle}{\portuguesebrokentitle{#1}}
\define@key{ufop}{portugueseuniversity}{\portugueseuniversity{#1}}
\define@key{ufop}{portuguesecourse}{\portuguesecourse{#1}}
\define@key{ufop}{portugueseshortcourse}{\portugueseshortcourse{#1}}
\define@key{ufop}{frenchtitle}{\frenchtitle{#1}}
\define@key{ufop}{frenchbrokentitle}{\frenchbrokentitle{#1}}
\define@key{ufop}{frenchuniversity}{\frenchuniversity{#1}}
\define@key{ufop}{frenchcourse}{\frenchcourse{#1}}
\define@key{ufop}{italiantitle}{\italiantitle{#1}}
\define@key{ufop}{italianbrokentitle}{\italianbrokentitle{#1}}
\define@key{ufop}{italianuniversity}{\italianuniversity{#1}}
\define@key{ufop}{italiancourse}{\italiancourse{#1}}
\define@key{ufop}{address}{\address{#1}}
\define@key{ufop}{date}{\date{#1}}
\define@key{ufop}{logo}{\logo{#1}}
\define@key{ufop}{advisor}{\advisor#1}
\define@key{ufop}{advisorT}{\advisorT{#1}}
\define@key{ufop}{coadvisor}{\coadvisor#1}
\define@key{ufop}{coadvisorT}{\coadvisorT{#1}}
\define@key{ufop}{member}{\addtocomitee#1}
\define@key{ufop}{portugueseabstract}{\ufop@setportabstractfile{#1}}
\define@key{ufop}{abstract}{\ufop@setabstractfile{#1}}
%\define@key{ufop}{englishabstract}{\ufop@setenglishabstractfile{#1}}
\define@key{ufop}{frenchabstract}{\ufop@setfrenchabstractfile{#1}}
\define@key{ufop}{italianabstract}{\ufop@setitalianabstractfile{#1}}
\define@key{ufop}{extendedabstract}{\ufop@setextendedabstractfile{#1}}
\define@key{ufop}{dedication}{\ufop@setdedicationfile{#1}}
\define@key{ufop}{ack}{\ufop@setackfile{#1}}
\define@key{ufop}{publication}{\ufop@setpublicationfile{#1}}

\newcommand{\ufopthesis}[1]{%
  \setkeys{ufop}{#1}

  \frontmatter
  \pagestyle{plain}

  \makecoverpage
  \maketitlepage
  \makeapproval
  \@ifundefined{ufop@portabstractfile}{}{%
    \begingroup
      \ufop@deflanguage{brazil}\ufop@selectlanguage
      \includeabstract{\ufop@portabstractfile}%
    \endgroup}
  \@ifundefined{ufop@abstractfile}{}{%
    \begingroup  
     \ufop@deflanguage{english}\ufop@selectlanguage 
     \includeabstract{\ufop@abstractfile}%
    \endgroup}
%  \@ifundefined{ufop@enaglishbstractfile}{}{%
%    \begingroup
%      \ufop@deflanguage{english}\ufop@selectlanguage
%      \includeabstract{\ufop@englishabstractfile}%
%    \endgroup}
  \@ifundefined{ufop@frenchabstractfile}{}{%
    \begingroup
      \ufop@deflanguage{french}\ufop@selectlanguage
      \includeabstract{\ufop@frenchabstractfile}%
    \endgroup}
  \@ifundefined{ufop@italianabstractfile}{}{%
    \begingroup
      \ufop@deflanguage{italian}\ufop@selectlanguage
      \includeabstract{\ufop@italianabstractfile}%
    \endgroup}
  \@ifundefined{ufop@extendedabstractfile}{}{%
    \begingroup
      \ufop@deflanguage{brazil}\ufop@selectlanguage
      \includeabstractX{\ufop@extendedabstractfile}%
    \endgroup}
  \@ifundefined{ufop@dedicationfile}{}{
   \begingroup
    \ufop@deflanguage{english}\ufop@selectlanguage 
    \includededication{\ufop@dedicationfile}
   \endgroup}
  \@ifundefined{ufop@ackfile}{}{
   \begingroup
    \ufop@deflanguage{brazil}\ufop@selectlanguage  %%%
    \includeack{\ufop@ackfile}%
   \endgroup}
  \@ifundefined{ufop@publicationfile}{}{
   \begingroup
    \ufop@deflanguage{english}\ufop@selectlanguage 
    \includepublication{\ufop@publicationfile}%
   \endgroup}
  \tableofcontents
  \listoffigures
  \listoftables
%  \listalgorithmcfname
%   \listofalgorithmes % algorihtm2e option algo2e (menotti - 2006/11/20)

  \if@putmainmatter\mainmatter\fi
}

\def\ufop@bibauthorformat{}
\def\ufop@bibtitleformat{}
\def\ufop@bibbtitleformat{\itshape}
\def\ufop@bibbooktitleformat{\itshape}
\def\ufop@bibjournalformat{\itshape}

\def\ufop@norepstring{---------}
\def\ufopbibinstring{In}

\newcommand{\ufopbibauthordoformat}[1]{%
  \if@bibnorepauthor
    \def\ufop@currentauthor{#1}%
    \ifx\ufop@lastauthor\ufop@currentauthor\ufop@norepstring
      \else{\ufop@bibauthorformat#1}\fi
    \def\ufop@lastauthor{#1}%
  \else
    {\ufop@bibauthorformat#1}%
  \fi
}
\newcommand{\ufopbibtitledoformat}[1]{{\ufop@bibtitleformat#1}}
\newcommand{\ufopbibbtitledoformat}[1]{{\ufop@bibbtitleformat#1}}
\newcommand{\ufopbibbooktitledoformat}[1]{{\ufop@bibbooktitleformat#1}}
\newcommand{\ufopbibjournaldoformat}[1]{{\ufop@bibjournalformat#1}}

\define@key{ufopbib}{noauthorrepeat}[true]{\@bibnorepauthortrue}
\define@key{ufopbib}{noauthorrepstring}{\def\ufop@norepstring{#1}}
\define@key{ufopbib}{nobreakitems}[true]{\@nobreakitemstrue}
\define@key{ufopbib}{bibauthorand}{\def\ufopbibauthorand{#1}}
\define@key{ufopbib}{citeauthorand}{\def\ufopciteauthorand{#1}}
\define@key{ufopbib}{authorformat}{\def\ufop@bibauthorformat{#1}}
\define@key{ufopbib}{titleformat}{\def\ufop@bibtitleformat{#1}}
\define@key{ufopbib}{btitleformat}{\def\ufop@bibbtitleformat{#1}}
\define@key{ufopbib}{booktitleformat}{\def\ufop@bibbooktitleformat{#1}}
\define@key{ufopbib}{journalformat}{\def\ufop@bibjournalformat{#1}}

\newcommand{\ufopbibliography}[2][]{%
  \setkeys{ufopbib}{#1}

  \backmatter

  \pagestyle{bibliography}
  \bibliographystyle{ufop}
  \begingroup
    \ufop@redefchaptitlefont
    \if@nobreakitems\raggedbottom\interlinepenalty=10000\relax\fi
    \bibliography{#2}
  \endgroup
}

\AtBeginDocument{%
  \ufop@selectlanguage\ufop@defspacing
  \@ifpackageloaded{graphicx}{}{\RequirePackage{graphicx}}%
  \@ifpackageloaded{hyperref}{\RequirePackage{memhfixc}}{}%
}
\endinput
%%
%% End of file `ufopthesis.cls'.
