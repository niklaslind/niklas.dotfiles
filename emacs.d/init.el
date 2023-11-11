



(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

(setq display-line-numbers-type t)

(setq user-full-name "Niklas Lind"
      user-mail-address "niklas.johan.lind@gmail.com")




;;--------------------------------------------------------------------------------
;; UC upplysningscentralen stuff
(defun uc-notes ()
   (interactive)
   (find-file "~/worklocal/uc/performance2016Q4/uc_worklog.org")
 )
;;--------------------------------------------------------------------------------


;;--------------------------------------------------------------------------------
;; Tramp, faster
(setq tramp-default-method "ssh")
;;--------------------------------------------------------------------------------


(setq exec-path (append exec-path '("/usr/local/bin"))) ;;needed for gpg
(setq visible-bell 'top-bottom)


(setq multi-term-program "/bin/zsh")

;; For emacsclient to connect to
(setq server-socket-dir "~/.emacs.d/serversocket")

(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-refresh-contents)

;; (require 'package)
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (package-initialize)


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
;; expand-region
;;--------------------------------------------------------------------------------
(global-set-key [?\C-+] 'er/expand-region)
;;--------------------------------------------------------------------------------


;;--------------------------------------------------------------------------------
;; Org-mode
;;--------------------------------------------------------------------------------

;; indent org-mode
(add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode t))
          t)


;; (setq org-agenda-custom-commands
;;       '(("ces" "Custom: Agenda and Emacs SOMEDAY [#A] items"
;;          ((org-ql-block '(or (todo "IDAG")
;;                              (closed :on today))
;;                              (:groups (priority))
;;                         )
;;           (agenda)))))

;; (defun idagDone ()
;;   (interactive)
;;   (org-ql-view "idagDone")
;;   )



;; org-mode agenda global key mappings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cr" 'helm-org-rifle-agenda-files)
;;(global-set-key "\C-ca" 'idagDone)
(global-set-key "\C-ca" 'org-agenda)
;;broken: (setq org-default-notes-file (concat  org-directory "~/Dropbox/GTD/notes.org"))


(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("stan" . ?s)))

(setq org-todo-keywords
      '((sequence "TODO(t)" "IDAG(i)" "|" "DONE(d)")))

(setq org-agenda-files (list
                        "~/Dropbox/GTD/inbox.org"
                        "~/Dropbox/GTD/tyrens.org"
                        "~/Dropbox/GTD/home.org"
                        "~/Dropbox/GTD/work.org"
                        "~/Dropbox/GTD/brf.org"
                        "~/Dropbox/GTD/coach.org"
                        "~/Dropbox/GTD/habits.org"
                        "~/Dropbox/GTD/readinglist.org"
                        "~/Dropbox/GTD/journal-brf.org"
                        "~/Dropbox/GTD/journal-work.org"
                        "~/Dropbox/GTD/journal-art.org"
                        "~/Dropbox/GTD/journal.org"
                        ))

(setq org-refile-targets '((org-agenda-files :maxlevel . 1)))
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)

(setq org-log-done t)

;; org-mode capture templates
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Dropbox/GTD/inbox.org" "Tasks")
             "* TODO %?\n  %i\n  %a")

        ("j" "Journal" entry
         (file+datetree "~/Dropbox/GTD/roam/2020Q4_journal.org")
         "* %T %?" :jump-to-captured 1)

        ("w" "Work journal" entry (file+datetree "~/Dropbox/GTD/journal-work.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("y" "Tyrens journal" entry (file+datetree "~/Dropbox/GTD/tyrens.org")
             "* %?\nEntered on %U\n  %i\n  %a")
        ("b" "Brf journal" entry (file+datetree "~/Dropbox/GTD/journal-brf.org")
             "* %?\nEntered on %U\n  %i\n  %a")
        ("a" "Art journal" entry (file+datetree "~/Dropbox/GTD/journal-art.org")
             "* %?\nEntered on %U\n  %i\n  %a")))


;;org habit
(with-eval-after-load 'org
  (add-to-list 'org-modules 'org-habit t))
(setq org-log-into-drawer t)


;;org-reveal
(require 'ox-reveal)
(setq org-reveal-root "file:///Users/nli/worklocal/reveal.js")
(setq org-reveal-title-slide nil)


;; ------- org-roam -------------------------------------------------------------------------

(with-eval-after-load 'company
  (add-to-list 'company-backends
               'company-tabnine
               ;; 'company-org-roam
               ;; 'company-yasnippet
               ;; 'company-dabbrev
               ))




(require 'use-package)
(use-package org-roam
  :hook (org-load . org-roam-mode)
  :commands (org-roam-buffer-toggle-display
             org-roam-find-file
             org-roam-graph
             org-roam-insert
             org-roam-switch-to-buffer
             org-roam-dailies-date
             org-roam-dailies-today
             org-roam-dailies-tomorrow
             org-roam-dailies-yesterday)
  :preface
  ;; Set this to nil so we can later detect whether the user has set a custom
  ;; directory for it, and default to `org-directory' if they haven't.
  (defvar org-roam-directory "~/Dropbox/GTD/roam")

  :init
  :config
;;  (setq org-roam-directory (expand-file-name (or org-roam-directory "roam")
;;                                             org-directory)
  (setq org-roam-directory "~/Dropbox/GTD/roam"
        org-roam-verbose nil  ; https://youtu.be/fn4jIlFwuLU
        org-roam-buffer-no-delete-other-windows t ; make org-roam buffer sticky
        org-roam-completion-system 'helm
        )

  ;; Normally, the org-roam buffer doesn't open until you explicitly call
  ;; `org-roam'. If `+org-roam-open-buffer-on-find-file' is non-nil, the
  ;; org-roam buffer will be opened for you when you use `org-roam-find-file'
  ;; (but not `find-file', to limit the scope of this behavior).
  (add-hook 'find-file-hook
    (defun +org-roam-open-buffer-maybe-h ()
      (and +org-roam-open-buffer-on-find-file
           (memq 'org-roam-buffer--update-maybe post-command-hook)
           (not (window-parameter nil 'window-side)) ; don't proc for popups
           (not (eq 'visible (org-roam-buffer--visibility)))
           (with-current-buffer (window-buffer)
             (org-roam-buffer--get-create)))))

  ;; Hide the mode line in the org-roam buffer, since it serves no purpose. This
  ;; makes it easier to distinguish among other org buffers.
  (add-hook 'org-roam-buffer-prepare-hook #'hide-mode-line-mode))


;; Since the org module lazy loads org-protocol (waits until an org URL is
;; detected), we can safely chain `org-roam-protocol' to it.
(use-package org-roam-protocol
  :after org-protocol)


(use-package company-org-roam
  :after org-roam
  :config
  (setq company-backends 'org-mode '(company-org-roam company-yasnippet company-dabbrev)))


;; (use-package org-roam
;;       :ensure t
;;       :hook
;;       (after-init . org-roam-mode)
;;       :custom
;;       (org-roam-directory "~/Dropbox/GTD/roam")
;;       :bind (:map org-roam-mode-map
;;               (("C-c n l" . org-roam)
;;                ("C-c n f" . org-roam-find-file)
;;                ("C-c n g" . org-roam-graph))
;;               :map org-mode-map
;;               (("C-c n i" . org-roam-insert))
;;               (("C-c n I" . org-roam-insert-immediate))))


;;--------------------------------------------------------------------------------


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
;(load-theme 'dracula t)
;(load-theme 'abyss t)
;(load-theme 'material t)
;(load-theme 'moe-dark t)
(load-theme 'wombat t)

;;--------------------------------------------------------------------------------

;; javascript and json
;; https://truongtx.me/2014/02/23/set-up-javascript-development-environment-in-emacs/
(setq-default indent-tabs-mode nil)
(setq js-indent-level 2)
(setq-default js2-basic-offset 2)

(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js-mode-hook 'yas-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(setq js2-highlight-level 2)

;; ---------- end javascript ----------------------------------------


;;--------------------------------------------------------------------------------
;; fold blocks
;;--------------------------------------------------------------------------------
;; Show-hide
;; (global-set-key (kbd "<C-return>") 'hs-toggle-hiding)
;; (global-set-key (kbd "") 'hs-show-block)
;; (global-set-key (kbd "") 'hs-show-all)
;; (global-set-key (kbd "") 'hs-hide-block)
;; (global-set-key (kbd "<M-C-return>") 'hs-hide-all)


;; origami
(global-set-key (kbd "<C-return>") 'origami-recursively-toggle-node)
(global-set-key (kbd "") 'hs-show-block)


;; (add-hook 'prog-mode-hook
;;           (lambda () (yafolding-mode)))
;;--------------------------------------------------------------------------------

;; ;;--------------------------------------------------------------------------------
;; ;;Yasnippet and Autocomplete
;; ;; https://truongtx.me/2013/01/06/config-yasnippet-and-autocomplete-on-emacs/
;; (require 'yasnippet)
;; (yas-global-mode 1)

;
;;; auto complete mod
;;; should be loaded after yasnippet so that they can work together
;(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;(ac-config-default)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
;(ac-set-trigger-key "TAB")
;(ac-set-trigger-key "<tab>")



----------------------------------------------------------------------------
;; swank-js settings

;; (autoload 'js2-mode "js2-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (global-set-key [f5] 'slime-js-reload)
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (slime-js-minor-mode 1)))
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
;; sh in org-mode
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((sh . t))) ; this line activates dot

(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t))
 )
;;--------------------------------------------------------------------------------
;; javascript in org-mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((js . t))) ; this line activates dot

;;--------------------------------------------------------------------------------
;; circular bullets in org-mode
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
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
;;(global-set-key (kbd "C-x b") 'ido-switch-buffer)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "M-s s") 'helm-multi-swoop-all)
(global-set-key (kbd "M-s S") 'helm-swoop)
(global-set-key (kbd "M-s l") 'helm-ls-git-ls)
(global-set-key (kbd "M-s a") 'helm-ag-project-root)
(global-set-key (kbd "M-s m") 'helm-mark-ring)
(global-set-key (kbd "M-s M") 'helm-all-mark-rings)
(global-set-key (kbd "M-s o") 'helm-occur)
(global-set-key (kbd "M-s b") 'helm-bookmarks)


;;--------------------------------------------------------------------------------
;; show matching parentheses
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
;;(setq show-paren-style 'expression)

;;--------------------------------------------------------------------------------

;;--------------------------------------------------------------------------------
;;smart-mode-line
;; (sml/setup)
;; (add-to-list 'sml/replacer-regexp-list '("^~/worklocal/uc/2016Q4_3_project/git/" ":UC-GIT:") t)
;(powerline-default-theme)


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

;; (require 'flycheck)
;; (add-hook 'js-mode-hook
;;           (lambda () (flycheck-mode t)))

;;-------  end tide, typescript -------------------------------------------------------------------------
;;override theme
(set-cursor-color "lightgreen")
(setq visible-bell nil)

;;---------- flymake-json, jsonlint------------------------------------------------
;; https://sdqali.in/blog/2013/07/31/validating-json-in-emacs/
(setenv "PATH" (concat (getenv "PATH") ":/Users/nli/.nvm/versions/node/v8.6.0/bin"))
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin/docker-compose"))
(setq exec-path (append exec-path '("/Users/nli/.nvm/versions/node/v8.6.0/bin")))
(setq exec-path (append exec-path '("/usr/local/bin/docker-compose")))

;;----------- git ---------------------------------------------------------------------



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )






;;--------------------------------------------------------------------------------
;; git-gutter
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "dcf229d4673483cb7b38505360824fa56a0d7b52f54edbcdca98cf5059fa1662" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "2a739405edf418b8581dcd176aaf695d319f99e3488224a3c495cb0f9fd814e3" default)))
 '(git-gutter:update-interval 1)
 '(org-ql-views
   (quote
    (("idagDone" :buffers-files
      ("~/Dropbox/GTD/inbox.org" "~/Dropbox/GTD/home.org" "~/Dropbox/GTD/work.org" "~/Dropbox/GTD/brf.org" "~/Dropbox/GTD/coach.org" "~/Dropbox/GTD/readinglist.org")
      :query
      (or
       (todo "IDAG")
       (closed :on today))
      :sort nil :narrow nil :super-groups
      ((:auto-priority))
      :title "idagDone")
     ("idag" :buffers-files
      ("~/Dropbox/GTD/inbox.org" "~/Dropbox/GTD/home.org" "~/Dropbox/GTD/work.org" "~/Dropbox/GTD/brf.org" "~/Dropbox/GTD/coach.org" "~/Dropbox/GTD/readinglist.org")
      :query
      (todo "IDAG")
      :sort nil :narrow nil :super-groups
      ((:auto-priority))
      :title "idag")
     ("Overview: Agenda-like" :buffers-files org-agenda-files :query
      (and
       (not
        (done))
       (or
        (habit)
        (deadline auto)
        (scheduled :to today)
        (ts-active :on today)))
      :sort
      (date)
      :super-groups org-super-agenda-groups :title "Agenda-like")
     ("Overview: NEXT tasks" :buffers-files org-agenda-files :query
      (todo "NEXT")
      :sort
      (priority date)
      :super-groups org-super-agenda-groups :title "Overview: NEXT tasks")
     ("Calendar: Today" :buffers-files org-agenda-files :query
      (ts-active :on today)
      :title "Today" :super-groups org-super-agenda-groups :sort
      (priority))
     ("Calendar: This week" .
      #[0 "\301 \302\303\304\305\304\306\304\307\310\301 \311!>\204 \312\313\314D\"\210\211\315H\204\232 \211\315\316\317\320\311!>\2048 \312\313\314D\"\210\321H\204\223 \321\322H\323H	\324H
\325H\326H\327H\211
\211\203\213 \203\213 \203\213 \203\213 \203\213 \203\213 \330\331
&!\202\215 \330 \266\206\266\206I\210\321H\"!I\210\211\315H\262[
#&\302\303\332\305\333\306\333\307\310\327\301 \311!>\204\300 \312\313\314D\"\210\211\315H\204>\211\315\316\317\320\311!>\204\334 \312\313\314D\"\210\321H\2047\321\322H\323H	\324H
\325H\326H\327H\211
\211\203/\203/\203/\203/\203/\203/\330\331
&!\2021\330 \266\206\266\206I\210\321H\"!I\210\211\315H\262Z#&\334\335 \336\337\340\257\341\342\343\344\345\346&\207"
          [cl-struct-ts-tags ts-now ts-apply :hour 0 :minute :second ts-adjust day type-of signal wrong-type-argument ts 7 string-to-number format-time-string "%w" 17 3 2 1 4 5 6 float-time encode-time 23 59 org-ql-search org-agenda-files ts-active :from :to :title "This week" :super-groups org-super-agenda-groups :sort
                             (priority)]
          40 "Show items with an active timestamp during this calendar week." nil])
     ("Calendar: Next week" .
      #[0 "\301\302\303\304 #\305\306\307\310\307\311\307\301\302\304 \312!>\204  \313\314\315D\"\210\211\303H\204\236 \211\303\316\317\320\312!>\204< \313\314\315D\"\210\321H\204\227 \321\322H\323H	\324H
\325H\326H\327H\211
\211\203\217 \203\217 \203\217 \203\217 \203\217 \203\217 \330\331
&!\202\221 \330 \266\206\266\206I\210\321H\"!I\210\211\303H\262[
#&\305\306\332\310\333\311\333\301\302\327\304 \312!>\204\304 \313\314\315D\"\210\211\303H\204B\211\303\316\317\320\312!>\204\340 \313\314\315D\"\210\321H\204;\321\322H\323H	\324H
\325H\326H\327H\211
\211\2033\2033\2033\2033\2033\2033\330\331
&!\2025\330 \266\206\266\206I\210\321H\"!I\210\211\303H\262Z#&\334\335 \336\337\340\257\341\342\343\344\345\346&\207"
          [cl-struct-ts-tags ts-adjust day 7 ts-now ts-apply :hour 0 :minute :second type-of signal wrong-type-argument ts string-to-number format-time-string "%w" 17 3 2 1 4 5 6 float-time encode-time 23 59 org-ql-search org-agenda-files ts-active :from :to :title "Next week" :super-groups org-super-agenda-groups :sort
                             (priority)]
          40 "Show items with an active timestamp during the next calendar week." nil])
     ("Review: Recently timestamped" . org-ql-view-recent-items)
     (#("Review: Dangling tasks" 0 22
        (help-echo "Tasks whose ancestor is done"))
      :buffers-files org-agenda-files :query
      (and
       (todo)
       (ancestors
        (done)))
      :title
      #("Review: Dangling tasks" 0 22
        (help-echo "Tasks whose ancestor is done"))
      :sort
      (date priority todo)
      :super-groups
      ((:auto-parent t)))
     (#("Review: Stale tasks" 0 19
        (help-echo "Tasks without a timestamp in the past 2 weeks"))
      :buffers-files org-agenda-files :query
      (and
       (todo)
       (not
        (ts :from -14)))
      :title
      #("Review: Stale tasks" 0 19
        (help-echo "Tasks without a timestamp in the past 2 weeks"))
      :sort
      (date priority todo)
      :super-groups
      ((:auto-parent t)))
     (#("Review: Stuck projects" 0 22
        (help-echo "Tasks with sub-tasks but no NEXT sub-tasks"))
      :buffers-files org-agenda-files :query
      (and
       (todo)
       (descendants
        (todo))
       (not
        (descendants
         (todo "NEXT"))))
      :title
      #("Review: Stuck projects" 0 22
        (help-echo "Tasks with sub-tasks but no NEXT sub-tasks"))
      :sort
      (priority date)
      :super-groups org-super-agenda-groups))))
 '(package-selected-packages
   (quote
    (org-roam verb xref-js2 yasnippet-snippets ox-reveal ob-restclient swiper-helm org-plus-contrib helm-org-rifle org-ql 0blayout git-gutter docker-compose-mode dockerfile-mode indium json-reformat restclient-helm restclient ob-http highlight-blocks rainbow-delimiters adoc-mode magit origami shell-pop eldoro org-pomodoro gtk-pomodoro-indicator helm-flyspell flycheck-demjsonlint flycheck flymake-json yaml-mode helm-swoop helm-ls-git ace-window helm-ag js2-mode yafolding yasnippet sml-mode org-bullets ido-yes-or-no helm auto-complete))))

;;----
