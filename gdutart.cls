%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 广工课程设计/论文LaTeX模板
%% 作者: NickHopps
%% 版本: 1.0.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesPackage{gdutart} [2018/08/20 v1.0 Template for GDUT]
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
    subject = 请填写科目名称,
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
\LoadClass[a4paper, 12pt, notitlepage, twoside]{ctexart}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 引用的宏包
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{geometry}  % 设置页边距
\RequirePackage{fancyhdr}  % 设置页眉和页脚
\RequirePackage{amsthm, amsfonts, amsmath, bm}            % 扩展数学环境 
\RequirePackage{bigstrut, makecell, multirow, xltabular}  % 扩展表格
\RequirePackage{enumitem}  % 定制列表环境
\RequirePackage{graphicx}  % 插入图片
\RequirePackage{titlesec}  % 修改章节格式
\RequirePackage{tocloft}   % 修改目录样式
\RequirePackage{hyperref}  % 使用超链接

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 设置页面样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 页边距
\geometry{hmargin = 3.18cm, vmargin = 2.54cm}
% 设置页眉和页脚为空
\pagestyle{empty}
% 自定义页眉和页脚
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LO, RE]{\rightmark}
\fancyhead[RO, LE]{第 \thepage 页}
\setlength{\headheight}{15pt}
% 自定义目录样式
\renewcommand{\contentsname}{\hspace*{\fill}目 \quad 录\hspace*{\fill}}
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
% 自定义章节样式
\setcounter{secnumdepth}{5}
\titleformat{\section}[block]{\bf\zihao{3}}{\thesection.}{0.7em}{}
\titleformat{\subsection}[block]{\bf\zihao{4}}{\thesubsection.}{0.7em}{}
\titleformat{\subsubsection}[block]{\bf\zihao{-4}}{\thesubsubsection.}{0.7em}{}
\renewcommand{\theparagraph}{\arabic{paragraph}}
\titleformat{\paragraph}[block]{\bf\zihao{-4}}{\theparagraph.}{0.7em}{}
\renewcommand{\thesubparagraph}{(\arabic{subparagraph})}
\titleformat{\subparagraph}[block]{\bf\zihao{-4}}{\thesubparagraph}{0.7em}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 定义特殊格式（用户自定义格式）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 自定义表格格式（居中且动态宽度）
\newcolumntype{Y}{>{\centering\arraybackslash}X}
% 定义罗马数字形式
\newcommand{\RNum}[1]{\uppercase\expandafter{\romannumeral #1\relax}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 设置字体样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 衬线字体
\setCJKmainfont[BoldFont = {SimHei}, ItalicFont = {KaiTi}]{SimSun}
% 无衬线字体
\setCJKsansfont[BoldFont = {}, ItalicFont = {}]{}
% 等宽字体/打印机字体
\setCJKmonofont[BoldFont = {}, ItalicFont = {}]{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 显示封面
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifcoverpage
  \AtBeginDocument{%
    \thispagestyle{empty}\noindent%
    \begin{minipage}[c][\textheight][s]{\textwidth}
      \makebox[\textwidth][l]{\includegraphics[scale = 1.15]{img/logo.jpg}}
      \makebox[\textwidth][c]{\includegraphics[scale = 0.25]{img/brand.jpg}}\vspace{3em}
      \makebox[\textwidth][c]{\zihao{1}\bf{\GDUT@info@subject}}\vspace{6em}
      \makebox[\textwidth][c]{\zihao{2}\bf{\GDUT@info@topic}}\vspace{3em}
      \begin{center}
        \zihao{3}
        学\qquad\,院\quad\,\underline{\makebox[7cm][c]{\GDUT@info@college}}\medskip \\
        专\qquad\,业\quad\,\underline{\makebox[7cm][c]{\GDUT@info@major}}\medskip   \\
        年级班别\quad\,\underline{\makebox[7cm][c]{\GDUT@info@grade}}\medskip       \\
        学\qquad\,号\quad\,\underline{\makebox[7cm][c]{\GDUT@info@stuid}}\medskip   \\
        学生姓名\quad\,\underline{\makebox[7cm][c]{\GDUT@info@name}}\medskip        \\
        指导老师\quad\,\underline{\makebox[7cm][c]{\GDUT@info@teacher}}\medskip
      \end{center}\vfill
      \renewcommand{\today}{\number\year 年 \number\month 月}
      \makebox[\textwidth][c]{\zihao{3} \today}
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
