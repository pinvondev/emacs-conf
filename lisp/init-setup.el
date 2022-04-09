(menu-bar-mode -1)  ;; 不显示菜单栏
(tool-bar-mode -1)  ;; 不显示工具栏
(column-number-mode 1)  ;; 显示第几列
;; (js-indent-level 2)  ;; js编程时, 缩进2格
(show-paren-mode t)  ;; 匹配括号
(global-company-mode 1)  ;; 补全

;; 设置utf-8
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-clipboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; (setq gc-cons-threshold (* 50 1024 1024))  ; 每分配50M的内存, 进行一次GC, 默认800K
(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.6)
(setq default-buffer-file-coding-system 'utf-8)
(setq inhibit-startup-message t)  ;; 不打开教程页面
(setq make-backup-files nil)

(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

(when (version<= "9.2" (org-version))
  (require 'org-tempo))

(setq org-adapt-indentation nil)  ; 取消org-mode的自动缩进
(setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")
(setq Org-Reveal-title-slide nil)
(setq org-reveal-mathjax t)
(setq org-log-done 'time)
;;; org-mode自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
;;; 取消图片显示原来的大小
(setq org-image-actual-width nil)
(if (require 'toc-org nil t)
    (add-hook 'org-mode-hook 'toc-org-mode)
  (warn "toc-org not found"))

;; 代理
; (setq url-gateway-method 'socks)
; (setq socks-server '("Default server" "127.0.0.1" 1080 5))

;; 72列提示线
(fci-mode 1)
(setq fci-rule-width 10)
(setq fci-rule-color "orange")
(setq fci-rule-column 72)

(setq electric-pair-pairs '(
			    (?\{ . ?\})
			    (?\' . ?\')
                (?\" . ?\")
                (?\( . ?\))
                ))

(electric-pair-mode t)

(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

(provide 'init-setup)
