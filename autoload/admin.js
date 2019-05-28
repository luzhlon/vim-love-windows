
var args = WScript.Arguments;
var app = WScript.CreateObject("Shell.Application");

var Args = [];

for (var i = 1; i < args.length; ++i) {
    Args[i - 1] = args(i);
}

app.ShellExecute(args(0), Args.join(' '), '', 'runas', 1)
WScript.Quit()
// app.ShellExecute(args(0), Args, '', 'runas', 1)

// qrun.vim@any: cscript % cmd.exe /c gvim.exe
