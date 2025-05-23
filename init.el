(require 'package)
(add-to-list 'package-archives
	     '("MELPA" .
	       "http://melpa.org/packages/"))
(package-initialize)
;; Install use-package if not already installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(xterm-mouse-mode 1)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-install package)))

;; Enable defer and ensure by default for use-package
;; Keep auto-save/backup files separate from source code:  https://github.com/scalameta/metals/issues/1027
(setq use-package-always-defer t
      use-package-always-ensure t
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(use-package no-littering
  :ensure t)

(use-package transient
  :ensure t
  :demand t)

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
	 ("C-c C-e" . markdown-do)))

(use-package dracula-theme
	     :ensure t)

(load-theme 'dracula t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(clojure-ts-mode company-anaconda dracula-theme editorconfig
		     flycheck-rust groovy-mode lsp-metals lsp-pyright
		     lsp-ui no-littering poetry rustic sbt-mode
		     treemacs-evil treesit-auto ttl-mode yasnippet)))
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
  :hook (scala-mode . company-mode)
  :config
  (setq lsp-completion-provider :capf)
  :ensure t)
(use-package company-anaconda
  :ensure t)
(use-package speedbar
  :ensure t)
(use-package rust-mode
  :ensure t)
(use-package rustic
  :ensure t)
(use-package scala-mode
  :ensure t
  :interpreter ("scala" . scala-mode))
(use-package sbt-mode
  :ensure t
  :commands sbt-start sbt-command
  :config
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
  (setq sbt:program-options '("-Dsbt.supershell=false")))
(use-package groovy-mode
  :ensure t)
(use-package evil
  :ensure t)
(use-package poetry
  :ensure t)
(use-package flycheck
  :ensure t)
(use-package flycheck-rust
  :ensure t)
(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)
(use-package ttl-mode
  :mode (("\\.ttl\\'" . ttl-mode))
  :ensure t)

(use-package typescript-ts-mode
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode))
  :after lsp)
(evil-mode 1)
(use-package lsp-mode
  :ensure t	     
  :config
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
  (setq lsp-prefer-flymake nil)
  (setq lsp-keep-workspace-alive nil)
  :hook (rust-mode . lsp)
	(rust-ts-mode . lsp)
	(scala-mode . lsp)
	(typescript-mode . lsp)
	(typescript-ts-mode . lsp)
	(javascript-ts-mode . lsp)
	(tsx-mode . lsp)
	(tsx-ts-mode . lsp)
	(lsp-mode . lsp-lens-mode))

(setq lsp-pyright-use-library-code-for-types nil)
(setq python.analysis.typeCheckingMode "basic")
(use-package lsp-metals
  :ensure t)
(use-package lsp-ui
  :ensure t)
(use-package yasnippet
  :ensure t)
(use-package lsp-pyright
  :ensure t
  :hook (python-ts-mode . (lambda ()
			    (require 'lsp-pyright)
			    (lsp))))

(eval-after-load "company"
  '(add-to-list 'company-backends '(company-anaconda :with company-capf)))
(use-package posframe
  :ensure t)
(use-package dap-mode
  :ensure t
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode))

(setq lsp-auto-guess-root t)
(setq lsp-prefer-capf t)
(setq lsp-diagnostics-provider :flycheck)
(setq lsp-ui-sideline-enable t)
;(add-to-list 'lsp-language-id-configuration '(js-jsx-mode . "javascriptreact"))

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(with-eval-after-load 'rust-ts-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
(add-hook 'rust-ts-mode-hook #'rustic-mode)
(setq python-shell-interpreter "ipython")
(setq python-shell-completion-native-disabled-interpreters '("ipython"))

(provide 'init)
