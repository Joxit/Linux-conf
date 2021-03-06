(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (tango-dark)))
 '(global-whitespace-mode t)
 '(indent-tabs-mode nil)
 '(sh-basic-offset 2)
 '(sh-indentation 2)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(size-indication-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-indentation ((t nil))))

(setq-default tab-width 4)
(add-hook 'tuareg-mode-hook (lambda () (setq indent-tabs-mode nil)))
(add-hook 'sh-mode-hook (lambda () (setq indent-tabs-mode nil)))
(setq c-default-style "linux"
  c-basic-offset 4)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(autoload 'markdown-mode "markdown-mode"
"Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(setq tuareg-use-smie nil)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
