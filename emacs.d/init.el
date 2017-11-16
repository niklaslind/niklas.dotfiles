

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
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(setq el-get-user-package-directory "~/.emacs.d/packages.d/")
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(el-get 'sync)


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



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("30fe7e72186c728bd7c3e1b8d67bc10b846119c45a0f35c972ed427c45bacc19" default)))
 '(org-agenda-files (quote ("~/Dropbox/GTD/TODAY.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)


;; Speedbar in current 
(require 'sr-speedbar)
(setq speedbar-use-images nil)

;; jade-mode https://github.com/brianc/jade-mode
(add-to-list 'load-path "~/.emacs.d/custom/jade-mode")
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))


(color-theme-midnight)


;;--------------------------------------------------------------------------------

;;https://emacs.cafe/emacs/javascript/setup/2017/05/09/emacs-setup-javascript-2.html
;;(require 'company-mode)
;; (require 'company-tern)
;; (add-to-list 'company-backends 'company-tern)
;; (add-hook 'js2-mode-hook (lambda ()
;;                            (tern-mode)
;;                            (company-mode)))
                           
;; ;; Disable completion keybindings, as we use xref-js2 instead
;; (define-key tern-mode-keymap (kbd "M-.") nil)
;; (define-key tern-mode-keymap (kbd "M-,") nil)


;; javascript and json
;; https://truongtx.me/2014/02/23/set-up-javascript-development-environment-in-emacs/
(setq js-indent-level 2)
(setq-default js2-basic-offset 2)

(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 2)



;;tern
;;https://truongtx.me/2014/04/20/emacs-javascript-completion-and-refactoring/
;;http://ternjs.net/doc/demo/#simple
;;(add-hook 'js-mode-hook (lambda () (tern-mode t)))
;; (eval-after-load 'tern
;; '(progn
;;   (require 'tern-auto-complete)
;;   (tern-ac-setup)))
;; ---------- end javascript ----------------------------------------


;;--------------------------------------------------------------------------------
;; paredit (balance paranthesis, javascript etc)
;; https://truongtx.me/2014/02/22/emacs-using-paredit-with-non-lisp-mode/
;;(defun my-paredit-nonlisp ()
;;  "Turn on paredit mode for non-lisps."
;;  (interactive)
;; (set (make-local-variable 'paredit-space-for-delimiter-predicates)
;;     '((lambda (endp delimiter) nil)))
;;(paredit-mode 1) )
;;(add-hook 'js-mode-hook 'my-paredit-nonlisp) ;use with the above function
;;(add-hook 'js-mode-hook 'esk-paredit-nonlisp) ;for emacs starter kit

;;(define-key js-mode-map "{" 'paredit-open-curly)
;;(define-key js-mode-map "}" 'paredit-close-curly-and-newline)

;;--------------------------------------------------------------------------------



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
;; SLIME and node-js and swank-js
;;(add-to-list 'load-path "~/.emacs.d/slime")
;;(add-to-list 'load-path "~/.emacs.d/slime-js")
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy slime-repl slime-js ))
;;(require 'slime)
;;(require 'slime-js)
(slime-setup '(slime-fancy slime-js))



;; swank-js settings

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(global-set-key [f5] 'slime-js-reload)
(add-hook 'js2-mode-hook
          (lambda ()
            (slime-js-minor-mode 1)))
;;(load-file "~/.emacs.d/setup-slime-js.el")

;;--------------------------------------------------------------------------------


(eval-after-load "vc-hooks"
  '(define-key vc-prefix-map "=" 'ediff-revision))

(setq ediff-split-window-function 'split-window-horizontally)

(server-start)

;;--------------------------------------------------------------------------------
;; tern javascript

;; (add-to-list 'load-path "/Users/nli/.emacs.d/custom/tern")
;; (autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))


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


