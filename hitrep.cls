%----------------------------------------------------------------------------------------------------%
%
% -> Class Clarification
%
%----------------------------------------------------------------------------------------------------%
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{hitrep}[2024/11/15 v0.1 Report template for student in Harbin Institute of Technology]

\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[zihao = -4]{ctexart}

%----------------------------------------------------------------------------------------------------%
%
% -> Package
%
%----------------------------------------------------------------------------------------------------%
% ----- Control -----
\RequirePackage{ifthen}
\RequirePackage{ifplatform}

% ----- Layout -----
\RequirePackage[a4paper,hmargin=3.17cm,vmargin=2.54cm]{geometry}
\usepackage{setspace}

% ----- Fix font size -----
\RequirePackage{anyfontsize}

% ----- Footer -----
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

% ----- Color -----
\RequirePackage{color}
\RequirePackage[dvipsnames, svgnames, x11names]{xcolor}

% ----- Enum list -----
% \RequirePackage{enumerate}
\RequirePackage{enumitem}

% ----- Math -----
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{bm}
\let\hitrep@oldencodingdefault\encodingdefault
\let\hitrep@oldrmdefault\rmdefault
\let\hitrep@oldsfdefault\sfdefault
\let\hitrep@oldttdefault\ttdefault
\def\encodingdefault{T1}
\renewcommand{\rmdefault}{ntxtlf}
\renewcommand{\sfdefault}{qhv}
\renewcommand{\ttdefault}{ntxtt}
\RequirePackage{newtxmath}
\let\encodingdefault\hitrep@oldencodingdefault
\let\rmdefault\hitrep@oldrmdefault
\let\sfdefault\hitrep@oldsfdefault
\let\ttdefault\hitrep@oldttdefault

% ----- Links -----
\RequirePackage[
    hidelinks,
    breaklinks = true,
    bookmarksopen = true,
    bookmarksopenlevel = 2
]{hyperref}

% ----- References -----
\RequirePackage[nameinlink]{cleveref}

% ----- Float element -----
\RequirePackage{float}
\RequirePackage{caption}

% ----- Table -----
\RequirePackage{booktabs}
\RequirePackage{makecell}
\RequirePackage{multirow}

% ----- Images -----
\RequirePackage{graphicx}
\RequirePackage{subcaption}

% ----- Algorithms -----
\RequirePackage[algoruled,linesnumbered]{algorithm2e}

% ----- Code -----
\RequirePackage{listings}

%----------------------------------------------------------------------------------------------------%
%
% -> Options
%
%----------------------------------------------------------------------------------------------------%
\gdef\hitrep@readingreport{读书报告}
\gdef\hitrep@experimentalreport{实验报告}
\gdef\hitrep@reporttype{\hitrep@experimentalreport}

\DeclareOption{exp}{\gdef\hitrep@reporttype{\hitrep@experimentalreport}}
\DeclareOption{reading}{\gdef\hitrep@reporttype{\hitrep@readingreport}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------------------%
%
% -> Global Variables
%
%----------------------------------------------------------------------------------------------------%
\gdef\hitrep@subject{}
\NewDocumentCommand{\subject}{m}{
    \gdef\hitrep@subject{#1}
}
\gdef\hitrep@department{}
\NewDocumentCommand{\department}{m}{
    \gdef\hitrep@department{#1}
}
\gdef\hitrep@major{}
\NewDocumentCommand{\major}{m}{
    \gdef\hitrep@major{#1}
}
\gdef\hitrep@author{}
\RenewDocumentCommand{\author}{m}{
    \gdef\hitrep@author{#1}
}
\gdef\hitrep@studentid{}
\NewDocumentCommand{\studentid}{m}{
    \gdef\hitrep@studentid{#1}
}
\gdef\hitrep@studenttype{}
\NewDocumentCommand{\studenttype}{m}{
    \gdef\hitrep@studenttype{#1}
}

%----------------------------------------------------------------------------------------------------%
%
% -> Table of Content
%
%----------------------------------------------------------------------------------------------------%
\newcommand{\toc}{
    \phantomsection
    \addcontentsline{toc}{section}{\contentsname}
    \tableofcontents
}

%----------------------------------------------------------------------------------------------------%
%
% -> Fonts
%
%----------------------------------------------------------------------------------------------------%
\setmainfont{Times New Roman}
\newcommand{\hitrep@songti}{\songti}

\IfFontExistsTF{Songti SC}{
    \setCJKmainfont[
        UprightFont = {Songti SC Regular},
        BoldFont = {Songti SC Bold},
        AutoFakeSlant
    ]{Songti SC}
    \setCJKfamilyfont{hitrepsong}[
        UprightFont = {Songti SC Regular},
        BoldFont = {Songti SC Bold},
        AutoFakeSlant
    ]{Songti SC}
    \renewcommand{\hitrep@songti}{\CJKfamily{hitrepsong}}
}{
    \IfFontExistsTF{SimSun}{
        \setCJKmainfont[AutoFakeBold, AutoFakeSlant]{SimSun}
        \setCJKfamilyfont{hitrepsong}[AutoFakeBold, AutoFakeSlant]{SimSun}
        \renewcommand{\hitrep@songti}{\CJKfamily{hitrepsong}}
    }
}

%----------------------------------------------------------------------------------------------------%
%
% -> Footer
%
%----------------------------------------------------------------------------------------------------%
\pagestyle{fancy}
\newcommand{\hitrep@footmark}{\zihao{5}第~~~\thepage{}~~~页~~（共~~\pageref{LastPage}~~页）\phantom{mmm}}
\fancyhf{}
\fancyfoot[R]{\hitrep@footmark}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.5bp}

%----------------------------------------------------------------------------------------------------%
%
% -> Enum List
%
%----------------------------------------------------------------------------------------------------%
\setlength{\itemindent}{0pt}

%----------------------------------------------------------------------------------------------------%
%
% -> Cover
%
%----------------------------------------------------------------------------------------------------%
\RequirePackage{xeCJKfntef}

\newcommand{\hitrep@optiontitle}[2][3.81cm]{\begin{CJKfilltwosides}[b]{#1}#2\end{CJKfilltwosides}}

\newcommand{\hit@autoyear}{\ifnum\month>1 {\the\year}\else {\the\numexpr\year-1\relax}\fi}
\newcommand{\hit@autosemester}{\ifcase \month \or 秋\or 春\or 春\or 春\or 春\or 春\or 夏\or 夏\or 秋\or 秋\or 秋\or 秋\fi}
\gdef\hit@year{\hit@autoyear}
\gdef\hit@semester{\hit@autosemester}
\NewDocumentCommand{\yearterm}{m}{
    \gdef\hit@year{#1}
}
\NewDocumentCommand{\semester}{m}{
    \gdef\hit@semester{#1}
}

\renewcommand{\maketitle}{
    \thispagestyle{fancy}
    {
        \begin{center}
            \zihao{-2}\heiti \uline{\ \hit@year\ }年\uline{\ \ \hit@semester\ \ }季学期研究生课程考核

            \zihao{-3}\heiti （\hitrep@reporttype）
        \end{center}

        \zihao{4}
        \renewcommand{\arraystretch}{1.5}
        \noindent\begin{tabular}{@{}c@{}l}
            \hitrep@optiontitle{考核科目}&: \hitrep@subject\\
            \hitrep@optiontitle{学生所在院（系）} &: \hitrep@department\\
            \hitrep@optiontitle{学生所在学科}&: \hitrep@major\\
            \hitrep@optiontitle{学生姓名}&: \hitrep@author\\
            \hitrep@optiontitle{学号}&: \hitrep@studentid\\
            \hitrep@optiontitle{学生类别}&: \hitrep@studenttype\\
            \hitrep@optiontitle{考核结果}& \begin{tabular}{@{}p{5.19cm}@{}cc@{}}
                &\hitrep@optiontitle[2.86cm]{阅卷人}&
            \end{tabular}
        \end{tabular}
    }

    \zihao{-4}
    \newpage
    \onehalfspacing
    % \singlespacing
    \setlength{\parskip}{0pt}
}

%----------------------------------------------------------------------------------------------------%
%
% -> Algorithms
%
%----------------------------------------------------------------------------------------------------%
\SetAlCapSty{}
\renewcommand{\algorithmcfname}{算法}
\setlength\AlCapSkip{1.2ex}
\newcommand{\hitrep@algoskip}{\vspace{0.5em}}
\SetAlgoSkip{hitrep@algoskip}
\SetAlFnt{\normalfont\zihao{-4}}
\SetArgSty{textnormal}
\SetFuncArgSty{textnormal}
\SetDataSty{textnormal}
\SetFuncSty{textnormal}
\SetKwInput{KwIn}{输入}
\SetKwInput{KwOut}{输出}
\SetKwProg{Function}{function}{}{}
\SetKw{KwBreak}{break}
\SetKw{KwRet}{return}
\SetKwFor{For}{for}{do}{end for}
\SetKwFor{While}{while}{do}{end while}
\SetKwIF{If}{ElseIf}{Else}{if}{then}{else if}{else}{end if}
\newcommand{\Call}[2]{#1(#2)}
\newcommand{\Get}{ $\gets$ }

\makeatletter
\newcommand{\foocaption}[1]{%
    \def\@algocf@pre@plainruled{%
        \hrule height1.5pt depth0pt\kern\interspacetitleruled
        #1%
        \kern\interspacealgoruled\hrule height1pt depth0pt\kern\interspacetitleruled
    }%
}
\def\@algocf@post@ruled{\kern\interspacealgoruled\hrule height1.5pt\relax}
\renewcommand{\algocf@captiontext}[2]{\normalfont\zihao{-4}#1\algocf@typo\hspace{1em}\AlCapFnt{}#2}
\renewcommand{\algocf@makecaption}[2]{%
    \sbox\@tempboxa{\algocf@captiontext{#1}{#2}}%
    \parbox[t]{\hsize}{\centering\algocf@captiontext{#1}{#2}}%
}

%----------------------------------------------------------------------------------------------------%
%
% -> Code
%
%----------------------------------------------------------------------------------------------------%
\lstdefinestyle{hitrepcode}{
    basicstyle        =   \ttfamily\small,
    breaklines        =   true,
    columns           =   fullflexible,
    keepspaces        =   true,
    showstringspaces  =   false,
    tabsize           =   4
}

\lstnewenvironment{wlcode}{\lstset{style=hitrepcode, language=Mathematica, numbers=left}}{}
\lstnewenvironment{wlinput}{\lstset{style=hitrepcode, language=Mathematica}}{}
\lstnewenvironment{pycode}{\lstset{style=hitrepcode, language=Python, numbers=left}}{}
\lstnewenvironment{pyinput}{\lstset{style=hitrepcode, language=Python}}{}

%----------------------------------------------------------------------------------------------------%
%
% -> Caption
%
%----------------------------------------------------------------------------------------------------%
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{sfive}{\zihao{5}}
\DeclareCaptionLabelSeparator{oneem}{\hspace*{1em}}

\captionsetup{
    format          =   plain,
    labelsep        =   oneem,
    font            =   { song, sfive },
    justification   =   centering,
    skip            =   0.5em
}

\captionsetup[algorithm]{
    labelsep        =   oneem
}

\setlength{\intextsep}{8.50398bp plus 2.83465bp minus 0bp}
\setlength{\textfloatsep}{8.50398bp plus 2.83465bp minus 0bp}
\setlength{\floatsep}{12bp plus 2.83465bp minus 0bp}
\addtolength{\intextsep}{0.5em}
\addtolength{\textfloatsep}{0.5em}
\addtolength{\floatsep}{0.5em}

\AtBeginDocument{
    \crefformat{table}{#2表 #1#3 }
    \crefformat{figure}{#2图 #1#3 }
    \crefformat{subfigure}{#2图 #1#3 }
    \crefformat{equation}{#2公式 (#1)#3 }
    \crefformat{algorithm}{#2算法 #1#3 }
    \crefformat{algocf}{#2算法 #1#3 }
    \crefformat{subsection}{ #2#1 小节#3}

    \crefrangeformat{equation}{公式(#3#1#4) $\sim$ (#5#2#6)}
}

%----------------------------------------------------------------------------------------------------%
%
% -> Title Style
%
%----------------------------------------------------------------------------------------------------%
\RequirePackage{titlesec}

\renewcommand{\thesection}{\chinese{section}}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}

\newcommand{\hitrep@sectiontitlefont}{\hitrep@songti\bfseries}

\titleformat{\section}{\hitrep@sectiontitlefont\zihao{-3}}{\thesection、}{0em}{}
\titlespacing{\section}{0pt}{2.3ex plus .2ex}{2.3ex plus .2ex}

\titleformat{\subsection}{\hitrep@sectiontitlefont\zihao{4}}{\thesubsection}{1em}{}
\titlespacing{\subsection}{0pt}{1.5ex plus .2ex}{1.5ex plus .2ex}

\titleformat{\subsubsection}{\hitrep@sectiontitlefont\zihao{-4}}{\thesubsubsection}{1em}{}
\titlespacing{\subsubsection}{0pt}{1.5ex plus .2ex}{1.5ex plus .2ex}

%----------------------------------------------------------------------------------------------------%
%
% -> Math Formula
%
%----------------------------------------------------------------------------------------------------%
\everymath{\displaystyle}
\newcommand{\hitrep@displaymathspacing}{%
    \setlength{\abovedisplayskip}{8pt}%
    \setlength{\belowdisplayskip}{8pt}%
    \setlength{\abovedisplayshortskip}{8pt}%
    \setlength{\belowdisplayshortskip}{8pt}%
    \setlength{\jot}{3pt}%
}
\hitrep@displaymathspacing
\makeatletter
\g@addto@macro\normalsize{\hitrep@displaymathspacing}

%----------------------------------------------------------------------------------------------------%
%
% -> References
%
%----------------------------------------------------------------------------------------------------%
\RequirePackage{gbt7714}
\makeatletter
\@namedef{bibstyle@hitrep-gbt7714-numerical}{\bibstyle@super}
\makeatother

\bibliographystyle{hitrep-gbt7714-numerical}

\newcommand{\printreferences}[1]{
    \begingroup
    \renewcommand{\section}[2]{}%
    \bibliography{#1}
    \endgroup
}

\newcommand{\bib}[1]{
    \phantomsection
    \addcontentsline{toc}{section}{\refname}
    \bibliography{#1}
}

%----------------------------------------------------------------------------------------------------%
%
% -> New Environments
%
%----------------------------------------------------------------------------------------------------%
\newcounter{hitrep@counter@numpar}
\def\hitrep@oldcmd@item{\item}
\newenvironment{numpar}{%
    \def\item{\par\refstepcounter{hitrep@counter@numpar}(\arabic{hitrep@counter@numpar}) }%
}{%
    \setcounter{hitrep@counter@numpar}{0}%
    \def\item\hitrep@oldcmd@item%
}
