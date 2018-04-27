(require 'package)
(add-to-list 'package-archives
             ;;'("melpa" . "http://elpa.emacs-china.org/melpa/") t)
             ;;'("melpa". "http://stable.melpa.org/packages") t)
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
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
 '(org-agenda-files (quote ("~/GTD/gtd.org")))
 '(package-selected-packages
   (quote
    (pug-mode go-mode google-c-style zygospore projectile flymake-cursor flymake-google-cpplint auto-complete-c-headers auto-complete yasnippet auctex sr-speedbar monokai-theme helm volatile-highlights use-package undo-tree counsel-projectile)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans CJK SC" :foundry "GOOG" :slant normal :weight normal :height 120 :width normal)))))

(custom-set-faces
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
(load "~/.emacs.d/elpa/auctex-11.91.0/auctex.el" nil t t)
(load "~/.emacs.d/elpa/auctex-11.91.0/preview.el" nil t t)
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
