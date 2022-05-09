%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Weston Robot Technical Document Template
% 
% Adapted from “Software Manual and Technical Document Template" by Overleaf
% https://www.overleaf.com/latex/templates/technical-document-template/mdgftpdfbvbs
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{westonrobot-technical}[2022/05/09 v1.0 Weston Robot Technical Document Template]

% set default smaller margins, separated paragraphs, bigger line spacing
% (fullpage used as fallback if geometry package removed from main preamble)
\RequirePackage{fullpage,parskip}
\linespread{1.1}

% use Roboto as the main font
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[sfdefault]{roboto}
\RequirePackage[scaled=0.95]{roboto-mono}
\RequirePackage{sfmath}

% to load graphics
\RequirePackage{graphicx}

% footer/header
\RequirePackage{fancyhdr}

% load the base class with default options
\LoadClass[12pt,a4paper]{article}

% extra front matter commands
%\DeclareRobustCommand*{\subtitle}[1]{\gdef\@subtitlecmd{#1}}
\DeclareRobustCommand*{\version}[1]{\gdef\@ver{Version #1}}

% default values
%\gdef\@subtitlecmd{\@latex@warning{No subtitle specified for title page. Ignoring.}}
\gdef\@ver{\@latex@warning{No version number specified for title page. Ignoring.}}

% modify the stock \maketitle command
\renewcommand\maketitle{
\begin{titlepage}
\vspace*{2.5cm}  
\centering
{\huge\bfseries\@title\par}
\bigskip
{\large	\@ver\par}
\vfill
%{\Large \@author\par}
%\@date
%\@logocmd\par
{\includegraphics[width=0.42\textwidth]{WestonRobotLogo}\par}
\end{titlepage}
}

% define header/footer
\pagestyle{fancy}
\fancyhf{}
\lfoot{\textcopyright\the\year{} Weston Robot Pte Ltd. All Rights Reserved.}
\rfoot{Page \thepage}

\renewcommand{\headrulewidth}{0pt}
%\renewcommand{\footrulewidth}{.5pt}

\AtEndPreamble{%
% set some hyperref options if it's loaded
% leave loading it to the user so they can get the order right
\@ifpackageloaded{hyperref}{%
\RequirePackage{xcolor}
\providecolor{manuallinkcolor}{HTML}{004a0e}
\hypersetup{colorlinks,allcolors=manuallinkcolor}%
}{}%
% let minted's listing captions use the correct font
\@ifpackageloaded{minted}{\let\@float@c@listing\@caption}{}
}