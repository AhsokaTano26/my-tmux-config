#!/bin/bash

# 1. 下载 TPM 插件管理器
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# 2. 创建软链接 (将仓库里的文件链接到家目录)
# 假设你在 ~/my-dotfiles 目录下执行
ln -sf $(pwd)/tmux/tmux.conf ~/.tmux.conf

# 3. 提示用户安装插件
echo "Tmux 配置已同步。请进入 tmux 后按下: Ctrl+b + I (大写) 来安装插件。"
