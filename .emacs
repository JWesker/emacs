(add-to-list 'load-path "~/.emacs.d/color-theme")
(add-to-list 'load-path "~/.emacs.d/lua-mode")
(add-to-list 'load-path "~/.emacs.d/tab-display")
(add-to-list 'load-path "~/.emacs.d/fuzzy-el")
(add-to-list 'load-path "~/.emacs.d/popup-el")
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(add-to-list 'load-path "~/.emacs.d/ecb")
(require 'color-theme)
(color-theme-initialize)
(color-theme-deep-blue)
(cua-mode)
(global-linum-mode t)
(setq default-tab-width 4)
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


(global-ede-mode 1)                      ; Enable the Project management system


(require 'ecb)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2)))
 
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

(load-file "~/.emacs.d/mk-prj.el")
(project-init)
(setq imenu-auto-rescan t)

(global-set-key [(f1)] 'project-grep)
(global-set-key [(f2)] 'project-find-file)
(global-set-key [(f6)] 'project-multi-occur)

(global-set-key [(f10)] 'project-find-tag)   
(global-set-key [(f11)] 'pop-tag-mark)
(global-set-key [(f12)] 'project-find-tag-exact)  ;如果存在唯一tag，直接跳转，多个tag，列出所有匹配tag供选择 
;project-find-tag-exact和project-find-tag的区别是会match word
(global-set-key (kbd "C-c p l") 'project-load)
(global-set-key (kbd "C-c p u") 'project-unload)
(global-set-key (kbd "C-c p i") 'project-index)
(global-set-key (kbd "C-c p s") 'project-status)
(global-set-key (kbd "C-c p d") 'project-dired)
(global-set-key (kbd "C-c p t") 'project-tags)

(defun change-major-mode-hook ()
  (modify-syntax-entry ?_ "w"))

(change-major-mode-hook)
(add-hook 'lua-mode-hook 'change-major-mode-hook)
