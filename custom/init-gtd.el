;; gtd
;; 捕获临时信息 C-c c; 输入完成后 C-c C-c 保存到 org-directory/notes.org 中
;; 查看 org-directory 的值: C-h v org-directory
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

;; 归档
;; C-c C-x C-a: 保存在当前目录下 xx_archive 文件中
;; C-c C-x C-s: 光标处所在子树归档

;; 设置 org-agenda 快捷键
;; org-agenda 会从 org-agenda-files 目录中收集所有的任务并呈现
(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-files '("/root/notes/GTD/"))

(provide 'init-gtd)
