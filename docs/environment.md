# Environment and Execution / 环境与运行

本地验证使用 Windows、MWORKS.Syslab 2026b（26.6.1.8422）及其 Julia 1.10.10 运行时。项目依赖 Julia Base 与标准库 `Random`、`Printf` 和 `Test`，无需安装额外包。

Local verification uses Windows, MWORKS.Syslab 2026b (26.6.1.8422), and its Julia 1.10.10 runtime. The projects use Julia Base and the standard libraries `Random`, `Printf`, and `Test`; no additional packages are required.

在 Syslab 中打开并运行脚本。需要通过 `include` 使用函数时，交互程序可在包含脚本后显式调用 `main()`。由于多个交互应用可能定义同名入口，请分别在独立会话或模块中运行。

Open a script in Syslab and run it. For function-based use with `include`, call `main()` explicitly after including an interactive application. Run interactive applications in separate sessions or modules because their entry points may share a name.

文本分析器通过 `@__DIR__` 与 `joinpath` 定位默认语料，不依赖当前工作目录。命令行也可传入其他语料路径；输入文本需为有效 UTF-8。

Text analyzers resolve default corpora with `@__DIR__` and `joinpath`, independent of the current working directory. An alternate corpus path can be supplied on the command line. Input text must be valid UTF-8.

控制台运行方式见各项目 README。兼容 Julia 1.10 的独立运行时应支持相同的 Base 与标准库 API；记录的自动化验证由上述 MWORKS Julia 环境完成。

Console commands appear in each project README. A standalone Julia 1.10 runtime should provide the same Base and standard-library APIs; the recorded automated checks used the MWORKS Julia runtime listed above.
