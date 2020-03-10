# 广东工业大学毕业设计/论文LaTeX模板

# 目录结构

```
├─ img/
├─ ref/
│  ├── GBT7714/           论文引用国家标准
│  └── refs.bib           本地 bible 文件
├─ tex/                   模块化的 Tex 文件
├─ tools/
│  └── Excel2LaTeX Excel  转 latex 表格
├─ gdutart.cls            GDUT 论文模板文档类
├─ gdutbib.sty            GDUT 论文引用格式
├─ makepdf.bat            Windows 用编译脚本
├─ makepdf.sh             Linux 用编译脚本
└─ thesis.tex             Tex 文件入口
```

# 使用方法

```latex
\documentclass{gdutart}
\infosetup{
  subject = 本科毕业设计/论文,
  topic   = 题目,
  college = 学院,
  major   = 专业,
  grade   = 年级,
  stuid   = 学号,
  name    = 姓名,
  teacher = 老师
}

\begin{document}
...
\end{document}
```

如果不需要封面，可以使用参数 `nocoverpage`：

```latex
\documentclass[nocoverpage]{gdutart}
```
