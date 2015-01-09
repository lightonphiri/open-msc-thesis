\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{phiri-thesis}
         [2012/08/19 v1.0 University of Cape Town Dissertation class]
\RequirePackage{setspace}
\newcounter{subyear}
\setcounter{subyear}{\number\year}
\def\submitted#1{\gdef\@submitted{#1}}
\def\@submittedyear{\ifnum\month>10 \stepcounter{subyear}\thesubyear
  \else\thesubyear\fi}
\def\@submittedmonth{\ifnum\month>10 January\else\ifnum\month>5 November
  \else June\fi\fi}
\def\copyrightyear#1{\gdef\@copyrightyear{#1}}
\def\@copyrightyear{\number\year}
\def\adviser#1{\gdef\@adviser{#1}}
\long\def\@abstract{\@latex@error{No \noexpand\abstract given}\@ehc}
\newcommand*{\frontmatter}{
  \pagenumbering{roman}
  }
\newcommand*{\mainmatter}{\pagenumbering{arabic}}
\newcommand*{\makelot}{}
\newcommand*{\makelof}{}
\newcommand*{\makelos}{}
\newcommand*{\makelogs}{}
\newcommand*{\maketoc}{
  % Add ToC to the pdfbookmarks as a section, but not to the ToC itself.
  % only if we have the hyperref command that is necessary
  %
  % Uncomment code block below to show toc in pdfbookmark
  % 
  \ifdefined\pdfbookmark
     \phantomsection
     %%%%%\pdfbookmark[1]{\contentsname}{Table of Contents} % flip number to show in bookmark
     \pdfbookmark[1]{\contentsname}{Contents}
  \else
  \fi

  \tableofcontents
  \clearpage
}
%% Setup a command to add extra space only if in singlespacing mode
\newcommand*{\extravspace}[1]{\vspace{0in}}
%% Setup a command to set spacing for body text; also used to restore spacing after long tables in document
\newcommand*{\bodyspacing}{
  \doublespacing
}
%% Setup a command to set spacing for long tables, to be used manually in document
\newcommand*{\tablespacing}{
  \singlespacing
}
%% Command inserted into the document immediately after \begin{document} to place all frontmatter
%%   This was formerly named 'begincmd' and called below in \AtBeginDocument{}
%%   However, that is not compatible with package 'hyperref'. \tableofcontents needs
%%   to be declared from within the document itself. 
\newcommand*{\makefrontmatter}{
\bodyspacing
\frontmatter
\maketitlepage
\makecopyrightpage
\makedeclarationpage
\makeacknowledgements
\makededication
\makeabstract
\maketoc
\makelot
\clearpage
\makelof
\clearpage
\makelos
\clearpage
\makelogs
\clearpage
\mainmatter
}
\def\@submitted{\@submittedmonth~\@submittedyear}
\def\@dept{Computer Science}
\def\@deptpref{Department of }
\def\departmentprefix#1{\gdef\@deptpref{#1}}
\def\department#1{\gdef\@dept{#1}}
\long\def\declaration#1{\gdef\@declaration{#1}} % understand this brother...
\long\def\acknowledgements#1{\gdef\@acknowledgements{#1}}
\def\dedication#1{\gdef\@dedication{#1}}
%%%\newcommand{\maketitlepage}{{
  %%%\thispagestyle{empty}
  %%%\sc
  %%%\vspace*{0in}
  %%%\begin{center}
    %%%\LARGE \@title
  %%%\end{center}
  %%%\vspace{.5in}
  %%%\extravspace{.2in}
  %%%\begin{center}
    %%%%%by \\
    %%%%%\vspace{.1in}
    %%%\@author \\
    %%%\vspace{.1in} 
    %%%%Supervised By: \\
    %%%%\@adviser
  %%%\end{center}
  %%%\vspace{.5in}
  %%%\extravspace{.2in}
  %%%\begin{center}
    %%%\begin{center}
    %%%  \includegraphics[scale=0.65]{figures/UCTcircular_logo_CMYK.eps}
    %%%\end{center}
    %%%\vspace{.5in}
    %%%A Thesis submitted in partial fulfillment of the \\
    %%%requirements for the degree of \\
    %%%\vspace{.3in}
    %%%Master of Science \\
    %%%\vspace{.05in}
    %%%in \\
    %%%\vspace{.05in}
    %%%Computer Science \\
    %%%\vspace{.3in}
    %%%Supervised by \\
    %%%Hussein Suleman \\
  %%%\end{center}
  %%%\vspace{.2in}
  %%%\extravspace{.2in}
  %%%\begin{center}
    %%%\@deptpref  \@dept \\
    %%%Faculty of Science \\
    %%%University of Cape Town
  %%%\end{center}
  %%%\vspace{.3in}
  %%%\extravspace{.3in}
  %%%\begin{center}
    %%%\@submitted
  %%%\end{center}
  %%%\clearpage
  %%%}}
\newcommand{\maketitlepage}{{
  \ifdefined\phantomsection
     % makes hyperref recognize this section properly for pdf links
     \phantomsection
     %%%%%\pdfbookmark[1]{Title Page}{titlepage}
    \else
    \fi 
  \thispagestyle{empty}
  \sc
  \vspace*{0in}
  \begin{center}
    \LARGE \@title
  \end{center}
  \vspace{1in}
  \extravspace{1in}
  \begin{center}
    \@author
  \end{center}
  \vspace{1in}
  \extravspace{1in}
  \begin{center}
    A Dissertation Submitted \\
    in Partial Fulfilment of the \\
    Requirements for the degree of \\
    Master of Science in \\
    Computer Science \\
  \end{center}
  \vspace{1in}
  \extravspace{1in}
  \begin{center}
    Department of Computer Science \\
    Faculty of Science \\
    University of Cape Town \\
  \vspace{.7in}
    Supervised by \\ 
    \@adviser
  \end{center}
  \vspace{.9in}
  \extravspace{.7in}
  \begin{center}
    \@submitted
  \end{center}
  \clearpage
  }}
\newcommand*{\makecopyrightpage}{
  \ifdefined\phantomsection
     % makes hyperref recognize this section properly for pdf links
     \phantomsection
     %%%%%\pdfbookmark[1]{Copyright Page}{copyright}
    \else
    \fi 
  \thispagestyle{empty}
  \vspace*{0in}
  \begin{center}
   %\Large \textbf{Copyright Statement}\\ % November 23, 2012 --phiri.
%Title on copyright page
    \vspace{2.0in}
    %\copyright\ Copyright by \@author, \@copyrightyear. \\
    %All rights reserved.
    \begin{center}
      \includegraphics{figures/cc-by.eps}  % creative commons licence image
    \end{center}
    \vspace{.2in}
    \normalsize{This work is licensed under a \href{http://creativecommons.org/licenses/by/3.0/deed.en_GB} {Creative Commons Attribution 3.0 Unported Licence}}
  \end{center}
  \clearpage}
%\newcommand*{\makedeclarationpage}{
%  \thispagestyle{empty}
%  \vspace*{0in}
%  \begin{center}
%  \Large \textbf{Plaigirism Declaration}\\
%    \vspace{.5in}
%    \normalsize{I know the meaning of plagiarism and declare that all the work
%in the document, save for which is properly acknowledged, is my own.}\\
%\vspace{.5in}
%\normalsize{\textbf{Lighton Phiri}}
%  \end{center}
%  \clearpage}

\def\makedeclarationpage{
  \ifx\@declaration\undefined
  \else
    \ifdefined\phantomsection
     % makes hyperref recognize this section properly for pdf links
     \phantomsection
    \else
    \fi

    %\addcontentsline{toc}{section}{Plaigirism Declaration}
    %%%%%\chapter*{Declaration}
    %%%%%%%%%%\begin{center}
      %%%%%%%%%%\Large \textbf{Declaration}
    %%%%%%%%%%\end{center}
    %%\begin{center}
      %%\Large \textbf{Declaration}
      %%\vspace{.2in}
    %%\end{center}
     \begin{center}
      \line(1,0){430}\\
      \vspace{.2in}
      %%%%%\large {Simple Digital Libraries}\\
      \Large \textbf{Simple Digital Libraries} \\
      \vspace{.3in}
      \Large \textbf{by} \\
      \vspace{.3in}
      \Large \textbf{Lighton Phiri} \\
      \vspace{.2in}
      \line(1,0){430}\\
      \vspace{.8in}
      %%%%%\section*{Plagiarism Declaration}
      \Large \textbf{Plagiarism Declaration} \\
      \vspace{.2in}
    \end{center}
    \@declaration
    \thispagestyle{empty}
    \vspace*{0in}
    \clearpage
  \fi
  }
\def\makeabstract{
  \ifx\@abstract\undefined
  \else
    \ifdefined\phantomsection
     % makes hyperref recognize this section properly for pdf links
     \phantomsection
     \pdfbookmark[1]{Abstract}{abstract}
    \else
    \fi

    % to include acknowledgements in toc, uncomment line below
   %%%%%\addcontentsline{toc}{section}{Abstract}
  %%%%%\chapter*{Abstract}
  \begin{center}
     \Large \textbf{Abstract}
     \vspace{.1in}
  \end{center}
  %%\begin{center}
  %%\Large \textbf{Abstract}\\
  %%\vspace{.2in}
  %%\large \textbf{Simple Digital Libraries}\\
  %%\vspace{.1in}
  %%\large{Lighton Phiri}\\
  %%\vspace{.1in}
  %%\large{Department of Computer Science}\\
  %%\large{University of Cape Town}\\
  %%\large{\href{mailto:lphiri@cs.uct.ac.za}{\nolinkurl{lphiri@cs.uct.ac.za}}}\\
  %%\vspace{.2in}
  %\Large \textbf{Abstract}
  %\vspace{.2in}
  %%\end{center}
  \@abstract
  \clearpage
  }
\def\makeacknowledgements{
  \ifx\@acknowledgements\undefined
  \else
    \ifdefined\phantomsection
     % makes hyperref recognize this section properly for pdf links
     \phantomsection
     \pdfbookmark[1]{Acknowledgements}{acknowledgements}
    \else
    \fi

    % to include acknowledgements in toc, uncomment line below
    %%%%%\addcontentsline{toc}{section}{Acknowledgements}
    %%%%%\chapter*{Acknowledgements}
    \begin{center}
      \Large \textbf{Acknowledgements}
      \vspace{.1in}
    \end{center}
    %%\begin{center}
      %%\Large \textbf{Acknowledgements}
      %%\vspace{.2in}
    %%\end{center}
    \@acknowledgements
    \clearpage
  \fi
  }
\def\makededication{
  \ifx\@dedication\undefined
  \else
    \ifdefined\phantomsection
     % makes hyperref recognize this section properly for pdf links
     \phantomsection
     %%%%%\pdfbookmark[1]{Dedication Page}{dedication}
    \else
    \fi
    \vspace*{1.5in}
    \begin{flushright}
      \@dedication
    \end{flushright}
    \clearpage
  \fi
  }
\DeclareOption{lot}{\renewcommand*{\makelot}{
  \ifdefined\phantomsection
    % makes hyperref recognize this section properly for pdf links
    \phantomsection
  \else
  \fi
  \addcontentsline{toc}{section}{List of Tables}\listoftables}}
\DeclareOption{logs}{\renewcommand*{\makelogs}{
  \ifdefined\phantomsection
    % makes hyperref recognize this section properly for pdf links
    \phantomsection
  \else
  \fi
  \addcontentsline{toc}{section}{List of Abbreviations}\glsaddall\printglossary[style=long]}}
\DeclareOption{lof}{\renewcommand*{\makelof}{
  \ifdefined\phantomsection
    % makes hyperref recognize this section properly for pdf links
    \phantomsection
  \else
  \fi
  \addcontentsline{toc}{section}{List of Figures}\listoffigures}}
\DeclareOption{los}{
  \renewcommand*{\makelos}{
    \RequirePackage{losymbol}
    \section*{List of Symbols\@mkboth {LIST OF SYMBOLS}{LIST OF SYMBOLS}}
    \@starttoc{los}
  \ifdefined\phantomsection
    % makes hyperref recognize this section properly for pdf links
    \phantomsection
  \else
  \fi
    \addcontentsline{toc}{section}{List of Symbols}
  }
}
\DeclareOption{singlespace}{
  \renewcommand*{\bodyspacing}{
  \singlespacing
  }
  %% Add extra space only if in singlespacing mode
  \renewcommand*{\extravspace}[1]{\vspace{#1}}
}
% August 10, 2013
% http://www.cl.cam.ac.uk/local/phd/typography/
\DeclareOption{onehalfspace}{
  \renewcommand*{\bodyspacing}{
  \singlespacing
  }
  % Add extra space only if in singlespacing mode
  % http://www.cl.cam.ac.uk/local/phd/typography/
  \renewcommand{\baselinestretch}{1.2} 
}
%% Doublespacing is the default for the thesis -- need not be declared.
\DeclareOption{doublespacing}{
  \renewcommand*{\bodyspacing}{
  \doublespacing
  }
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
%% Not necessary to specify the point size - we inherit it from above
%% \LoadClass[12pt]{report}
\LoadClass{report}
%\setlength{\oddsidemargin}{.5in}   %{.4375in}
%\setlength{\evensidemargin}{.5in} %{.4375in}
\setlength{\topmargin}{-.5in}  %{-.5625in}
\setlength{\footskip}{.25in} % to put page number 3/4" from the bottom of the page (1/4" from bottom of body text)
\setlength{\textheight}{9in}
\setlength{\textwidth}{6in}

%%% Alter LaTeX defaults to try to eliminate all widows and orphans
\clubpenalty=10000
\widowpenalty=10000

%%% try to avoid overfull lines by limiting how far it is okay to exceed the margins
%%% http://www.tex.ac.uk/cgi-bin/texfaq2html?label=overfull
\setlength{\emergencystretch}{2em}

\long\def\abstract#1{\gdef\@abstract{#1}}
%% 'begincmd' no longer used -- insert \makefrontmatter in the document instead. See above. 
%\AtBeginDocument{\begincmd}
\endinput
%% 
%% End of file `phiri-thesis.cls'.