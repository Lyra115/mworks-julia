# Environment and Execution

The local verification environment is MWORKS.Syslab 2026b, version 26.6.1.8422, with its Julia 1.10.10 runtime on Windows. The examples use Base and the standard libraries Printf and Test, with no additional packages.

Open the repository in Syslab, select a script, and execute it with the Julia runtime. For an include-based workflow, call the interactive script's `main()` explicitly after including it. Start separate sessions or modules for different interactive applications to avoid replacing identically named entry points.

The corpus path uses `@__DIR__` and `joinpath`; launching a script from another folder does not require changing the global working directory. An explicit corpus path can be passed on the command line. Input text must be valid UTF-8.

The console equivalents are shown in each project's README. A standalone Julia 1.10 installation should support the same Base/standard-library APIs; the recorded checks below were performed using the MWORKS-provided runtime.
