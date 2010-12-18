;;配置路径
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/ruby-mode")

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
(setq x-select-enable-clipboard t)
;;自动显示图片
(auto-image-file-mode)

;;一打开就起用 text 模式
(setq default-major-mode 'text-mode)
;;dired模式中不显示隐藏文件
(setq dired-listing-switches "-l")
;;为文件最后加上换行
(setq require-final-newline t)

;; 文件相关

;;sudo为root编辑文件
;(defun sudo-edit (&optional arg)
;  (interactive "p")
;  (if (or arg (not buffer-file-name))
;      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
;    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;;对文件不进行备份
(setq-default make-backup-files nil)

;;编程相关

;;自动提示配对的括号
(show-paren-mode 1)
;(setq show-paren-mode t)
;;提示文件尾的空行
(set-default 'indicate-empty-lines t)
;;不允许用tab做缩进
(set-default 'indent-tabs-mode nil)


;;;;;;------====== 扩展 ======------;;;;;;

;;主题
(add-to-list 'load-path 
	     "~/.emacs.d/plugins/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-bharadwaj-slate)

;;ido ;;embedded in emacs23
;;目录工具
;;C-s C-r C-j C-d C-f // ~/
(require 'ido)
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10)

;;karl's javascript  ;;will embedded in emacs23.2
;;最好的javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)

;;anything
;;索引文件工具
;;M-x anything
(require 'anything-config)
(global-set-key (kbd "C-c q") 'anything)

;;yasnippet
;;自动补全工具
;;TAB
(add-to-list 'load-path
	     "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;;auto-complete
;;代码补全
;;TAB M-p M-n RET
(add-to-list 'load-path
	     "~/.emacs.d/plugins/auto-complete")
(require 'auto-complete-config)
(add-to-list'ac-dictionary-directories
             "~/.emacs.d/plugins/auto-complete/dict")
(ac-config-default)
(global-set-key "\M-/" 'auto-complete)
(setq ac-auto-start nil)

;;;nxhtml
(load "~/.emacs.d/plugins/nxhtml/autostart.el")

;use default color in major chunk. seems worked.
;(setq mumamo-chunk-coloring 'submode-colored) ;can't work
;(setq mumamo-chunk-coloring 'no-chunks-colored) ;can't work
;(setq
;      nxhtml-global-minor-mode t
;      mumamo-chunk-coloring 'submode-colored
;      nxhtml-skip-welcome t
;      indent-region-mode t
;      rng-nxml-auto-validate-flag nil
;      nxml-degraded t)
(setq mumamo-chunk-coloring 1)

;;rsense
(setq rsense-home "/usr/lib/rsense")
;(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)
;; Complete by C-c .
;(add-hook 'ruby-mode-hook
;          (lambda ()
;            (local-set-key (kbd "C-c .") 'rsense-complete)))
;; Complete by C-c .
;(add-hook 'ruby-mode-hook
;          (lambda ()
;            (local-set-key (kbd "C-c .") 'rsense-complete)))

(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-t") 'rsense-type-help)))
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-j") 'rsense-jump-to-definition)))

;;flymake
;;语法检查（Emacs23自带，还未找到合适的配置文件）

;;ruby-yari
(require 'yari)
(global-set-key (kbd "C-c C-q") 'yari)
(global-set-key (kbd "C-c C-a") 'yari-anything)

;;rails-reloaded
;;暂时不用，仿佛rinari就够了？而且快捷键C-c ;有冲突
;(setq load-path (cons (expand-file-name "~/.emacs.d/plugins/rails-reloaded") load-path))
;(require 'rails-autoload)

;;rinari
;;页面间跳转<C-c ; f x> x可以为c v m ...
(add-to-list 'load-path "~/.emacs.d/plugins/rinari")
(require 'rinari)
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . ruby-mode))

;;;;;;------====== 快捷 ======------;;;;;;

;;快捷开启空格显示模式
(global-set-key (kbd "C-c SPC") 'whitespace-mode)
;;定制编辑区良好缩进
(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))
(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))
(global-set-key (kbd "C-c n") 'cleanup-buffer)
;;用正则排列行
(global-set-key (kbd "C-x \\") 'align-regexp)
;;归并到上一行
(global-set-key (kbd "C-x ^") 'join-line)

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

;;;;;;------====== self ======------;;;;;;
(require 'private)
