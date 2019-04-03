# 广东工业大学毕业设计/论文LaTeX模板

# 使用方法

```latex
\documentclass{gdutart}
\infosetup{
  subject = XXX课程设计,
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
