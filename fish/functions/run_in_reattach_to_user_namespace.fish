function run_in_reattach_to_user_namespace
    if test (uname) = "Darwin"
        reattach-to-user-namespace $argv
    else
        $argv
    end
end
