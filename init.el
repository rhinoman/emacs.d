(require 'package)
(add-to-list 'package-archives
	     '("MELPA" .
	       "http://melpa.org/packages/"))
(package-initialize)
(xterm-mouse-mode 1)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-install package)))

(use-package dracula-theme
	     :ensure t)

(load-theme 'dracula t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(flycheck evil ttl-mode python-ts poetry-mode python-ts-mode poetry-ts-mode treesit-auto company-capf company-anaconda poetry general evil-visual-mark-mode lsp-treemacs company rustic lsp-pyright lsp-mode rust-mode dracula-theme speedbar-git-respect treemacs treeview)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(use-package treemacs-evil
   :ensure t)
(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))
(use-package company
  :ensure t)
(use-package company-anaconda
  :ensure t)
(use-package speedbar
  :ensure t)
(use-package rust-mode
  :ensure t)
(use-package rustic
  :ensure t)
(use-package evil
  :ensure t)
(use-package poetry
  :ensure t)
(use-package flycheck
  :ensure t)
(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)
(use-package ttl-mode
  :mode (("\\.ttl\\'" . ttl-mode))
  :ensure t)

(use-package typescript-ts
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode))
  :after lsp)
(evil-mode 1)
(use-package lsp-mode
  :ensure t	     
  :config
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
  :hook ((rust-mode
	  rust-ts-mode
	  typescript-mode
	  typescript-ts-mode
	  javascript-ts-mode
	  python-ts-mode
	  tsx-mode
	  tsx-ts-mode) . lsp)
  :commands lsp)	

(eval-after-load "company"
 '(add-to-list 'company-backends '(company-anaconda :with company-capf)))
(setq lsp-auto-guess-root t)
(setq lsp-diagnostic-package :none)
(setq lsp-prefer-capf t)
;(add-to-list 'lsp-language-id-configuration '(js-jsx-mode . "javascriptreact"))

(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(setq python-shell-interpreter "ipython")
(setq python-shell-completion-native-disabled-interpreters '("ipython"))

(provide 'init)
