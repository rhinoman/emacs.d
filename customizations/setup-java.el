(require 'lsp-java)
(require 'lsp-ui)
(require 'lsp-mode)
(require 'company-lsp)
(require 'yasnippet)
(require 'dap-java)
(require 'lsp-java-boot)

(setq lsp-enable-on-type-formatting nil)
(setq lsp-java-format-on-type-enabled nil)

(add-hook 'lsp-mode-hook #'lsp-lens-mode)
(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)
(add-hook 'java-mode-hook 'flycheck-mode)
(add-hook 'java-mode-hook 'company-mode)

(eval-after-load 'lsp-java
  '(progn
     (define-key java-mode-map (kbd "C-c C-y") 'lsp-goto-implementation)
     (define-key java-mode-map (kbd "C-c C-v C-b") 'lsp-java-build-project)
     (define-key java-mode-map (kbd "C-c C-v C-g") 'lsp-java-generate-getters-and-setters)))
