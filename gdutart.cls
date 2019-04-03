%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 广工本科毕业设计LaTeX模板
%% 作者: NickHopps
%% 版本: 1.0.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesPackage{gdutart} [2019/04/01 v1.0 Template for GDUT]
\RequirePackage{xkeyval}
\RequirePackage{etoolbox}
\newif\ifcoverpage
\coverpagetrue
\DeclareOptionX{nocoverpage}{\coverpagefalse}
\ifcoverpage%
  \define@key{GDUT}{subject}[]{\gdef\GDUT@info@subject{#1}}%
  \define@key{GDUT}{topic}[]{\gdef\GDUT@info@topic{#1}}%
  \define@key{GDUT}{college}[]{\gdef\GDUT@info@college{#1}}%
  \define@key{GDUT}{major}[]{\gdef\GDUT@info@major{#1}}%
  \define@key{GDUT}{grade}[]{\gdef\GDUT@info@grade{#1}}%
  \define@key{GDUT}{stuid}[]{\gdef\GDUT@info@stuid{#1}}%
  \define@key{GDUT}{name}[]{\gdef\GDUT@info@name{#1}}%
  \define@key{GDUT}{teacher}[]{\gdef\GDUT@info@teacher{#1}}%
  \setkeys{GDUT}{%
    subject = 本科毕业设计（论文）,
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
\LoadClass[a4paper, 12pt, notitlepage]{ctexart}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 引用的宏包
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{geometry}  % 设置页边距
\RequirePackage{fancyhdr}  % 设置页眉和页脚
\RequirePackage{amsthm, amsfonts, amsmath, bm}  % 数学环境
\RequirePackage{makecell, multirow, xltabular}  % 扩展表格
\RequirePackage{enumitem}  % 定制列表环境
\RequirePackage{graphicx}  % 插入图片
\RequirePackage{titlesec}  % 定制章节格式
\RequirePackage{tocloft}   % 定制目录格式
\RequirePackage{hyperref}  % 使用超链接

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 字体设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newfontfamily\heiti@num{SimHei}[AutoFakeBold=2]
\setCJKfamilyfont{heiti@bold}{SimHei}[AutoFakeBold=2]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 页面样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 页边距
\geometry{hmargin = 3.18cm, vmargin = 2.54cm}

% 自定义页眉和页脚
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% 自定义目录样式
\renewcommand{\contentsname}{\bfseries\zihao{3} \hspace*{\fill}目 \qquad 录\hspace*{\fill}}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{1.5}
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

% 自定义超链接样式
\hypersetup{colorlinks = true, linkcolor = black, anchorcolor = blue, citecolor = green, CJKbookmarks = true}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 正文样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 自定义章节样式
\titleformat{\section}{\bfseries\CJKfamily{heiti@bold}\zihao{3}\centering}{\heiti@num\thesection\quad}{0pt}{}
\titleformat{\subsection}{\bfseries\CJKfamily{heiti@bold}\zihao{-4}}{\heiti@num\thesubsection\quad}{0pt}{}
\titleformat{\subsubsection}{\heiti\zihao{-4}}{\heiti@num\thesubsubsection\quad}{0pt}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 显示封面
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifcoverpage
  \AtBeginDocument{%
    \thispagestyle{empty}\noindent%
    \begin{minipage}[c][\textheight][s]{\textwidth}
      \makebox[\textwidth][l]{\includegraphics[scale = 1.15]{img/logo.jpg}}
      \makebox[\textwidth][c]{\includegraphics[scale = 0.28]{img/brand.jpg}}\vspace{2.0cm}
      \makebox[\textwidth][c]{\bfseries\zihao{1}{\CJKfamily{heiti@bold}\GDUT@info@subject}}\vspace{3.0cm}
      \makebox[\textwidth][c]{\bfseries\zihao{2}{\CJKfamily{heiti@bold}\GDUT@info@topic}}\vspace{3.5cm}
      \begin{center}\bfseries\zihao{3}
        学\qquad\,院\quad\,\underline{\makebox[7cm][c]{\GDUT@info@college}}\medskip \\
        专\qquad\,业\quad\,\underline{\makebox[7cm][c]{\GDUT@info@major}}\medskip   \\
        年级班别\quad\,\underline{\makebox[7cm][c]{\heiti@num\mdseries\GDUT@info@grade}}\medskip       \\
        学\qquad\,号\quad\,\underline{\makebox[7cm][c]{\heiti@num\mdseries\GDUT@info@stuid}}\medskip   \\
        学生姓名\quad\,\underline{\makebox[7cm][c]{\GDUT@info@name}}\medskip        \\
        指导老师\quad\,\underline{\makebox[7cm][c]{\GDUT@info@teacher}}\medskip
      \end{center}\vfill
      \renewcommand{\today}{\bfseries {\heiti@num\mdseries\number\year} 年 {\heiti@num\mdseries\number\month} 月}
      \makebox[\textwidth][c]{\zihao{3}\today}
    \end{minipage}%
    \clearpage%
    \thispagestyle{empty}\makebox{}%
    \clearpage%
  }
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 生成目录
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{%
  \tableofcontents%
  \thispagestyle{empty}%
  \ifodd\value{page}%
    \clearpage%
    \thispagestyle{empty}\makebox{}%
    \clearpage%
  \else%
    \clearpage%
  \fi%
  \pagenumbering{arabic}%
}
