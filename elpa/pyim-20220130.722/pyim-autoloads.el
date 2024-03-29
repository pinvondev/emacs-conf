;;; pyim-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "pyim" "pyim.el" (0 0 0 0))
;;; Generated autoloads from pyim.el

(defvar pyim-title "PYIM ")

(register-input-method "pyim" "UTF-8" #'pyim-activate pyim-title)

(autoload 'pyim-activate "pyim" "\
pyim 启动函数.

pyim 是使用 `pyim-activate' 来启动输入法，这个命令主要做如下工作：
1. 重置所有的 local 变量。
2. 创建汉字到拼音和拼音到汉字的 hash table。
3. 创建词库缓存 dcache.
4. 运行 hook： `pyim-load-hook'。
5. 将 `pyim-kill-emacs-hook-function' 命令添加到 `kill-emacs-hook' , emacs 关闭
之前将用户选择过的词生成的缓存和词频缓存保存到文件，供以后使用。
6. 设定变量：
   1. `input-method-function'
   2. `deactivate-current-input-method-function'
7. 运行 `pyim-activate-hook'

pyim 使用函数 `pyim-activate' 启动输入法的时候，会将变量
`input-method-function' 设置为 `pyim-input-method' ，这个变量会影
响 `read-event' 的行为。

当输入字符时，`read-event' 会被调用，`read-event' 调用的过程中，
会执行 `pyim-input-method' 这个函数。

\(fn &optional ARGS)" t nil)

(autoload 'pyim-convert-string-at-point "pyim" "\
将光标前的用户输入的字符串转换为中文.

如果 RETURN-CREGEXP 为真, pyim 会把用户输入的字符串当作
拼音，依照这个拼音来构建一个 regexp, 用户可以用这个 regexp
搜索拼音对应的汉字。

\(fn &optional RETURN-CREGEXP)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim" '("pyim-")))

;;;***

;;;### (autoloads nil "pyim-autoselector" "pyim-autoselector.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim-autoselector.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-autoselector" '("pyim-autoselector")))

;;;***

;;;### (autoloads nil "pyim-candidates" "pyim-candidates.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from pyim-candidates.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-candidates" '("pyim-")))

;;;***

;;;### (autoloads nil "pyim-codes" "pyim-codes.el" (0 0 0 0))
;;; Generated autoloads from pyim-codes.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-codes" '("pyim-codes-create")))

;;;***

;;;### (autoloads nil "pyim-common" "pyim-common.el" (0 0 0 0))
;;; Generated autoloads from pyim-common.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-common" '("pyim-")))

;;;***

;;;### (autoloads nil "pyim-cregexp" "pyim-cregexp.el" (0 0 0 0))
;;; Generated autoloads from pyim-cregexp.el

(defvar pyim-isearch-mode nil "\
Non-nil if Pyim-Isearch mode is enabled.
See the `pyim-isearch-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `pyim-isearch-mode'.")

(custom-autoload 'pyim-isearch-mode "pyim-cregexp" nil)

(autoload 'pyim-isearch-mode "pyim-cregexp" "\
这个 mode 为 isearch 添加拼音搜索功能.

If called interactively, enable Pyim-Isearch mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-cregexp" '("pyim-cregexp-")))

;;;***

;;;### (autoloads nil "pyim-cstring" "pyim-cstring.el" (0 0 0 0))
;;; Generated autoloads from pyim-cstring.el

(autoload 'pyim-cstring-to-pinyin "pyim-cstring" "\
将汉字字符串转换为对应的拼音字符串的工具.

如果 SHOU-ZI-MU 设置为 t, 转换仅得到拼音首字母字符串。当
RETURN-LIST 设置为 t 时，返回一个拼音列表，这个列表包含词条的一个
或者多个拼音（词条包含多音字时）；如果 IGNORE-DUO-YIN-ZI 设置为
t, 遇到多音字时，只使用第一个拼音，其它拼音忽略；当
ADJUST-DUO-YIN-Zi 设置为 t 时, `pyim-cstring-to-pinyin' 会使用 pyim 已
安装的词库来校正多音字，但这个功能有一定的限制:

1. pyim 普通词库中不存在的词条不能较正
2. 多音字校正速度比较慢，实时转换会产生卡顿。

BUG: 当 STRING 中包含其它标点符号，并且设置 SEPERATER 时，结果会
包含多余的连接符：比如： '你=好' --> 'ni-=-hao'

\(fn STRING &optional SHOU-ZI-MU SEPARATOR RETURN-LIST IGNORE-DUO-YIN-ZI ADJUST-DUO-YIN-ZI)" nil nil)

(autoload 'pyim-cstring-to-pinyin-simple "pyim-cstring" "\
简化版的 `pyim-cstring-to-pinyin', 不处理多音字。

\(fn STRING &optional SHOU-ZI-MU SEPARATOR RETURN-LIST)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-cstring" '("pyim-cstring-")))

;;;***

;;;### (autoloads nil "pyim-dcache" "pyim-dcache.el" (0 0 0 0))
;;; Generated autoloads from pyim-dcache.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-dcache" '("pyim-dcache-")))

;;;***

;;;### (autoloads nil "pyim-dhashcache" "pyim-dhashcache.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from pyim-dhashcache.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-dhashcache" '("pyim-dhashcache-")))

;;;***

;;;### (autoloads nil "pyim-dict" "pyim-dict.el" (0 0 0 0))
;;; Generated autoloads from pyim-dict.el

(autoload 'pyim-dicts-manager "pyim-dict" "\
pyim 词库管理器。

使用这个词库管理器可以方便的执行下列命令：
1. 添加词库。
2. 删除词库。
3. 向上和向下移动词库。
4. 保存词库设置。
5. 重启输入法。" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-dict" '("pyim-")))

;;;***

;;;### (autoloads nil "pyim-dregcache" "pyim-dregcache.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from pyim-dregcache.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-dregcache" '("pyim-dregcache-")))

;;;***

;;;### (autoloads nil "pyim-entered" "pyim-entered.el" (0 0 0 0))
;;; Generated autoloads from pyim-entered.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-entered" '("pyim-entered-")))

;;;***

;;;### (autoloads nil "pyim-imobjs" "pyim-imobjs.el" (0 0 0 0))
;;; Generated autoloads from pyim-imobjs.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-imobjs" '("pyim-imobjs")))

;;;***

;;;### (autoloads nil "pyim-indicator" "pyim-indicator.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from pyim-indicator.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-indicator" '("pyim-indicator-")))

;;;***

;;;### (autoloads nil "pyim-liberime" "pyim-liberime.el" (0 0 0 0))
;;; Generated autoloads from pyim-liberime.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-liberime" '("pyim-")))

;;;***

;;;### (autoloads nil "pyim-outcome" "pyim-outcome.el" (0 0 0 0))
;;; Generated autoloads from pyim-outcome.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-outcome" '("pyim-")))

;;;***

;;;### (autoloads nil "pyim-page" "pyim-page.el" (0 0 0 0))
;;; Generated autoloads from pyim-page.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-page" '("pyim-page-")))

;;;***

;;;### (autoloads nil "pyim-pinyin" "pyim-pinyin.el" (0 0 0 0))
;;; Generated autoloads from pyim-pinyin.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-pinyin" '("pyim-pinyin-")))

;;;***

;;;### (autoloads nil "pyim-preview" "pyim-preview.el" (0 0 0 0))
;;; Generated autoloads from pyim-preview.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-preview" '("pyim-preview-")))

;;;***

;;;### (autoloads nil "pyim-probe" "pyim-probe.el" (0 0 0 0))
;;; Generated autoloads from pyim-probe.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-probe" '("pyim-probe-")))

;;;***

;;;### (autoloads nil "pyim-process" "pyim-process.el" (0 0 0 0))
;;; Generated autoloads from pyim-process.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-process" '("pyim-")))

;;;***

;;;### (autoloads nil "pyim-punctuation" "pyim-punctuation.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from pyim-punctuation.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-punctuation" '("pyim-punctuation-")))

;;;***

;;;### (autoloads nil "pyim-pymap" "pyim-pymap.el" (0 0 0 0))
;;; Generated autoloads from pyim-pymap.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-pymap" '("pyim-pymap")))

;;;***

;;;### (autoloads nil "pyim-scheme" "pyim-scheme.el" (0 0 0 0))
;;; Generated autoloads from pyim-scheme.el

(autoload 'pyim-default-scheme "pyim-scheme" "\


\(fn &optional SCHEME-NAME)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyim-scheme" '("pyim-")))

;;;***

;;;### (autoloads nil nil ("pyim-hacks.el" "pyim-pkg.el") (0 0 0
;;;;;;  0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; pyim-autoloads.el ends here
