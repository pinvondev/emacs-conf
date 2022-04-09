;;; 我的emacs配置

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/custom")

(require 'init-elpa)
(require 'init-packages)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-prompt-function
   '(lambda nil
      (concat
       (car
        (last
         (split-string
          (eshell/pwd)
          "/")))
       "# ")))
 '(js-indent-level 2)
 '(org-agenda-files '("~/GTD/gtd.org"))
 '(package-selected-packages
   '(vue-html-mode which-key helm-lsp lsp-ui lsp-java neotree ssh sphinx-doc pyim-wbdict pyim flycheck ggtags ox-reveal org-pomodoro fill-column-indicator anaconda-mode toc-org org-mind-map pug-mode go-mode google-c-style zygospore projectile company auctex sr-speedbar monokai-theme helm volatile-highlights use-package undo-tree counsel-projectile))
 '(python-shell-interpreter "python"))

(load-theme 'monokai 1)

(require 'init-setup)
(require 'init-gtd)
(require 'init-input)
(require 'init-python)
; (require 'init-java)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
