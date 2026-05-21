# Fish completions for nordvpn
# Dynamically generated using nordvpn's built-in --generate-bash-completion

function __nordvpn_complete
    # Build the command line as nordvpn sees it (without 'nordvpn' itself)
    set -l tokens (commandline -opc)
    set -e tokens[1] # remove 'nordvpn'

    # Call nordvpn with the current tokens + the completion flag
    nordvpn $tokens --generate-bash-completion 2>/dev/null
end

# Disable file completions by default for nordvpn
complete -c nordvpn -f

# Use the dynamic completion function for all cases
complete -c nordvpn -a '(__nordvpn_complete)'
