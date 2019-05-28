
// 创建右键菜单：Open with GVim | Neovim

var WshShell = WScript.CreateObject("WScript.Shell");

var fs = WScript.CreateObject("Scripting.FileSystemObject");
var curfolder = fs.GetFile(WScript.ScriptFullName).ParentFolder;

var path = WScript.Arguments(0);

if (path.match(/gvim\.exe$/)) {
    // 以'\'结尾表示写默认值
    WshShell.RegWrite('HKCR\\*\\shell\\Open with GVim\\', '');
    WshShell.RegWrite('HKCR\\*\\shell\\Open with GVim\\Icon', path);
    WshShell.RegWrite('HKCR\\*\\shell\\Open with GVim\\command\\', '"' + path + '"' + ' "%1"');
    // 文件夹空白处
    WshShell.RegWrite('HKLM\\SOFTWARE\\Classes\\Directory\\background\\shell\\Open in vim\\', '')
    WshShell.RegWrite('HKLM\\SOFTWARE\\Classes\\Directory\\background\\shell\\Open in vim\\Icon', path)
    WshShell.RegWrite('HKLM\\SOFTWARE\\Classes\\Directory\\background\\shell\\Open in vim\\command\\', '"' + path + '"');
} else {
    // 以'\'结尾表示写默认值
    WshShell.RegWrite('HKCR\\*\\shell\\Open with Neovim\\', '');
    WshShell.RegWrite('HKCR\\*\\shell\\Open with Neovim\\Icon', path);
    WshShell.RegWrite('HKCR\\*\\shell\\Open with Neovim\\command\\', '"' + path + '"' + ' "%1"');
    // 文件夹空白处
    WshShell.RegWrite('HKLM\\SOFTWARE\\Classes\\Directory\\background\\shell\\Open in neovim\\', '')
    WshShell.RegWrite('HKLM\\SOFTWARE\\Classes\\Directory\\background\\shell\\Open in neovim\\Icon', path)
    WshShell.RegWrite('HKLM\\SOFTWARE\\Classes\\Directory\\background\\shell\\Open in neovim\\command\\', '"' + path + '"');
}
