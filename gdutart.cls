%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 广工本科毕业设计（论文）LaTeX模板
%% 作者: NickHopps
%% 版本: 2.0.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesPackage{gdutart} [2019/04/01 v1.0 Graduation project template for GDUT]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 加载工具包
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{xkeyval}
\RequirePackage{etoolbox}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 引用的宏包和类
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass[UTF8, zihao=-4, a4paper]{ctexart}
\RequirePackage{geometry}  % 设置页边距
\RequirePackage{fancyhdr}  % 设置页眉和页脚
\RequirePackage{titlesec}  % 定制章节格式
\RequirePackage{tocloft}   % 定制目录格式
\RequirePackage[nottoc]{tocbibind} %扩展目录显示
\RequirePackage{hyperref}  % 使用超链接
\RequirePackage{enumitem}  % 定制列表环境
\RequirePackage{graphicx}  % 插入图片
\RequirePackage{caption}   % 标题控制
\RequirePackage{gbt7714}   % 定制参考文献
\RequirePackage{amsfonts, amsthm, amsmath, bm}  % 数学环境
\RequirePackage{array, bigstrut, booktabs, makecell, multirow, xltabular}  % 扩展表格

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 字体设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setmainfont{Times New Roman}
\setCJKmainfont{Source Han Serif CN}
\setCJKfamilyfont{shs}[BoldFont=Source Han Sans CN Bold]{Source Han Sans CN}
\renewcommand\heiti{\CJKfamily{shs}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 页面样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 自定义页边距
\geometry{top=3.0cm, bottom=2.5cm, left=3.0cm, right=2.0cm}

% 自定义页眉和页脚
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[R]{\zihao{-5}\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% 自定义行间距
\linespread{1.5}

% 自定义目录样式
\renewcommand{\contentsname}{\heiti\zihao{3}\bfseries{\hspace*{\fill}目 \qquad 录\hspace*{\fill}}}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{0}
\setlength{\cftbeforesecskip}{10pt}
\renewcommand{\cftsecdotsep}{\cftdotsep}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\numberline}[1]{%
  \settowidth\@tempdimb{#1\hspace{0.5em}}%
  \ifdim\@tempdima<\@tempdimb%
    \@tempdima=\@tempdimb%
  \fi%
  \hb@xt@\@tempdima{\@cftbsnum #1\@cftasnum\hfil}\@cftasnumb%
}
\renewcommand{\cftsecfont}{\heiti\zihao{-4}}
\renewcommand{\cftsecpagefont}{\heiti\zihao{-4}}

% 自定义超链接样式
\hypersetup{colorlinks=true, linkcolor = black, anchorcolor = blue, citecolor = green, CJKbookmarks = true}

% CTEX初始化
\ctexset{
  abstractname = {摘要},
  bibname = {参考文献}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 摘要样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\cabstractname{设计总说明}
\newcommand\ckeywordsname{{\heiti\zihao{4}\bfseries{关键词}}}
\newcommand\ckeywords[1]{{\zihao{-4}\ckeywordsname: #1}}

\newcommand\eabstractname{General Design Notes}
\newcommand\ekeywordsname{{\zihao{4}\bfseries{Key Words}}}
\newcommand\ekeywords[1]{\zihao{-4}\ekeywordsname: #1}

\newenvironment{cabstract}{%
  \thispagestyle{empty}\noindent
  \titleformat*{\section}{\heiti\zihao{3}\bfseries\filcenter}
  \section*{\cabstractname}
  \zihao{-4}%
}{\par\vspace{1em}\par}

\newenvironment{eabstract}{%
  \thispagestyle{empty}\noindent
  \titleformat*{\section}{\zihao{3}\bfseries\filcenter}
  \section*{\eabstractname}
  \zihao{-4}%
}{\par\vspace{1em}\par}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 正文样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 自定义章节样式
\titleformat{\section}{\heiti\zihao{3}\bfseries\filcenter}{\thesection\quad}{0pt}{}
\titleformat{\subsection}{\heiti\zihao{-4}\bfseries}{\thesubsection\quad}{0pt}{}
\titleformat{\subsubsection}{\heiti\zihao{-4}}{\thesubsubsection\quad}{0pt}{}

% 自定义图表格式
\newcommand{\figref}[1]{{图~\ref{fig:#1}}}
\newcommand{\tabref}[1]{{表~\ref{tab:#1}}}
\newcommand{\figcaption}{\def\@captype{figure}\caption}
\newcommand{\tabcaption}{\def\@captype{table}\caption}
\newcolumntype{Y}{>{\centering\arraybackslash}X} % centering solution for tabularx

% 自定义图/表序
\numberwithin{table}{section}
\numberwithin{figure}{section}
\DeclareCaptionLabelFormat{tablabel}{{\heiti\zihao{5} #1~\rmfamily #2}}
\DeclareCaptionLabelFormat{figlabel}{{\zihao{5} #1~\rmfamily #2}}
\DeclareCaptionLabelSeparator{floatsong}{\hspace{1em}}
\DeclareCaptionFont{tabcap}{\heiti\zihao{5}\bfseries}
\DeclareCaptionFont{figcap}{\zihao{5}}
\captionsetup[table]{position=top,belowskip=-0.2em,aboveskip=0.1em,labelformat=tablabel,labelsep=floatsong,font=tabcap}
\captionsetup[figure]{position=bottom,belowskip=0.1em,aboveskip=-0.2em,labelformat=figlabel,labelsep=floatsong,font=figcap}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 设置封面
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifcoverpage
\coverpagetrue
\DeclareOptionX{nocoverpage}{\coverpagefalse}
\ifcoverpage%
  \define@key{GDUT}{topic}[]{\gdef\GDUT@info@topic{#1}}%
  \define@key{GDUT}{college}[]{\gdef\GDUT@info@college{#1}}%
  \define@key{GDUT}{major}[]{\gdef\GDUT@info@major{#1}}%
  \define@key{GDUT}{grade}[]{\gdef\GDUT@info@grade{#1}}%
  \define@key{GDUT}{stuid}[]{\gdef\GDUT@info@stuid{#1}}%
  \define@key{GDUT}{name}[]{\gdef\GDUT@info@name{#1}}%
  \define@key{GDUT}{teacher}[]{\gdef\GDUT@info@teacher{#1}}%
  \setkeys{GDUT}{%
    topic   = 请填写课题名称,
    college = 请填写学院,
    major   = 请填写专业,
    grade   = 请填写年级,
    stuid   = 请填写学号,
    name    = 请填写姓名,
    teacher = 请填写指导老师%
  }
  \newcommand{\infosetup}[1]{\setkeys{GDUT}{#1}}%
\fi
\ProcessOptionsX\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 显示封面
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifcoverpage
  \AtBeginDocument{%
    \thispagestyle{empty}\noindent
    \begin{flushleft}
      \hspace{8.5mm}\includegraphics[height=2.19cm, width=2.21cm]{img/logo.jpg}
    \end{flushleft}
    \begin{center}
      \includegraphics[height=2.96cm, width=10.56cm]{img/brand.jpg}
    \end{center}
    \vspace{6.5mm}
    \begin{center}
      {\heiti\bfseries\zihao{1}{本科毕业设计（论文）}}
    \end{center}
    \vspace{20mm}
    \begin{center}
      {\heiti\bfseries\zihao{2}{\GDUT@info@topic}}
    \end{center}
    \vspace{28mm}
    \begin{center}
      \heiti\bfseries\zihao{3}
      学\qquad\,院\quad\,\underline{\makebox[7cm][c]{\GDUT@info@college}}\medskip \\
      专\qquad\,业\quad\,\underline{\makebox[7cm][c]{\GDUT@info@major}}\medskip   \\
      年级班别\quad\,\underline{\makebox[7cm][c]{\GDUT@info@grade}}\medskip       \\
      学\qquad\,号\quad\,\underline{\makebox[7cm][c]{\GDUT@info@stuid}}\medskip   \\
      学生姓名\quad\,\underline{\makebox[7cm][c]{\GDUT@info@name}}\medskip        \\
      指导老师\quad\,\underline{\makebox[7cm][c]{\GDUT@info@teacher}}\medskip
    \end{center}
    \vfill
    \begin{center}
      \renewcommand{\today}{\heiti\bfseries \number\year 年 \number\month 月}
      \makebox[\textwidth][c]{\zihao{3}\today}
    \end{center}
    \clearpage%
  }
\fi



