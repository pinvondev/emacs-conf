(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
             ;;'("melpa". "http://stable.melpa.org/packages") t)
             ;;'("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode 1)
 '(flymake-google-cpplint-command "/home/pinvon/.local/bin/cpplint")
 '(menu-bar-mode nil)
 '(org-agenda-files nil)
 '(org-pomodoro-finished-sound "d:/emacs/GTD/Beyond.wav")
 '(org-pomodoro-length 25)
 '(package-selected-packages
   (quote
    (anki-editor powershell sound-wav org-pomodoro pyim-wbdict pyim anaconda-mode toc-org org-mind-map pug-mode go-mode google-c-style zygospore projectile flymake-cursor flymake-google-cpplint company auctex sr-speedbar monokai-theme helm volatile-highlights use-package undo-tree counsel-projectile)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans CJK SC" :foundry "GOOG" :slant normal :weight normal :height 120 :width normal))))
 '(org-table ((t (:foreground "#6c71c4" :family "Ubuntu Mono")))))



(global-company-mode 1)

(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

(setq make-backup-files nil)

(load-theme 'monokai 1)

(global-linum-mode 1)
(setq column-number-mode 1)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(setq electric-pair-pairs '(
                            (?\{ . ?\})
                            (?\' . ?\')
                (?\" . ?\")
                (?\( . ?\))
                ))

(electric-pair-mode t)

;; 设置utf-8
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-clipboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;; org-mode自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;;; 取消图片显示原来的大小
(setq org-image-actual-width nil)

(defun my:ac-c-header-init ()
        (require 'auto-complete-c-headers)
        (add-to-list 'ac-sources 'ac-source-c-headers)
        (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/5/include"))
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/home/pinvon/.local/bin/cpplint"))
  (flymake-google-cpplint-load))
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

;; (require 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; d-hook 'c-mode-common-hook 'google-make-newline-indent)

(semantic-mode 1)
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic))
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
(global-ede-mode 1)

;; (ede-cpp-root-project "my project" :file "~/demos/my_program/src/main.cpp" :include-path '("/../my_inc") :system-include-path '("/usr/include/c++/3.2.2/"))

(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq c-default-style "k&r")
(setq c-basic-offset 4)

(setq org-log-done 'time)

(if (require 'toc-org nil t)
    (add-hook 'org-mode-hook 'toc-org-mode)
  (warn "toc-org not found"))

;; (require 'org-tempo)

(use-package pyim
  :ensure nil
  :demand t
  :config
  ;; 激活五笔词库
  (use-package pyim-wbdict
    :ensure nil
    :config (pyim-wbdict-v98-enable))

  (setq default-input-method "pyim")

  ;; 设置默认使用五笔
  (setq pyim-default-scheme 'wubi)

  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))

  ;; 开启搜索功能
  (pyim-isearch-mode 1)

  ;; 使用 popup-el 来绘制选词框, 如果使用 emacs26, 建议设置为 'posframe
  ;; 速度很多快且菜单不会变形, 不过需要自行安装 posframe
  (setq pyim-page-tooltip 'popup)

  ;; 选词框显示 5 个候选词
  (setq pyim-page-length 5)

  ;; 使用半角标点
  (setq pyim-punctuation-translate-p '(no yes auto))
  ;; (setq pyim-punctuation-translate-p '(yes no auto))  ;; 使用全角标点
  ;; (setq pyim-punctuation-translate-p '(auto yes no))  ;; 英文用半角 中文用半角

  :bind
  (("M-j" . pyim-convert-string-at-point)
   ("C-;" . pyim-delete-word-from-personal-buffer)))

(provide 'pyim-config)


;; 设置任务标签 C-c C-t
;; ! 表示切换到该状态时自动加入时间戳
;; @ 表示切换到该状态时要输入文字说明
(setq org-agenda-files (list "z:/root/github/notes/GTD/2020.org"))
(define-key global-map "\C-ca" 'org-agenda)


(setq url-gateway-method 'socks)
(setq socks-server '("Default server" "127.0.0.1" 1080 5))
