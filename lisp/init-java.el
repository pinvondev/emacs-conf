;; 调试工具
(setenv "JAVA_HOME"  "/etc/alternatives/java_sdk_1.8.0_openjdk/")
(setq lsp-java-java-path "/etc/alternatives/java_sdk_1.8.0_openjdk/bin/java")

(use-package dap-mode
  :ensure t
  :after (lsp-mode)
  :functions dap-hydra/nil
  :config
  (require 'dap-java)
  :bind (:map lsp-mode-map
         ("<f5>" . dap-debug)
         ("M-<f5>" . dap-hydra))
  :hook ((dap-mode . dap-ui-mode)
    (dap-session-created . (lambda (&_rest) (dap-hydra)))
    (dap-terminated . (lambda (&_rest) (dap-hydra/nil)))))

(use-package dap-java :ensure nil)

;; 目录导航
(use-package lsp-treemacs
  :after (lsp-mode treemacs)
  :ensure t
  :commands lsp-treemacs-errors-list
  :bind (:map lsp-mode-map
         ("M-9" . lsp-treemacs-errors-list)))

(use-package treemacs
  :ensure t
  :commands (treemacs)
  :after (lsp-mode))

;; 快捷键提示
(use-package which-key 
  :ensure t 
  :init
  (which-key-mode))


;; LSP常用包, 如打开窗口查看编码规范问题
(use-package lsp-ui
  :ensure t
  :after (lsp-mode)
  :bind (:map lsp-ui-mode-map
              ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
              ([remap xref-find-references] . lsp-ui-peek-find-references))
  :init (setq lsp-ui-doc-delay 1.5
              lsp-ui-doc-position 'bottom
              lsp-ui-doc-max-width 100))


(use-package helm-lsp
  :ensure t
  :after (lsp-mode)
  :commands (helm-lsp-workspace-symbol)
  :init (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol))

(use-package lsp-mode
  :ensure t
  :hook (
         (lsp-mode . lsp-enable-which-key-integration)
         (java-mode . #'lsp-deferred)
         )
  :init (setq 
         lsp-keymap-prefix "C-c l"              ; this is for which-key integration documentation, need to use lsp-mode-map
         lsp-enable-file-watchers nil
         read-process-output-max (* 1024 1024)  ; 1 mb
         lsp-completion-provider :capf
         lsp-idle-delay 0.500
         )
  :config (setq lsp-intelephense-multi-root nil) ; don't scan unnecessary projects
          (with-eval-after-load 'lsp-intelephense (setf (lsp--client-multi-root (gethash 'iph lsp-clients)) nil))
          (define-key lsp-mode-map (kbd "C-c l") lsp-command-map))

(use-package lsp-java
  :ensure t
  :init (setq
         lsp-java--download-root "https://gitee.com/pinvondev/lsp-java/raw/master/install/"
         lsp-java-jdt-download-url "https://download.eclipse.org/jdtls/milestones/0.57.0/jdt-language-server-0.57.0-202006172108.tar.gz"
         lsp-java-server-install-dir "/data/java/lsp-java-server-install")
  :config (add-hook 'java-mode-hook 'lsp))

(setq lsp-print-io t)

(provide 'init-java)
