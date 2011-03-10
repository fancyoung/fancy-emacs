FANCY-EMACS - my emacs config
=============================

Install
------
 - backup & delete .emacs file and .emacs.d folder first.(no .emacs file, all in .emacs.d folder)
 - private.el must be created for some private code.
 - rsense should be installed
 - ctag supported by rinari
   (should install ctags: 
   $ sudo aptitude install ctags 
   $ ctags-exuberant -a -e -f TAGS --tag-relative -R app lib vendor (run this command under project)
   (in Mac, maybe should set path /usr/local/bin)
   <http://rinari.rubyforge.org/Navigation.html>)
 - install magit

Include
------
 - color-theme
 - ido
 - karl's javascript
 - anything
 - yasnippet
 - auto-complete
 - nxhtml
 - rsense
 - yasnippet-javascript (my project: <https://github.com/fancyoung/yasnippet-javascript>)
 - yari

Bugs
------
- nxhtml + karl's javascript + inline javascript + inverted comma(')
el:if input inverted comma in onclick:<a html="#" onclick="">test</a>, emacs will stop running.


* Shortcuts

** 常用
  - C-x h           全选
  - M-;             加注释
  - M-.             ctags查找(需要安装ctags)
  - F5 C-h          打开anything的帮助

** 自定义
  - C-c C-c         全局搜索文件
  - C-c SPC         空格显示开关
  - C-c n           清除buffer
  - C-x ^           合并到上一行

** 窗口操作
  - C-x 2           垂直拆分
  - C-x 3           水平拆分
  - C-x o           到下一窗口
  - C-M-v           滚动下一窗口
  - C-x 4 b         在另一窗口打开缓冲
  - C-x 4 C-o       在另一窗口打开缓冲,但不选中
  - C-x 4 f         在另一窗口打开文件
  - C-x 4 d         在另一窗口打开文件夹
  - C-x 0           关闭当前窗口
  - C-x 1           关闭其它窗口
  - C-x 4 0         关闭当前窗口和缓冲
  - C-x ^           增高当前窗口(不能用?)
  - C-x {           将当前窗口变窄
  - C-x }           将当前窗口变宽
  - C-x -           如果窗口比缓冲大就缩小
  - C-x +           所有窗口一样高

** 列编辑
  - M-x cua-mode    进入列编辑模式
  - Ctrl-Enter      开始选择,用Enter键在四个角切换
  - C-x r k         剪切一个矩形块
  - C-x r y         粘贴一个矩形块
  - C-x r o         插入一个矩形块
  - C-x r c         清除一个矩形块(使其变成空白)
  - C-x r t         在选定区域的所有列前插入样的字符

** rinari
  - C-c c           controller
  - C-c m           model
  - C-c v           view
  - C-c h           help
  - C-c r           rspec
  - C-c j           javascript
  - C-c s           stylesheet
  - C-c f           file(不常用,现在一般用C-c C-c)

** yari ruby帮助
  - C-c C-q         查当前词
  - C-c C-a         搜索
