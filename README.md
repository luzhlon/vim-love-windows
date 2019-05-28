
在右键菜单中添加‘Open with (neo)vim’，支持gvim、nvim-qt：

* 在配置中加入`com! RightMenu call vlw#add_rightmenu()`
* 执行`:RightMenu`命令

编辑(全局)环境变量：

* 在配置中加入`com! -nargs=? -complete=environment EnvEdit call vlw#envedit(<q-args>)`
* 执行`:EnvEdit PATH`命令，编辑环境变量
* 编辑完成后，执行`:w`保存即可更改环境变量

