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

;;org-mode
;;;set TODO list
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(i!)" "HANGUP(h!)" "|" "DONE(d!)" "CANCEL(c!)")))

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

;; run lisp in emacs
; clisp need installed
; M-x run-lisp
(setq inferior-lisp-program "/usr/bin/clisp")
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
;;(setq javascript-indent-level 2)
(setq js-indent-level 2)
;;anything
;;索引文件工具
;;M-x anything
(require 'anything-config)
(require 'anything-match-plugin)
(global-set-key (kbd "C-c q") 'anything)
(global-set-key (kbd "C-c C-c") 'anything-for-files)

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
;(add-to-list 'load-path
;	     "~/.emacs.d/plugins/auto-complete")
;(require 'auto-complete-config)
;(add-to-list'ac-dictionary-directories
;             "~/.emacs.d/plugins/auto-complete/dict")
;(ac-config-default)
;(global-set-key "\M-/" 'auto-complete)
;(setq ac-auto-start nil)

;;;nxhtml
(require 'haml-mode)
;;;(load "~/.emacs.d/plugins/nxhtml/autostart.el")

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
;;;(setq mumamo-chunk-coloring 1)

;;rsense
;; (setq rsense-home "/usr/lib/rsense")
;;;;;;;;;;;;;;;;;;;(add-to-list 'load-path (concat rsense-home "/etc"))
;; (require 'rsense)
;;;;;;;;;;;;;;;;;;;; Complete by C-c .
;;;;;;;;;;;;;;;;;;;(add-hook 'ruby-mode-hook
;;;;;;;;;;;;;;;;;;;          (lambda ()
;;;;;;;;;;;;;;;;;;;            (local-set-key (kbd "C-c .") 'rsense-complete)))
;;;;;;;;;;;;;;;;;;;; Complete by C-c .
;;;;;;;;;;;;;;;;;;;(add-hook 'ruby-mode-hook
;;;;;;;;;;;;;;;;;;;          (lambda ()
;;;;;;;;;;;;;;;;;;;            (local-set-key (kbd "C-c .") 'rsense-complete)))

;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             (add-to-list 'ac-sources 'ac-source-rsense-method)
;;             (add-to-list 'ac-sources 'ac-source-rsense-constant)))
;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-c C-t") 'rsense-type-help)))
;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-c C-j") 'rsense-jump-to-definition)))

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
;;页面间跳转<C-c ; f x> x可以为c v m ... 已绑定新键
;;启动服务器<C-c ; w>
;;rake<C-c ; r>
(add-to-list 'load-path "~/.emacs.d/plugins/rinari")
(require 'rinari)
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . ruby-mode))
(global-set-key (kbd "C-c c") 'rinari-find-controller)  
(global-set-key (kbd "C-c m") 'rinari-find-model)  
(global-set-key (kbd "C-c v") 'rinari-find-view)  
(global-set-key (kbd "C-c h") 'rinari-find-helper)  
(global-set-key (kbd "C-c r") 'rinari-find-rspec)  
(global-set-key (kbd "C-c j") 'rinari-find-javascript)  
(global-set-key (kbd "C-c s") 'rinari-find-stylesheet)  
(global-set-key (kbd "C-c f") 'rinari-find-file-in-project)  


;; for mac os
(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:/usr/local/git/bin:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path)
  (push "/usr/local/git/bin" exec-path)
  (push "/usr/local/bin" exec-path))

;;git
(require 'magit)
(global-set-key (kbd "C-c g") 'magit-status)  

;;
(require 'goto-last-change)  
(global-set-key "\C-x\C-\\" 'goto-last-change)

;; hightlight-parentheses
(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;; for chrome(edit with emacs)
(require 'edit-server)
(edit-server-start)

;; thing-edit
(require 'thing-edit)
(define-prefix-command 'thing-edit-map)
(global-set-key (kbd "C-c w") 'thing-paste-word)
(global-set-key (kbd "C-c l") 'thing-paste-line)
(global-set-key (kbd "C-c x") 'thing-paste-sexp)
;(global-set-key (kbd "C-c f") 'thing-paste-defun) ;key used for rinari
;(global-set-key (kbd "C-c s") 'thing-paste-sentence)
(global-set-key (kbd "C-c C-w") 'thing-copy-word)
(global-set-key (kbd "C-c C-l") 'thing-copy-line)
(global-set-key (kbd "C-c C-x") 'thing-copy-sexp)
(global-set-key (kbd "C-c C-f") 'thing-copy-defun)
(global-set-key (kbd "C-c C-s") 'thing-copy-sentence)

;; mew(email tool)
(add-to-list 'load-path "/usr/share/emacs23/site-lisp/mew")
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
;; Optional setup (Read Mail menu for Emacs 21):
;; (if (boundp 'read-mail-command)
;;     (setq read-mail-command 'mew))
 
;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))


;; twitter, weibo, ...
;u更新状态信息
;i隐藏显示图标
;c-m 评论信息
;c-c c-m 转发信息
(require 'twittering-mode)
(setq twittering-use-master-password t)
(twittering-enable-unread-status-notifier)
(setq-default twittering-icon-mode t)

(custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won’t work right.
'(org-checkbox ((t (:inherit bold))))
'(org-checkbox-statistics-todo ((t (:inherit org-todo :foreground "DarkKhaki"))) t)
'(org-level-1 ((t (:inherit outline-1 :foreground "LimeGreen"))))
'(org-level-2 ((t (:inherit outline-2 :foreground "YellowGreen"))))
'(org-level-3 ((t (:inherit outline-3 :foreground "SeaGreen3"))))
'(org-todo ((t (:weight bold))))
'(org-warning ((t (:inherit font-lock-warning-face :foreground "LightGoldenrod"))))
'(twittering-zebra-1-face ((t (:background "#2b2b2b"))))
'(twittering-zebra-2-face ((t (:background "#00574F")))))

(setq twittering-initial-timeline-spec-string `(":home@sina"
                                                     ; ":home@douban"
                                                     ))
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

;;窗口间跳转
(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to downer window

;;hs-mirror-mode模式下用f9切换折叠
(global-set-key [C-f1] 'hs-toggle-hiding)

;;;;;;------====== self ======------;;;;;;
;;;(require 'private)
