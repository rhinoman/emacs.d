(require 'package)
(add-to-list 'package-archives
	     '("MELPA" .
	       "http://melpa.org/packages/"))
(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(poetry general evil-visual-mark-mode lsp-treemacs company rustic lsp-pyright lsp-mode rust-mode dracula-theme speedbar-git-respect treemacs treeview)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'rust-mode)
(use-package rustic)
(require 'evil)
(require 'python)
(evil-mode 1)
(use-package lsp-mode
  :config
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map))
;; Set LSP mode

(add-hook 'rust-mode-hook #'lsp)
(add-hook 'python-mode-hook #'lsp)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(setq python-shell-interpreter "ipython")
(setq python-shell-completion-native-disabled-interpreters '("ipython"))

