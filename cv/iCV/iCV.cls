\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iCV}[2016/07/12 v.1.0 New curriculum vitae class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*\relax
\LoadClass{article}

\RequirePackage{ifthen}

\RequirePackage[english]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\renewcommand{\rmdefault}{ppl}
\linespread{1.05}
\RequirePackage{geometry}
\geometry{
 left=20mm,
 right=20mm,
 top=25mm,
 bottom=25mm,
}
\RequirePackage{array,booktabs,ragged2e}
\newcolumntype{R}[1]{>{\RaggedLeft\arraybackslash}p{#1}}
\RequirePackage{multirow}
\RequirePackage{hyperref}
\hypersetup{pdfpagemode=UseNone,pdfstartview=Fit,pdfview=Fit,colorlinks=true,linkcolor=[rgb]{0,0.349,0.608},urlcolor=[rgb]{0,0.349,0.608},linktoc=page,bookmarksopen=false,bookmarksnumbered=false}
\RequirePackage{graphicx}
\graphicspath{{./iPics/}}
\RequirePackage{enumitem}
\setlist[itemize]{leftmargin=*}
\renewcommand*\footnoterule{\vspace{3\baselineskip}}
\RequirePackage{longtable}
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\fancyfoot[R]{\scriptsize{\thepage\ }}% \textit{of} \pageref*{LastPage}}}
\fancyfoot[C]{}
\renewcommand{\headrulewidth}{0pt}
\pagestyle{fancy}
\RequirePackage{etoolbox}
\setlength{\parindent}{0pt}
\renewcommand{\thefootnote}{\Roman{footnote}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ICVCOLOR

\RequirePackage{color}
\definecolor{iCVcolor}{rgb}{0,0,0}
\newcommand{\iCVcolor}[1]{
	\ifthenelse{\equal{#1}{blueUnina}}{ \definecolor{iCVcolor}{rgb}{0.2, 0.4, 0.6} }
	{
		\ifthenelse{\equal{#1}{greenRS7}}{ \definecolor{iCVcolor}{rgb}{0, 0.5, 0} }
		{
			\ifthenelse{\equal{#1}{grigiolino}}{ \definecolor{iCVcolor}{rgb}{0.314, 0.314, 0.314} }
			{
				\definecolor{iCVcolor}{rgb}{0,0,0}
			}
		}
	}
}
\newcommand*\ruleline[1]{\par\raisebox{.8ex}{\makebox[\linewidth]{\textcolor{iCVcolor}{\hrulefill}\hspace{.7071069cm}\raisebox{-.8ex}{#1}\hspace{.7071069cm}\textcolor{iCVcolor}{\hrulefill}}}}
\renewcommand*\ruleline[1]{\par\raisebox{.8ex}{\makebox[\linewidth+3.5ex]{\textcolor{iCVcolor}{\hrulefill}\hspace{.7071069cm}\raisebox{-.8ex}{#1}\hspace{.7071069cm}\textcolor{iCVcolor}{\hrulefill}}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ICVSPACES

\RequirePackage{calc}
\newlength{\spacebetweensections}
\newlength{\spacebetweenentries}
\newlength{\iCVentryleft}
\newlength{\iCVentryright}
\newlength{\quadlength}
\newlength{\pigrecolength}
\newlength{\halfpigrecolength}
\newlength{\thesistitle}
\newlength{\thesisfield}
\newlength{\thesissupervisor}
\newlength{\photowidth}
\setlength{\spacebetweensections}{0.628cm}
\setlength{\spacebetweenentries}{0.314cm}
\setlength{\iCVentryleft}{\textwidth * \real{0.2}}
\setlength{\iCVentryright}{\textwidth * \real{0.8}}
\settowidth{\quadlength}{\quad}
\settowidth{\pigrecolength}{picreco}
\setlength{\halfpigrecolength}{\pigrecolength * \real{0.5}}
\settowidth{\thesistitle}{\textsc{Thesis title}:}
\settowidth{\thesisfield}{\textsc{Thesis field}:}
\settowidth{\thesissupervisor}{\textsc{Thesis supervisor}:}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ICVNAME

\newcommand{\iCVname}[2]{
%	\noindent{
%		\fontsize{30}{25}\selectfont
%		\textsc{#1 #2}
%	}
%	\newline
	\newcommand{\name}{#1}
	\newcommand{\surname}{#2}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ICVBIGNAME

\newcommand{\iCVbigname}[2]{
%	\noindent
%	\begin{minipage}[t]{\textwidth}
%		\fontsize{50}{40}\selectfont
%		\textsc{#1\\#2}
%	\end{minipage}
%	\newline
	\newcommand{\bigname}{#1}
	\newcommand{\bigsurname}{#2}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ICVPHOTO

%\RequirePackage{tikz}
\newcommand{\iCVphoto}[2]{
	\newcommand{\photodim}{#1}
	\newcommand{\photofile}{#2}
	\setlength{\photowidth}{\textwidth / 100 * \photodim * \real{0.314}}
%	\newlength{\halfphotowidth}
%	\setlength{\halfphotowidth}{\photowidth * \real{0.5}}
%	\setlength{\photowidth}{\textwidth / 100 * #1 * \real{0.314}}
%	\setlength{\halfphotowidth}{\photowidth * \real{0.5}}
%	\tikz[remember picture,overlay]
%		\node[anchor=north east,inner sep=50pt] at (current page.north east) { \includegraphics[width=\photowidth]{#2} };
%	\raisebox{ \halfphotowidth }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ICVMAKEHEADING

\newcommand{\iCVmakeheading}{
	\begin{minipage}[c]{0.686\textwidth}
		\ifdef{\name}{
			\fontsize{30}{25}\selectfont
			\textsc{\name~\surname}
		}{}
		\ifdef{\bigname}{
			\fontsize{50}{40}\selectfont
			\textsc{\bigname \\[\spacebetweenentries] \bigsurname}
		}{}
	\end{minipage}%
	\begin{minipage}[c]{0.314\textwidth}
		\centering
		\ifdef{\photofile}{\includegraphics[width=\photowidth]{\photofile}}{}
	\end{minipage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ICVDATE

\newcommand{\iCVdate}{
	\vfill
	\today
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ICVSECTION

\newenvironment{iCVsection}[1]{
	\vspace{\spacebetweensections}
	\ruleline{\textcolor{iCVcolor}{\textbf{\textsc{\Large{#1}}}}}
	\vspace{-\spacebetweenentries}
	\newline
}
{
%	\vspace{-\baselineskip}
	\vspace{-\spacebetweenentries}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ICVENTRY


\newcommand{\rulesep}{\unskip\ \vrule\ }
%\newcommand{\iCVentry}[2]{
%\begin{minipage}[c]{\iCVentryleft}
%		\centering
%		#1
%	\end{minipage}
%	\rulesep
%	\quad
%	\hfill
%	\begin{minipage}[c]{\iCVentryright}
%		#2
%	\end{minipage}
%	\\[\spacebetweenentries]
%}
%% costretto a definire un ENVIRONMENT iCVentry: si può fare di meglio per togliere la ridondanza?
\newenvironment{iCVentry}[1]{
\begin{minipage}[c]{\iCVentryleft}
		\centering
		\textsc{#1}
	\end{minipage}
	\rulesep
	\quad
	\hfill
	\begin{minipage}[c]{\iCVentryright}
}
{		
	\end{minipage}
	\\[\spacebetweenentries]
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ICVENTRY*
%
%\RequirePackage{suffix}
%\WithSuffix\newcommand\iCVentry*[2]{
%\begin{minipage}[c]{0.4\textwidth}
%		\flushright
%		#1
%	\end{minipage}
%	\quad
%	\begin{minipage}[c]{0.6\textwidth}
%		#2
%	\end{minipage}
%	\\[\spacebetweenentries]
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ICVPERSONALINFOENTRY

\newcommand\iCVpersonalinfoentry[2]{
\begin{minipage}[c]{0.4\textwidth}
		\flushright
		\textsc{#1}
	\end{minipage}
	\quad
	\begin{minipage}[c]{0.6\textwidth}
		#2
	\end{minipage}
	\\[\spacebetweenentries]
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ICVPERSONALINFO

\newcommand{\iCVpersonalinfo}[7]{
	\begin{iCVsection}{Personal Information}
		\ifdef{\name}{
			\iCVpersonalinfoentry{\sc name}{\name~\surname}
		}{}
		\ifdef{\bigname}{
			\iCVpersonalinfoentry{\sc name}{\bigname~\bigsurname}
		}{}
		\iCVpersonalinfoentry{\sc date and \\place of birth}{#1}
		\iCVpersonalinfoentry{\sc nationality}{#2}
		\iCVpersonalinfoentry{\sc address}{#3}
		\iCVpersonalinfoentry{\sc contacts}{
			\ifstrempty{#4}{}{\raisebox{-3.14pt}{\includegraphics[height=12pt]{phone.png}} \hspace{0.1\spacebetweenentries} \href{tel:#4}{#4}\\[0.314\spacebetweenentries]}
			\ifstrempty{#5}{}{\raisebox{-3.14pt}{\includegraphics[height=12pt]{mail.png}} \hspace{0.1\spacebetweenentries} \href{mailto:#5}{#5}\\[0.314\spacebetweenentries]}
			\ifstrempty{#6}{}{\raisebox{-3.14pt}{\includegraphics[height=12pt]{skype.png}} \hspace{0.1\spacebetweenentries} \href{skype:#6?call}{#6}\\[0.314\spacebetweenentries]}
			\ifstrempty{#7}{\vspace{-1.314\spacebetweenentries}}{\raisebox{-3.14pt}{\includegraphics[height=12pt]{website.png}} \hspace{0.1\spacebetweenentries} \href{#7}{#7}}
		}
	\end{iCVsection}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ICVPERSONALINFOSHORT

\newcommand{\iCVpersonalinfoshort}[5]{
	\begin{iCVsection}{Personal Information}
		\iCVpersonalinfoentry{\sc address}{#1}
		\iCVpersonalinfoentry{\sc contacts}{
			\ifstrempty{#2}{}{\raisebox{-3.14pt}{\includegraphics[height=12pt]{phone.png}} \hspace{0.1\spacebetweenentries} \href{tel:#2}{#2}\\[0.314\spacebetweenentries]}
			\ifstrempty{#3}{}{\raisebox{-3.14pt}{\includegraphics[height=12pt]{mail.png}} \hspace{0.1\spacebetweenentries} \href{mailto:#3}{#3}\\[0.314\spacebetweenentries]}
			\ifstrempty{#4}{}{\raisebox{-3.14pt}{\includegraphics[height=12pt]{skype.png}} \hspace{0.1\spacebetweenentries} \href{skype:#4?call}{#4}\\[0.314\spacebetweenentries]}
			\ifstrempty{#5}{\vspace{-1.314\spacebetweenentries}}{\raisebox{-3.14pt}{\includegraphics[height=12pt]{website.png}} \hspace{0.1\spacebetweenentries} \href{#5}{#5}}
		}
	\end{iCVsection}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ICVWORKEXPERIENCE

\newcommand{\iCVworkexperience}[6]{
	\begin{iCVentry}{#1~$-$\\#2}
		\textbf{#3}\\
		\textit{#4}, #5\\
		\hspace*{\pigrecolength}\begin{minipage}[t]{\iCVentryright-\pigrecolength}
			{\footnotesize #6}
		\end{minipage}
	\end{iCVentry}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ICVEDUCATION

\newcommand{\iCVeducation}[8]{
	\begin{iCVentry}{#1~$-$\\#2}
		\textbf{#3} \\
		\textit{#4}\\
		\ifstrempty{#6}{
			\ifstrempty{#7}{
				\ifstrempty{#8}{
					\hspace*{\halfpigrecolength} \footnotesize Final degree mark: #5
				}{}
			}{}
		}{
			\ifstrempty{#7}{}{
				\ifstrempty{#8}{}{
					\hspace*{\halfpigrecolength}\begin{minipage}[t]{\iCVentryright-\halfpigrecolength+\quadlength}
						\footnotesize
						Final degree mark: #5 \\[0.5\spacebetweenentries]
						\hspace*{\halfpigrecolength}\begin{minipage}[t]{\iCVentryright-\pigrecolength+\quadlength}
							\textsc{Thesis title}: \begin{minipage}[t]{\iCVentryright-\pigrecolength-\thesistitle+\quadlength}
								#6
							\end{minipage}\\[0.5\spacebetweenentries]
							\textsc{Thesis field}: \begin{minipage}[t]{\iCVentryright-\pigrecolength-\thesisfield+\quadlength}
								#7
							\end{minipage}\\[0.5\spacebetweenentries]
							\textsc{Thesis supervisor}: \begin{minipage}[t]{\iCVentryright-\pigrecolength-\thesissupervisor+1.57\quadlength}
								#8
							\end{minipage}
						\end{minipage}
					\end{minipage}
				}
			}
		}
	\end{iCVentry}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ICVGROUP

\newenvironment{iCVgroup}[1]{
	\newcommand{\iCVitem}[2]{
		##1\\
		{\footnotesize\textit{##2}}\\[\spacebetweenentries]
	}
	\newcommand{\iCVpaper}[3]{
		##1, ``##2''\\
		{\footnotesize\textit{##3}}\\[\spacebetweenentries]
	}
	\begin{iCVentry}{#1}
} {
	\vspace{-\baselineskip}
	\vspace{-0.314cm}
	\end{iCVentry}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ICVLANGUAGETABLE

\ifdef{\language}{}{\newcommand{\language}{}}
\newenvironment{iCVlanguagetable}[1]{
	\newcommand{\iCVlanguage}[5]{
		##1 & ##2 & ##3 & ##4 & ##5\\
	}
	\ifstrempty{#1}{\renewcommand{\language}{Languages}}{\renewcommand{\language}{#1}}
	\begin{iCVentry}{\language}
		\begin{tabular}{lcccc}
			\toprule
			 & Reading & Listening & Speaking & Writing \\
			 \midrule
} {			
			\bottomrule
		\end{tabular}
	\end{iCVentry}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
