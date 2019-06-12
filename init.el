(require 'package)
(add-to-list 'package-archives
             ;;'("melpa" . "http://elpa.emacs-china.org/melpa/") t)
             '("melpa" . "https://melpa.org/packages/") t)
             ;;'("melpa". "http://stable.melpa.org/packages/") t)
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
 '(org-agenda-files
   (quote
    ("~/GTD/test.org" "~/文档/work/agenda/test.org" "/home/pinvon/GTD/agenda.org")))
 '(org-pomodoro-finished-sound "/home/pinvon/音乐/my heart will go on.wav")
 '(org-pomodoro-length 30)
 '(package-selected-packages
   (quote
    (toc-org org-make-toc org-mind-map anki-editor org-pomodoro mustache pug-mode go-mode google-c-style zygospore projectile flymake-cursor flymake-google-cpplint auto-complete-c-headers auto-complete yasnippet auctex sr-speedbar monokai-theme helm volatile-highlights use-package undo-tree counsel-projectile)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans CJK SC" :foundry "GOOG" :slant normal :weight normal :height 120 :width normal))))
 '(org-table ((t (:foreground "#6c71c4" :family "Ubuntu Mono")))))



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

;; Latex Configuration(CTex)
(require 'tex-mik)
(load "~/.emacs.d/elpa/auctex-12.1.1/auctex.el" nil t t)
(load "~/.emacs.d/elpa/auctex-12.1.1/preview.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
;(setq TeX-output-view-style(quote(("^pdf$"".""evince %o %(outpage)"))))
(setq TeX-view-program-list '(("Evince" "evince %o")))
(setq TeX-view-program-selection '((output-pdf "Evince")))
(setq TeX-global-PDF-mode t TeX-engine 'xelatex)

(add-hook 'LaTeX-mode-hook (lambda ()
                             (turn-off-auto-fill)
                             (linum-mode 1)
                             (outline-minor-mode 1)
                             (setq TeX-show-compilation nil)
                             (setq TeX-clean-confirm nil)
                             (setq TeX-save-query nil)
                             (setq TeX-global-PDF-mode t
                                   TeX-engine 'xetex)
                             (add-to-list 'TeX-command-list
                                          '("XeLaTeX" "%'xelatex%(mode)%' %t"
                                            TeX-run-TeX nil t))
                             (setq TeX-command-default "XeLaTeX")
                             ))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;; org-mode自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;;; 取消图片显示原来的大小
(setq org-image-actual-width nil)

;;; C/C++
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'yasnippet)
(yas-global-mode 1)

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


;; the following is only needed if you install EGO manually
(add-to-list 'load-path "~/.emacs.d/EGO")

(require 'ego)

(ego-add-to-alist 'ego-project-config-alist
               `(("pinvon" ; 站点工程的名字
                 :repository-directory "~/myblog" ; 站点的本地目录
                 :site-domain "https://pinvondev.github.io/" ; 站点的网址
                 :site-main-title "Pinvon's Blog" ; 站点的标题
                 :site-sub-title "所见, 所闻, 所思, 所想" ; 站点的副标题
                 :theme (default) ; 使用的主题
                 :summary (("years" :year :updates 10) ("authors" :authors) ("tags" :tags)) ; 导航栏的设置，有 category 和 summary 两种
                 :source-browse-url ("Github" "https://github.com/pinvondev") ; 你的工程源代码所在的位置
                 :personal-disqus-shortname "pinvon" ; 使用 disqus 评论功能的话，它的短名称
                 ;; :personal-duoshuo-shortname "emacs-china" ; 使用 多说 评论功能的话，它的短名称(由于多说已经关闭，这里就此废置)
                 :confound-email nil ; 是否保护邮件名称呢？t 是保护，nil 是不保护，默认是保护
                 :ignore-file-name-regexp "readme.org" ; 有些不想发布成 html 的 org 文件（但是又想被导入 git 进行管理），可以用这种正则表达的方式排除
                 :web-server-docroot "~/pinvon-test" ; 本地测试的目录
                 :web-server-port 5432); 本地测试的端口

                 ;; 你可以在此添加更多的站点设置
               ))

;; GTD
(setq org-todo-keywords
  '((sequence "TODO(t)"  "|" "DONE(d!)" "ABORT(a@/!)")
))
(setq org-log-done 'note)
(setq org-tag-alist '(("@work" . ?w) ("@study" . ?s) ("@anki" . ?a)))

;; 21 day emacs
(setq-default cursor-type 'bar)
(delete-selection-mode 1)  ;; 选中一段文字后, 输入一个字符, 可以替换选中内容
(global-hl-line-mode 1)  ;; 高亮当前行
(setq org-agenda-files '("~/GTD"))  ;; 设置默认的 org-agenda 文件目录
(global-set-key (kbd "C-c a") 'org-agenda)  ;; 设置 org-agenda 打开的快捷键
(global-set-key (kbd "C-c .") 'org-time-stamp)
(setq org-refile-targets '(
                           ("~/GTD/agenda.org" :maxlevel . 1)))
(setq org-archive-location (concat "archive/archive-"
                                   (format-time-string "%Y%m" (current-time))
                                   ".org_archive::"))


;; my fix for tab indent
(defun zilongshanren/indent-region(numSpaces)
  (progn
                                      ; default to start and end of current line
    (setq regionStart (line-beginning-position))
    (setq regionEnd (line-end-position))

                                      ; if there's a selection, use that instead of the current line
    (when (use-region-p)
      (setq regionStart (region-beginning))
      (setq regionEnd (region-end))
      )

    (save-excursion                          ; restore the position afterwards
      (goto-char regionStart)                ; go to the start of region
      (setq start (line-beginning-position)) ; save the start of the line
      (goto-char regionEnd)                  ; go to the end of region
      (setq end (line-end-position))         ; save the end of the line

      (indent-rigidly start end numSpaces) ; indent between start and end
      (setq deactivate-mark nil)           ; restore the selected region
      )
    )
  )


(defun zilongshanren/tab-region ()
  (interactive "p")
  (if (use-region-p)
      (zilongshanren/indent-region 4)               ; region was selected, call indent-region
    (insert "    ")                   ; else insert four spaces as expected
    ))

(defun zilongshanren/untab-region ()
  (interactive "p")
  (zilongshanren/indent-region -4))

(defun zilongshanren/hack-tab-key ()
  (interactive)
  (local-set-key (kbd "<tab>") 'zilongshanren/tab-region)
  (local-set-key (kbd "<S-tab>") 'zilongshanren/untab-region)
  )

(add-hook 'prog-mode-hook 'zilongshanren/hack-tab-key)

(defun add-my-toc ()
  (interactive)
  (insert ":PROPERTY:\n")
  (insert ":TOC: \n")
  (insert ":END:\n"))

(require 'ox-org)
(setq org-mind-map-engine "dot")
(if (require 'toc-org nil t)
    (add-hook 'org-mode-hook 'toc-org-mode)
  (warn "toc-org not found"))

(require 'org-tempo)
