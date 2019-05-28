
let s:path = expand('<sfile>:h')

" 以管理员权限运行命令
fun! vlw#admin(cmdline)
    return system('cscript ' . shellescape(s:path . '\admin.js') . ' ' . a:cmdline)
endf

" 添加到右键菜单
fun! vlw#add_rightmenu()
    " 应用程序路径 gvim.exe | nvim-qt.exe
    let path = v:progpath
    if path =~ 'nvim\.exe$'
        let gui_path = fnamemodify(path, ':h') . '\nvim-qt.exe'
        if executable(gui_path)
            let path = gui_path
        endif
    endif
    echo 'The program is' path

    call vlw#admin('cscript ' . shellescape(s:path . '\rightmenu.js') . ' ' . shellescape(path))
    echo 'success'
endf

" 编辑环境变量
fun! vlw#envedit(...)
    let var = a:0 ? a:1 : ''
    if empty(var)
        let var = input('Which environment variable: ', '', 'environment')
    endif
    if empty(var) | return | endif

    exe 'e' '[ENVAR] ' . var
    setl bh=wipe
    au BufWriteCmd <buffer> call vlw#envwrite()

    inoremap <buffer><expr><tab>   pumvisible() ? "\<c-n>" : "\<c-x>\<c-f>"
    inoremap <buffer><expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-x>\<c-f>"

    let b:env2edit = var
    let b:coc_suggest_disable = 1

    call setline(1, split(vlw#getenv(var), ';'))
endf

fun! vlw#envwrite()
    let data = join(getline(1, '$'), ';')
    call vlw#setenv(b:env2edit, data)
    set nomodified
    " call vim#closefile()
endf

let s:env_script = shellescape(s:path . '\get-set-env.vbs')
echo s:env_script
" 获取环境变量
fun! vlw#getenv(env)
    let l = systemlist('cscript.exe /nologo ' . s:env_script . ' /g ' . a:env)
    return empty(l) ? '': substitute(l[0], '[\r\n]\+$', '', '')
endf

" 设置环境变量
fun! vlw#setenv(env, var)
    call system('cscript.exe /nologo ' . s:env_script . ' /s ' . a:env, a:var)
endf
