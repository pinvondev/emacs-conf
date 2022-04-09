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
  ;; (pyim-isearch-mode 1)

  ;; 使用 popup-el 来绘制选词框, 如果使用 emacs26, 建议设置为 'posframe
  ;; 速度很多快且菜单不会变形, 不过需要自行安装 posframe
  (setq pyim-page-tooltip 'popup)

  ;; 选词框显示 5 个候选词
  (setq pyim-page-length 10)

  ;; 使用半角标点
  (setq pyim-punctuation-translate-p '(no yes auto))
  ;; (setq pyim-punctuation-translate-p '(yes no auto))  ;; 使用全角标点
  ;; (setq pyim-punctuation-translate-p '(auto yes no))  ;; 英文用半角 中文用半角

  :bind
  (("M-j" . pyim-convert-string-at-point)
   ("C-;" . pyim-delete-word-from-personal-buffer)))

(provide 'init-input)
