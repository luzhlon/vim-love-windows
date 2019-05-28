
Set args = WScript.Arguments
if args.count = 2 then
    Set env = CreateObject("WScript.Shell").Environment("User")
    if args(0) = "/g" then
        WScript.echo env(args(1))
    elseif args(0) = "/s" then
        data = WScript.StdIn.ReadLine()
        if data <> "" then
            env(args(1)) = data
        end if
    end if
end if
