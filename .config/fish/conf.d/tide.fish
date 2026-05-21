# Layout
set -g tide_left_prompt_items pwd git newline character
set -g tide_right_prompt_items status cmd_duration context jobs direnv node python rustc pulumi aws

# Git
set -g tide_git_truncation_length 48
set -g tide_git_truncation_strategy 'l'
set -g tide_git_icon \ue0a0

# Colors
set -g tide_git_color_branch green
set -g tide_git_color_dirty yellow
set -g tide_git_color_staged yellow
set -g tide_git_color_stash green
set -g tide_git_color_untracked cyan
set -g tide_git_color_upstream green
set -g tide_git_color_conflicted red
set -g tide_git_color_operation red

set -g tide_pwd_color_anchors blue
set -g tide_pwd_color_dirs blue
set -g tide_pwd_color_truncated_dirs brblack

set -g tide_character_color green
set -g tide_character_color_failure red
set -g tide_cmd_duration_color yellow
set -g tide_aws_color bryellow

set -g tide_crystal_color white
set -g tide_direnv_color yellow
set -g tide_direnv_color_denied red
set -g tide_distrobox_color magenta
set -g tide_go_color cyan
set -g tide_os_color normal
set -g tide_private_mode_color white

set -g tide_vi_mode_color_default brblack
set -g tide_vi_mode_color_visual bryellow
