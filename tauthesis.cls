%% tauthesis.cls
%% Copyright 2018 Tampere University
%
% This work may be distributed and/or modified
% under the conditions of the LaTeX Project Public
% License, either version 1.3 of this license or
% (at your option) any later version.
%
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is
%   Ville Koljonen (ville.koljonen (at) tuni.fi)
%
% This work consists of the files tauthesis.cls.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tauthesis}
[2021/06/24 v2.0 Thesis styles used in Tampere University]

% Inherit from the report document class.
% Use 12pt nonetheless and scale fonts back
% to make maths closer to actual font size.
\LoadClass[12pt, a4paper]{report}

% Gain access to internal macros.
\makeatletter

%%%%% CLASS OPTIONS %%%%%

\newcommand{\@citationstyle}{numeric}
\newcommand{\@citationsorting}{none}
\newif\if@customcitation\@customcitationtrue
\newif\if@apacitation\@apacitationfalse

\newif\if@langenglish\@langenglishfalse

% Citation style selection.
\DeclareOption{numeric}{%
    \renewcommand{\@citationstyle}{numeric}
}
\DeclareOption{authoryear}{%
    \renewcommand{\@citationstyle}{authoryear}
    \renewcommand{\@citationsorting}{nyt}
}
\DeclareOption{apa}{%
    \renewcommand{\@citationstyle}{apa}
    \renewcommand{\@citationsorting}{nyt}
    \@customcitationfalse
    \@apacitationtrue
}
\DeclareOption{ieee}{%
    \renewcommand{\@citationstyle}{ieee}
    \@customcitationfalse
}


% Define a conditional flag
\newif\ifdraftmode

% Check if \draftmode is defined, then set the flag accordingly
\ifdefined\draftmode
  \draftmodetrue
\else
  \draftmodefalse
\fi

\DeclareOption*{
  \ClassWarning{tauthesis}{Unknown option '\CurrentOption'}
}

\ProcessOptions\relax

%%%%% PACKAGES AND RELATED DEFINITIONS %%%%%

% \RequirePackage{colorprofiles} % said to be needed once to install the package

\RequirePackage[a-3a]{pdfx}
\catcode30=12
% The pdfx package loads hyperref and xcolor packages, so you don’t have to call these explicitly.


% UTF-8 input
\RequirePackage[utf8]{inputenc}

% Arial-like font selection
\RequirePackage[scaled=0.91]{helvet}
\RequirePackage[T1]{fontenc}
\renewcommand*\familydefault{\sfdefault}

% Page geometry and heading handling
\RequirePackage
    [top=2.5cm,
    bottom=2.5cm,
    left=4cm,
    right=2cm]{geometry}
\special{papersize={210mm,297mm}}
\RequirePackage{fancyhdr} % Custom headers and footers
\RequirePackage[explicit]{titlesec}
\RequirePackage{setspace}
\RequirePackage{parskip}

\spacing{1.213}
\setlength{\headheight}{14.5pt}

\newlength\chapterspace
\setlength\chapterspace{0.4cm}
\newlength\chapterindent
\setlength\chapterindent{0.5in}

% Try to prevent large figures appearing
% by themselves without any text. Be
% careful not to make \floatpagefraction
% larger than \topfraction.
\renewcommand{\topfraction}{0.85}        % default 0.7
\renewcommand{\textfraction}{0.1}        % default 0.2
\renewcommand{\floatpagefraction}{0.75}

% Define the header and footer content.
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\thepage}
\fancyhead[L]{\itshape \rightmark}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Define chapter and section heading styles.

\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{2}

% Chapter
\titleformat
    {\chapter}[block]{\raggedright\bf\Large%
    \parshape %
    2 %
    0pt \linewidth %
    \chapterindent \dimexpr\linewidth-\chapterindent}
    {\makebox[\chapterindent][l]{\thechapter.}}{0em}
    {\fancyhf{}\rhead{\thepage}\MakeUppercase{#1}}
\titleformat
    {name=\chapter, numberless}
    {\raggedright\bf\Large}{}{0em}
    {\fancyhf{}\rhead{\thepage}\MakeUppercase{#1}}
\titlespacing{\chapter}{0em}{42pt}{42pt}
\titlespacing{name=\chapter, numberless}{0em}{18pt}{18pt}

% Section
\titleformat
    {\section}[block]{\raggedright\bf\large%
    \parshape %
    2 %
    0pt \linewidth %
    \chapterindent \dimexpr\linewidth-\chapterindent}
    {\makebox[\chapterindent][l]{\thesection}}{0em}{#1}
\titleformat
    {name=\section, numberless}
    {\raggedright\bf\large}{}{0em}{#1}
\titlespacing{\section}{0em}{18pt}{12pt}
\titlespacing{name=\section, numberless}{0em}{18pt}{12pt}

% Subsection
\titleformat
    {\subsection}[block]{\raggedright\bf\large%
    \parshape %
    2 %
    0pt \linewidth %
    \chapterindent \dimexpr\linewidth-\chapterindent}
    {\makebox[\chapterindent][l]{\thesubsection}}{0em}{#1}
\titleformat
    {name=\subsection, numberless}
    {\raggedright\bf\large}{}{0em}{#1}
\titlespacing{\subsection}{0em}{18pt}{12pt}
\titlespacing{name=\subsection, numberless}{0em}{18pt}{12pt}

% Subsubsection
%\titleformat
%    {\subsubsection}{\raggedright\bf\normalsize}
%    {\thesubsubsection}{\chapterspace}{#1}
\titleformat
    {name=\subsubsection, numberless}
    {\raggedright\bf\normalsize}{}{0em}{#1}
\titlespacing{\subsubsection}{0em}{18pt}{12pt}
\titlespacing{name=\subsubsection, numberless}{0em}{18pt}{12pt}

\RequirePackage[UKenglish]{babel}
\RequirePackage{csquotes}% TODO: figure out if this is necessary - said to be used for quoting

% Powerful color package
\RequirePackage{xcolor}
\definecolor{taupurple}{RGB}{78,0,148}

% Date and time handling
\RequirePackage[en-GB]{datetime2}
\DTMlangsetup[en-GB]{showdayofmonth=false}

% Smart bibliography handling
\RequirePackage
    [backend=biber,
    autolang=other,
    citestyle=\@citationstyle,
    bibstyle=\@citationstyle]{biblatex}

\DefineBibliographyStrings{english}{%
    bibliography = {References},
    references = {References}
}

\if@apacitation
    \DeclareLanguageMapping{english}{english-apa}
\fi

% Graphics inclusion and drawing
\ifdraftmode
  \PassOptionsToPackage{draft}{graphicx}
\fi
\RequirePackage{graphicx}

% Caption formatting
\RequirePackage
    [labelfont={bf,it},
    font=it,
    labelsep=period]{caption}
\renewcommand{\arraystretch}{1.25}

% Code listing handling
\RequirePackage{listings}
\lstset{texcl=true, captionpos=b, commentstyle=\tt}


\RequirePackage{fancyvrb}
% fancyvrb: Verbatim text, code blocks
 % TODO: DECIDE which package to use (fancyvrb or listings)


% List of symbols and abbreviations
\RequirePackage[automake=immediate, nonumberlist, nopostdot]{glossaries}


\newlength\glsnamewidth
\newglossarystyle{taulong}{%
    \setglossarystyle{long}%
    \renewenvironment{theglossary}{%
      \tablehead{}%
      \tabletail{}%
      \begin{longtable}{p{\glsnamewidth}p{\glsdescwidth}}%
    }{%
      \end{longtable}%
    }%
    \renewcommand{\glossentry}[2]{%
    \raggedright
    \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
    \glossentrydesc{##1}\glspostdescription\space ##2\tabularnewline
    }%
}

% Table of contents formatting
\RequirePackage{titletoc}

\titlecontents{chapter}[0pt]{}%
    {\parbox[t]{2em}{\thecontentslabel.}}{}{\titlerule*[1pc]{.}\contentspage}
\dottedcontents{section}[4em]{}{2em}{1pc}
\dottedcontents{subsection}[7em]{}{3em}{1pc}

\newenvironment{appendices}{%
\setcounter{chapter}{0}
\renewcommand{\thechapter}{\Alph{chapter}}
\renewcommand{\theHchapter}{\Alph{chapter}}
\titleformat
    {\chapter}{\raggedright\bf\Large%
    \parshape %
    2 %
    0pt \linewidth %
    \chapterindent \dimexpr\linewidth-\chapterindent}
    {\MakeUppercase{\appendixname~\thechapter:}}{\chapterspace}
    {\fancyhf{}\rhead{\thepage}\MakeUppercase{##1}}
\titlecontents{chapter}[0pt]{}%
    {Appendix~\thecontentslabel:~}{}{\titlerule*[1pc]{.}\contentspage}
}{}

% Flexible list modifications
\RequirePackage{enumitem}

\setlist{itemsep=-3pt, labelindent=1.27cm}

% Image alt texts
\RequirePackage{pdfcomment}

% Automated math alt texts.
%\RequirePackage[accsupp]{axessibility}
% it breaks the compilation by trying to change the pdf minorversion

% Text hyperlinking
%\RequirePackage{url}
\urlstyle{same}

%%%%% COMMAND DEFINITIONS %%%%%


% Make the title
\renewcommand\maketitle{
    \thispagestyle{empty}
    \vspace*{-1.88cm}\hspace*{-2.7cm}\includegraphics[height=2.07cm]{figures/tau-logo-eng.eps}
    \par\medskip
    \vspace{102pt}
    {\raggedleft\Large\@author\par}
    \vspace{42pt}
    {\raggedleft\bf\LARGE\color{taupurple}%
        \MakeUppercase{\@title} \ifdraftmode\ \textbf{[DRAFT]}\fi\par}
    {\raggedleft\Large\color{taupurple}%
        \@subtitle\par}
    \vfill
    {\raggedleft%
        \@thesistype\\%
        \@facultyname\\%
        Examiner: \@examiner\\%
        \DTMDisplaydate%
            {\@finishyear}%
            {\@finishmonth}%
            {\@finishday}{-1}%
    \par}
    \vspace{42pt}
    \clearpage
}

% Make the abstracts
\renewcommand{\abstract}[1]{
    \clearpage
    \chapter*{Abstract}
    \begin{spacing}{1.000}
    {\small
        \setlength{\parindent}{15pt}
        \setlength{\parskip}{0pt}
        \noindent\@author: \@title\par
        \noindent\@thesistype\par
        \noindent\@university\par
        \noindent\@programmename\par
        \noindent\DTMDisplaydate%
            {\@finishyear}%
            {\@finishmonth}%
            {\@finishday}{-1}\par
        \noindent\hrulefill\par
        \vspace{0.5\baselineskip}
        \@abstract\par
        \bigskip
        \noindent Keywords: \@keywords\par
        \bigskip
        \noindent The originality of this thesis has been checked using the Turnitin OriginalityCheck service.
    \par}
    \end{spacing}
    \clearpage
}


% Make the preface
\newcommand{\preface}[1]{
    \clearpage
    \chapter*{Preface}
    \noindent\input{#1}\par
    \bigskip
    \DTMlangsetup[en-GB]{showdayofmonth=true}
    \DTMdisplaydate%
        {\@finishyear}%
        {\@finishmonth}%
        {\@finishday}{-1}\par
    \bigskip
    \noindent\@author
    \clearpage
}

\makeatother

\endinput
