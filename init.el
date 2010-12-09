;;配置路径
(add-to-list 'load-path "~/.emacs.d")

;;;;;;------====== 界面 ======------;;;;;;
;;光标
;(setq-default cursor-type 'bar)

;;摘掉菜单,工具栏和滚动条
;;M-` or F10 菜单唤出热键
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;;开启菜单
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

;;窗口透明
(global-set-key [(C-f5)] 'loop-alpha)
(setq alpha-list '((85 55) (100 100)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
)
(loop-alpha)

;;;;;;------====== 通用 ======------;;;;;;

;;自动提示配对的括号
(setq show-paren-mode t)

;;杂项

;;不显示起始提示信息(包括scratch)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
;;视觉响铃
(setq visiable-bell t)
;;高亮选中文本
(setq-default transient-mark-mode t)
;;显示列号
(column-number-mode t)
;;显示当前时间
(display-time)
;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。很好玩阿，这个功能
(mouse-avoidance-mode 'animate)
;支持emacs和外部程序的粘贴
;(setq x-select-enable-clipboard t)

;;一打开就起用 text 模式
(setq default-major-mode 'text-mode)
;;dired模式中不显示隐藏文件
(setq dired-listing-switches "-l")
;;为文件最后加上换行
(setq require-final-newline t)

;; 文件相关

;;对文件不进行备份
(setq-default make-backup-files nil)

;;;;;;------====== 扩展 ======------;;;;;;

;;主题
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-bharadwaj-slate)

;;ido ;;embedded in emacs23
;;C-s C-r C-j C-d C-f // ~/
(require 'ido)
(ido-mode t)

;;karl's javascript  ;;will embedded in emacs23.2
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)

;;anything
;(add-to-list 'load-path "~/.emacs.d")
(require 'anything-config)

;;;;;;------====== 快捷 ======------;;;;;;

;;新建下一行并缩进
(defun next-newline ()
       (interactive)
       (move-end-of-line nil)
       (newline-and-indent))
(global-set-key (kbd "C-S-j") 'next-newline)

;;新建上一行并缩进
(defun last-newline ()
       (interactive)
       (forward-line -1)
       (move-end-of-line nil)
       (newline-and-indent))
(global-set-key (kbd "C-M-j") 'last-newline)
