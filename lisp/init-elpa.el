(setq package-archives '(
    ("melpa" . "http://elpa.emacs-china.org/melpa/") ;(http://stable.melpa.org/packages") ;; ("http://elpa.emacs-china.org/melpa/") ;;("http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
    ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
    ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/"))
      package-check-signature nil ;; 去掉签名校验
      ;; load-prefer-newer t
      )
(require 'package)
;;(add-to-list 'package-archives
;;            '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
             ;;'("melpa". "http://stable.melpa.org/packages") t)
             ;;'("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t  ;; 确保软件已安装
        ;; use-package-always-defer t  ;; 延迟加载
        use-package-expand-minimally t)
  (require 'use-package))

;; use-package是一个包管理工具, 如果在插件中有写use-package 包名, 那么在emacs启动时, 会自动加载这些插件

(provide 'init-elpa)
