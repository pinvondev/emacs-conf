(use-package benchmark-init 
  :init (benchmark-init/activate) 
  :hook (after-init . benchmark-init/deactivate))

(use-package flycheck
 :ensure t
 :init (global-flycheck-mode))

(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm))

;; 项目管理, 如工程内搜索
;(use-package projectile
;  :ensure t
;  :init (projectile-mode 1)
;  :config
;  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; 定义模板, 输入缩写+TAB, 可映射成完整内容
;; 使用yas-new-snippet命令, 创建模板
(use-package yasnippet
  :config
  (yas-global-mode))
(use-package yasnippet-snippets
  :ensure t)


;; 将org转成HTML
;; (use-package ox-reveal
;;   :ensure ox-reveal)


;; ace-window可以快速切换窗口
;; 切换方法: M-o 数字


(provide 'init-packages)
