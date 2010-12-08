;;光标
;(setq-default cursor-type 'bar)

;;摘掉菜单,工具栏和滚动条
;;M-` or F10 菜单唤出热键
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;;开启菜单
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

;;对文件不进行备份
(setq-default make-backup-files nil)

;;主题
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-bharadwaj-slate)

;;窗口透明
(global-set-key [(f5)] 'loop-alpha)  ;;注意这行中的F8 , 可以改成你想要的按键

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
