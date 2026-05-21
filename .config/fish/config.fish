if status is-interactive
    set -g fish_key_bindings fish_default_key_bindings

    # Shell integrations
    direnv hook fish | source
    zoxide init fish | source
    fzf --fish | source

    # Editor
    if command -q nvim
        set -gx EDITOR nvim
        set -gx VISUAL nvim
        abbr -a vim nvim
        abbr -a nv nvim
    else
        set -gx EDITOR vim
        set -gx VISUAL vim
    end
    set -gx PAGER less
    set -gx LESS -R

    # ls
    abbr -a l 'll'

    # cd
    abbr -a .. 'cd ..'

    # tmux
    abbr -a tls 'tmux ls'
    abbr -a tn 'tmux new -s'
    abbr -a ta 'tmux attach -t'
    abbr -a tk 'tmux kill-session -t'
    abbr -a tks 'tmux kill-server'

    # git
    abbr -a gs 'git s'
    abbr -a gb 'git b'
    abbr -a gd 'git d'
    abbr -a gds 'git ds'
    abbr -a ga 'git a'
    abbr -a gc 'git c'
    abbr -a gco 'git co'
    abbr -a gp 'git p'
    abbr -a gl 'git l'
    abbr -a gls 'git ls'
    abbr -a lg lazygit

    # dotfiles
    abbr -a dot 'git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
    abbr -a lazydot 'lazygit -g ~/.dotfiles.git -w ~'

    # aws
    abbr -a aws-local 'aws --profile local --endpoint-url http://localhost:8001'

    # fzf colors
    set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
      --highlight-line \
      --info=inline-right \
      --ansi \
      --layout=reverse \
      --border=none \
      --color=bg+:bright-black \
      --color=bg:black \
      --color=border:bright-black \
      --color=fg:white \
      --color=gutter:black \
      --color=header:yellow \
      --color=hl+:magenta \
      --color=hl:magenta \
      --color=info:bright-black \
      --color=marker:red \
      --color=pointer:red \
      --color=prompt:blue \
      --color=query:white \
      --color=scrollbar:black \
      --color=separator:yellow \
      --color=spinner:red"
end
