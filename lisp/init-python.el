;; (add-hook 'python-mode-hook 'ggtags-mode)

(add-hook 'python-mode-hook
  (lambda()
    (setq flycheck-python-pylint-executable "/usr/local/bin/pylint")
    (setq flycheck-pylintrc "/root/pylint/pylintrc")))

(add-hook 'python-mode-hook (lambda ()
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)))

(add-hook 'python-mode-hook #'yas-minor-mode)


(provide 'init-python)
