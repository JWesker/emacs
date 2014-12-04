(add-to-list 'load-path "~/.emacs.d/color-theme")
(add-to-list 'load-path "~/.emacs.d/lua-mode")
(add-to-list 'load-path "~/.emacs.d/tab-display")
(add-to-list 'load-path "~/.emacs.d/fuzzy-el")
(add-to-list 'load-path "~/.emacs.d/popup-el")
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'color-theme)
(color-theme-initialize)
(color-theme-deep-blue)
(cua-mode)
;;(global-linum-mode t)
(setq tab-width 4) 
(setq frame-title-format "%b@JWesker")

;; 不产生备份文件
(setq make-backup-files nil)
(setq-default make-backup-files nil) ;不产生临时文件


;;(setq tab-display-mode nil)
;;(require 'tab-display)


(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(setq lua-indent-string-contents t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))

(set-fontset-font "fontset-default" 'gb18030 '("Microsoft YaHei" . "unicode-bmp"))
(run-with-idle-timer 1 nil 'w32-send-sys-command 61488)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
(ac-config-default)

(setq ac-fuzzy-enable t)