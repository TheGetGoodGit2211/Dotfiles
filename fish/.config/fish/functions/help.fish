# User-level override of Fish's help function to always use xdg-open
function help --description 'Show help for the fish shell'
    set -l options h/help
    argparse -n help $options -- $argv
    or return

    if set -q _flag_help
        __fish_print_help help
        return 0
    end

    set -l fish_help_item $argv[1]
    if test (count $argv) -gt 1
        if string match -q string $argv[1]
            set fish_help_item (string join '-' $argv[1] $argv[2])
        else
            echo "help: Expected at most 1 args, got 2" >&2
            return 1
        end
    end

    # HACK: Hardcode all section titles for each page.
    set -l intropages introduction where-to-go installation starting-and-exiting default-shell uninstalling shebang-line configuration examples resources other-help-pages
    set -l faqpages faq-ssh-interactive faq-unicode faq-uninstalling frequently-asked-questions how-can-i-use-as-a-shortcut-for-cd how-do-i-change-the-greeting-message how-do-i-check-whether-a-variable-is-defined how-do-i-check-whether-a-variable-is-not-empty how-do-i-customize-my-syntax-highlighting-colors how-do-i-get-the-exit-status-of-a-command how-do-i-make-fish-my-default-shell how-do-i-run-a-command-every-login-what-s-fish-s-equivalent-to-bashrc-or-profile how-do-i-run-a-command-from-history how-do-i-run-a-subcommand-the-backtick-doesn-t-work how-do-i-set-my-prompt how-do-i-set-or-clear-an-environment-variable i-accidentally-entered-a-directory-path-and-fish-changed-directory-what-happened i-m-getting-weird-graphical-glitches-a-staircase-effect-ghost-characters-cursor-in-the-wrong-position i-m-seeing-weird-output-before-each-prompt-when-using-screen-what-s-wrong my-command-pkg-config-gives-its-output-as-a-single-long-string my-command-prints-no-matches-for-wildcard-but-works-in-bash the-open-command-doesn-t-work uninstalling-fish what-is-the-equivalent-to-this-thing-from-bash-or-other-shells where-can-i-find-extra-tools-for-fish why-does-my-prompt-show-a-i why-doesn-t-history-substitution-etc-work why-doesn-t-set-ux-exported-universal-variables-seem-to-work why-won-t-ssh-scp-rsync-connect-properly-when-fish-is-my-login-shell
    set -l for_bash_pages arithmetic-expansion bash-command-substitutions blocks-and-loops builtins-and-other-commands command-substitutions fish-for-bash-users heredocs process-substitution prompts quoting special-variables string-manipulation subshells test-test variables wildcards-globs
    set -l interactivepages abbreviations autosuggestions color command-line-editor command-mode configurable-greeting copy-and-paste-kill-ring custom-bindings custom-binds directory-stack editor emacs-mode emacs-mode-commands greeting help history-search id7 insert-mode interactive interactive-use killring multiline multiline-editing navigating-directories pager-color-variables private-mode programmable-prompt programmable-title prompt searchable-command-history shared-bindings shared-binds syntax-highlighting syntax-highlighting-variables tab-completion title variables-color variables-color-pager vi-mode vi-mode-command vi-mode-commands vi-mode-insert vi-mode-visual visual-mode
    set -l langpages argument-handling autoloading-functions brace-expansion builtin-commands builtin-overview cartesian-product combine combining-different-expansions combining-lists-cartesian-product command-substitution comments conditions debugging debugging-fish-scripts defining-aliases escapes escaping-characters event event-handlers expand expand-brace expand-command-substitution expand-home expand-index-range expand-variable expand-wildcard exporting-variables featureflags functions future-feature-flags home-directory-expansion identifiers index-range-expansion input-output-redirection job-control language lists locale-variables loops-and-blocks more-on-universal-variables overriding-variables-for-a-single-command parameter-expansion path-variables pipes piping quotes redirects shell-variable-and-function-names shell-variables special-variables syntax syntax-conditional syntax-function syntax-function-autoloading syntax-function-wrappers syntax-job-control syntax-loops-and-blocks syntax-overview terminology the-fish-language the-status-variable variable-expansion variables variables-argv variable-scope variable-scope-for-functions variables-export variables-lists variables-locale variables-override variables-path variables-scope variables-special variables-status variables-universal wildcards-globbing configuration
    set -l tutpages autoloading-functions autosuggestions combiners-and-or-not command-substitutions conditionals-if-else-switch exit-status exports-shell-variables functions getting-help getting-started learning-fish lists loops pipes-and-redirections prompt ready-for-more running-commands separating-commands-semicolon startup-where-s-bashrc switching-to-fish syntax-highlighting tab-completions tut-combiners tut-conditionals tut-config tut-exports tut-lists tutorial tut-semicolon tut-universal universal-variables variables why-fish wildcards

    set -l fish_help_page
    switch "$fish_help_item"
        case "!"
            set fish_help_page "cmds/not.html"
        case "."
            set fish_help_page "cmds/source.html"
        case ":"
            set fish_help_page "cmds/true.html"
        case "["
            set fish_help_page "cmds/test.html"
        case globbing
            set fish_help_page "language.html#expand"
        case 'completion-*'
            set fish_help_page "completions.html#$fish_help_item"
        case 'tut-*'
            set fish_help_page "tutorial.html#"(string sub -s 5 -- $fish_help_item | string replace -a -- _ -)
        case tutorial
            set fish_help_page "tutorial.html"
        case releasenotes
            set fish_help_page relnotes.html
        case completions
            set fish_help_page completions.html
        case commands
            set fish_help_page commands.html
        case faq
            set fish_help_page faq.html
        case fish-for-bash-users
            set fish_help_page fish_for_bash_users.html
        case custom-prompt
            set fish_help_page prompt.html
        case $faqpages
            set fish_help_page "faq.html#$fish_help_item"
        case $for_bash_pages
            set fish_help_page "fish_for_bash_users.html#$fish_help_item"
        case $langpages
            set fish_help_page "language.html#$fish_help_item"
        case $interactivepages
            set fish_help_page "interactive.html#$fish_help_item"
        case $tutpages
            set fish_help_page "tutorial.html#$fish_help_item"
        case (builtin -n) (__fish_print_commands)
            set fish_help_page "cmds/$fish_help_item.html"
        case ''
            set fish_help_page "index.html"
        case $intropages
            set fish_help_page "index.html$fish_help_item"
        case "*"
            printf (_ "%s: no fish help topic '%s', try 'man %s'\n") help $fish_help_item $fish_help_item
            return 1
    end

    # Resolve the correct file URL or online fallback
    set -l version_string (string match -rg '(\d+\.\d+(?:b\d+)?).*' -- $version)
    set -l ext_url https://fishshell.com/docs/$version_string/$fish_help_page
    set -l page_url
    if set -q __fish_help_dir[1]; and test -f $__fish_help_dir/index.html
        set page_url file://$__fish_help_dir/$fish_help_page
    else
        set page_url $ext_url
    end

    # Always use xdg-open for browser launching
    printf (_ 'help: Opening Fish help with your default browser.\n')
    command xdg-open $page_url >/dev/null 2>&1 &
    printf (_ 'help: If no help could be displayed, open %s manually.\n') $ext_url
end
