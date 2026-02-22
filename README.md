# my-tmux-config
使用方法：
```bash
git clone https://github.com/AhsokaTano26/my-tmux-config.git ~/my-tmux-config && cd ~/my-tmux-config && chmod +x install.sh && ./install.sh
```

## 如何检查已成功安装插件
1. 最直观的验证：查看插件列表
进入 tmux 会话后，使用 TPM 自带的快捷键列出当前已识别的插件：  
快捷键： Ctrl + b 接着按 shift + u (即大写的 U)  
现象： 如果安装成功，tmux 底部状态栏会弹出一个列表，显示你配置的所有插件（如 tmux-resurrect, tmux-continuum 等），并询问你是否要更新它们。  
成功标志： 如果你能看到插件名称而不是报错，说明 TPM 已经成功加载了配置。  

2. 功能测试（以常用插件为例）  
通过实际操作来验证核心插件是否在后台运行：  

- 验证 tmux-resurrect (手动保存)  

在某个面板里输入一些无关紧要的文字（比如 echo "hello tmux"）。  

按下 Ctrl + b 然后按 Ctrl + s (Save)。  

成功标志： 状态栏左下角会闪过一行字："Saved tmux environment!"。这说明插件捕获并写入了会话状态。  

- 验证 tmux-continuum (自动保存状态)  

这个插件在后台运行，你可以通过查看它的状态变量来确认：  

在 tmux 命令行输入（先按 Ctrl + b 然后按 :）：

```Bash
display-message "#{continuum_status}"
```
成功标志： 状态栏会显示一个数字（距离下次保存的分钟数），例如 14。如果显示为空，说明插件未启动。

- 验证 vim-tmux-navigator (无缝跳转)

如果你在 Vim 中也配了对应插件：

尝试用 Ctrl + h/j/k/l 在不同的 tmux 面板间跳转。

成功标志： 不需要按 Ctrl + b 就能直接跨面板移动光标。

3. 文件系统检查 (最硬核的验证)  
如果快捷键没反应，直接去后台看插件文件是否存在：

```Bash
# 查看插件源码是否已下载
ls -la ~/.tmux/plugins/
```
正常情况应该看到如下目录：

tpm/

tmux-sensible/

tmux-resurrect/

tmux-continuum/

...以及其他你定义的插件。
