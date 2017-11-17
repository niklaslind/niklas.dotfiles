

(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

;;--------------------------------------------------------------------------------
;; UC upplysningscentralen stuff
(defun uc-notes ()
   (interactive)
   (find-file "~/worklocal/uc/performance2016Q4/uc_worklog.org")
 )
;;--------------------------------------------------------------------------------


(setq exec-path (append exec-path '("/usr/local/bin"))) ;;needed for gpg
(setq visible-bell 'top-bottom)


(setq multi-term-program "/bin/zsh")

;; For emacsclient to connect to
(setq server-socket-dir "~/.emacs.d/serversocket")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;;--------------------------------------------------------------------------------
;; ace-window
(global-set-key (kbd "C-x o") 'ace-window)
;;-------  end tide, ace-window -------------------------------------------------------------------------



;; Use M-c for copy since M-w makes me close other applications :(
(global-set-key "\M-c" 'clipboard-kill-ring-save)

;; Allow ALT for |[]{}
(if (boundp 'ns-command-modifier)
    (setq ns-command-modifier 'meta))
(if (boundp 'ns-option-modifier)
    (setq ns-option-modifier nil))


;; encrypt .gpg-files
(require 'epa-file)
(epa-file-enable)

;; tool-bar off, save history between sessions
(tool-bar-mode -1)
(savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))


;; emacs package manager el-get-list-packages
;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;; (setq el-get-user-package-directory "~/.emacs.d/packages.d/")
;; (unless (require 'el-get nil t)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;     (goto-char (point-max))
;;     (eval-print-last-sexp)))
;; (el-get 'sync)
;;; 

;;--------------------------------------------------------------------------------
;; indent org-mode
(add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode t))
          t)

;; org-mode agenda global key mappings
 (global-set-key "\C-cl" 'org-store-link)
     (global-set-key "\C-cc" 'org-capture)
     (global-set-key "\C-ca" 'org-agenda)
     (global-set-key "\C-cb" 'org-iswitchb)
;;broken: (setq org-default-notes-file (concat  org-directory "~/Dropbox/GTD/notes.org"))

;; org-mode capture templates
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Dropbox/GTD/notes.org" "Tasks")
             "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
             "* %?\nEntered on %U\n  %i\n  %a")))


;; MObileOrg
;;(setq org-directory "~/Dropbox/MobileOrg")
(setq org-directory "~/Dropbox/GTD/org")
(setq org-mobile-inbox-for-pull "~/Dropbox/GTD/org/from-mobile.org")
(setq org-mobile-files (quote ("mobile.org")))
(setq org-mobile-directory  "~/Dropbox/Apps/MobileOrg")

;;--------------------------------------------------------------------------------

;; remap markdown global cycle from <S-iso-lefttab>
(global-set-key (kbd "<S-tab>") 'markdown-shifttab)


;; map TODAY and worklog keybindings
(defun today ()
   (interactive)
   (find-file "~/Dropbox/GTD/TODAY.org")
 )
(defun worklog ()
   (interactive)
   (find-file "~/Dropbox/GTD/worklog.markdown")
 )
(defun backlog ()
   (interactive)
   (find-file "~/Dropbox/GTD/backlog.markdown")
 )


;; (global-set-key (kbd "M-,") 'today  )
;; (global-set-key (kbd "M-.") 'worklog  )
;; (global-set-key (kbd "M-m") 'backlog  )

;;--------------------------------------------------------------------------------

;; xmllint format xml
(defun xmllint ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "xmllint --format -" (buffer-name) t)
  )
)

(put 'downcase-region 'disabled nil)

;;; turn on syntax highlighting
(global-font-lock-mode 1)


;; regexp-builder
(require 're-builder)
;;(setq reb-re-syntax ')

(put 'upcase-region 'disabled nil)

;;(color-theme-midnight)
(load-theme 'dracula t)

;;--------------------------------------------------------------------------------

;; javascript and json
;; https://truongtx.me/2014/02/23/set-up-javascript-development-environment-in-emacs/
(setq js-indent-level 2)
(setq-default js2-basic-offset 2)

(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 2)

;; ---------- end javascript ----------------------------------------


;;--------------------------------------------------------------------------------
;; fold blocks
;;--------------------------------------------------------------------------------
;; Show-hide
(global-set-key (kbd "") 'hs-show-block)
(global-set-key (kbd "") 'hs-show-all)
(global-set-key (kbd "") 'hs-hide-block)
(global-set-key (kbd "") 'hs-hide-all)
;;--------------------------------------------------------------------------------

;;--------------------------------------------------------------------------------
;;Yasnippet and Autocomplete
;; https://truongtx.me/2013/01/06/config-yasnippet-and-autocomplete-on-emacs/
(require 'yasnippet)
(yas-global-mode 1)
;;; auto complete mod
;;; should be loaded after yasnippet so that they can work together
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
;;--------------------------------------------------------------------------------


;;--------------------------------------------------------------------------------
;; swank-js settings

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(global-set-key [f5] 'slime-js-reload)
(add-hook 'js2-mode-hook
          (lambda ()
            (slime-js-minor-mode 1)))
;;(load-file "~/.emacs.d/setup-slime-js.el")

;;--------------------------------------------------------------------------------

(setq ediff-split-window-function 'split-window-horizontally)

(server-start)

;;--------------------------------------------------------------------------------
;; ctags
(setq path-to-ctags "/Users/nli/bin/tags/ctags")
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "/usr/local/Cellar/ctags/5.8_1/bin/ctags -f %s -e -R %s" path-to-ctags (directory-file-name dir-name)))
  )

;;--------------------------------------------------------------------------------
;; hunspell (ispell) directory
(setenv "DICTIONARY" "sv_SE")

;;--------------------------------------------------------------------------------
;; ditaa (draw blocks) in org-mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t))) ; this line activates ditaa

;;--------------------------------------------------------------------------------
;; graphviz in org-mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t))) ; this line activates dot


;;--------------------------------------------------------------------------------
;; fiplr fuzzy search file names

(setq fiplr-ignored-globs '((directories (".git" ".svn" "node_modules" "bower_components"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))

;;--------------------------------------------------------------------------------
;; Helm search short cuts

(require 'helm-config) 
(helm-mode 1)
(ido-mode 1)
(ido-yes-or-no-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'ido-switch-buffer)
(global-set-key (kbd "M-s s") 'helm-multi-swoop-all)
(global-set-key (kbd "M-s S") 'helm-swoop)
(global-set-key (kbd "M-s l") 'helm-ls-git-ls)
(global-set-key (kbd "M-s a") 'helm-ag-project-root)
(global-set-key (kbd "M-s M-m") 'helm-all-mark-rings)

;;--------------------------------------------------------------------------------
;; tide, typescript
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; format options
(setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))

;;-------  end tide, typescript -------------------------------------------------------------------------


