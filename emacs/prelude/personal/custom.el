;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/worklocal/202609_personal_tracker/ai-journal.org"
     "~/worklocal/202609_personal_tracker/ai-todo.org"
     "/Users/nli/Dropbox/emacs-org/deft/backlog-atilia.org"
     "/Users/nli/Dropbox/emacs-org/deft/backlog-brf.org"
     "/Users/nli/Dropbox/emacs-org/deft/backlog-inbox.org"
     "/Users/nli/Dropbox/emacs-org/deft/backlog-mm.org"
     "/Users/nli/Dropbox/emacs-org/deft/backlog-nli.org"
     "/Users/nli/Dropbox/emacs-org/deft/nli2.org"
     "/Users/nli/Dropbox/emacs-org/deft/qfish.org"
     "/Users/nli/Dropbox/emacs-org/deft/readinglist.org"))

 '(package-selected-packages
   '(ace-window adoc-mode ag anzu async browse-kill-ring company-anaconda
                consult crux csv-mode diff-hl diminish
                discover-my-major dockerfile-mode easy-kill
                elisp-slime-nav epl evil exec-path-from-shell
                expand-region flycheck gist git-modes git-timemachine
                gptel guru-mode hl-todo imenu-anywhere js2-mode
                json-mode lsp-ui magit move-text nlinum notmuch
                ob-http operate-on-number orderless org-super-agenda
                ox-reveal pretty-hydra projectile rainbow-delimiters
                rainbow-mode smartparens smartrep super-save undo-tree
                vertico volatile-highlights web-mode wfnames yaml-mode
                zenburn-theme zop-to-char)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; make cmd key do Meta
(setq mac-command-modifier 'meta)
;; value can be 'hyper, 'super, 'meta, 'alt, 'control or 'shift

;; make opt key do Super
(setq mac-option-modifier 'super)
(setq mac-option-modifier 'option)

;; make Control key do Control
(setq mac-control-modifier 'control)

;; make Fn key do Hyper
(setq ns-function-modifier 'hyper)

;; Use M-c for copy since M-w makes me close other applications :(
(global-set-key "\M-c" 'clipboard-kill-ring-save)


;;--------------------------------------------------------------------------------
;; expand-region
;;--------------------------------------------------------------------------------
(global-set-key [?\C-+] 'er/expand-region)
;;--------------------------------------------------------------------------------



;;--------------------------------------------------------------------------------
;; Org-mode
;;--------------------------------------------------------------------------------


(windmove-mode -1) ;;This overrides som org-mode keys like S-up

(add-hook 'org-mode-hook #'org-indent-mode)

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-<right>") #'org-shiftright)
  (define-key org-mode-map (kbd "C-<left>")  #'org-shiftleft))

(let ((default-directory "~/Dropbox/emacs-org/journals"))
  (setq org-nli-journal-file (expand-file-name "journal-nli.org"))
  (setq org-atilia-journal-file (expand-file-name "journal-atilia.org"))
  (setq org-brf-journal-file (expand-file-name "journal-brf.org"))
  (setq org-mm-journal-file (expand-file-name "journal-mm.org"))
  (setq org-snoken-journal-file (expand-file-name "journal-snoken.org"))
  )
(setq org-inbox-file  "~/Dropbox/emacs-org/deft/backlog-inbox.org")


(setq org-refile-targets '((org-agenda-files :maxlevel . 2)))
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)
(setq org-log-done nil)



;;--------------------------------------------------------------------------------
;; Org-agenda
;;--------------------------------------------------------------------------------


;;(setq org-tags-match-list-sublevels 'indented)
(setq org-overriding-columns-format "%6TODO %2PRIORITY %100ITEM 100%ALLTAGS")
(setq org-agenda-view-columns-initially t)
(setq org-agenda-custom-commands
      '(
        ("Z" "Month" tags-todo "month")
        ("z" "Zen next" todo "NEXT")
        ))
(org-super-agenda-mode)


(setq org-agenda-custom-commands
      '(("ab" "Viktiga uppgifter (A och B)"
         ((tags "+PRIORITY<=\"D\""
                     ((org-agenda-overriding-header "Prioritet A & B (sorterat)")
                      (org-agenda-sorting-strategy '(priority-down)))))
         ((org-agenda-files '("~/Dropbox/emacs-org/deft/backlog-nli.org")   )))))






;;--------------------------------------------------------------------------------
;; Org-capture templates
;;--------------------------------------------------------------------------------

(setq org-capture-templates
      '(
        ("C" "Todo" entry
         (file+headline  org-inbox-file "Tasks")
         "* TODO %t %?")

        ("n" "nli journal" entry
         (file+datetree org-nli-journal-file)
         "* %T %?" :jump-to-captured 1)

        ("b" "Brf journal" entry
         (file+datetree org-brf-journal-file)
         "* %T %?" :jump-to-captured 1)

        ("m" "Machine Matadors journal" entry
         (file+datetree org-mm-journal-file)
         "* %T %?" :jump-to-captured 1)

        ("s" "Snoken journal" entry
         (file+datetree org-snoken-journal-file)
         "* %T %?" :jump-to-captured 1)

        ("a" "Atilia journal" entry
         (file+datetree org-atilia-journal-file)
         "* %T %?" :jump-to-captured 1)

        ("i" "AI journal" entry
         (file+datetree "~/worklocal/202609_personal_tracker/ai-journal.org")
         "* %T %?" :jump-to-captured 1)

        )
      )

;;--------------------------------------------------------------------------------
;; reveal
;;--------------------------------------------------------------------------------
(setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")



;;--------------------------------------------------------------------------------
;; code completion for programming
;; I've removed company from init.el because it was slow for org-mode etc
;; But here I activate completion for coding
;;--------------------------------------------------------------------------------
;;(add-hook 'prog-mode-hook 'company-mode)
(add-hook 'org-mode-hook (lambda () (company-mode -1)))
;;--------------------------------------------------------------------------------





;;--------------------------------------------------------------------------------
;; Hydra
;;--------------------------------------------------------------------------------





(use-package hydra
  :defer 2
  :bind ("M-o" . my-hydra/body))

(defun backlogPath (filename)
  (find-file (concat "~/Dropbox/emacs-org/deft/" filename))
  )



(pretty-hydra-define my-hydra
  (:color green :quit-key "q" :exit t :title "My org")

  ("AI"
   (
    ("at" (find-file org-nli-journal-file) "ai-todo")
    ("aj" (find-file org-nli-journal-file) "ai-journal")
    )
   "Backlogs"
   (
    ("c" (backlogPath "backlog-inbox.org") "backlog-inbox.org")
    ("n" (backlogPath "backlog-nli.org") "backlog-nli.org")
    ("aa" (backlogPath "backlog-atilia.org") "backlog-atilia.org")
    ("b" (backlogPath "backlog-brf.org") "backlog-brf.org")
    ("m" (backlogPath "backlog-mm.org") "backlog-mm.org")
    ("s" (backlogPath "backlog-snoken.org") "backlog-snoken.org")
    )
   "Journals"
   (
    ("N" (find-file org-nli-journal-file) "org-nli-journal-file")
    ("A" (find-file org-atilia-journal-file) "org-atilia-journal-file")
    ("M" (find-file org-mm-journal-file) "org-mm-journal-file")
    ("B" (find-file org-brf-journal-file) "org-brf-journal-file")
    ("S" (find-file org-snoken-journal-file) "org-snoken-journal-file")
    )
   "Agenda"
   (
    ("z" (org-agenda nil "z") "NEXT")
    )
   "Other"
   (
    ("r" (backlogPath "readinglist.org") "readinglist.org")
    ("C" org-capture "Capture")
    ("q" nil "Quit")
    )
   ))

(global-set-key (kbd "M-o") 'my-hydra/body)

;;--------------------------------------------------------------------------------
;; python
;; --------------------------------------------------------------------------------
(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")


;;--------------------------------------------------------------------------------
;; plantuml
;; --------------------------------------------------------------------------------
(org-babel-do-load-languages
 'org-babel-load-languages
 '((plantuml . t)))
    ;; Sample jar configuration
    ;; (setq plantuml-jar-path "/path/to/your/copy/of/plantuml.jar")
    ;; (setq plantuml-default-exec-mode 'jar)

    ;; Sample executable configuration
    (setq plantuml-executable-path "~/bin/plantuml.sh")
    (setq plantuml-default-exec-mode 'executable)



;;--------------------------------------------------------------------------------
;; ob-http, org-babel http
;;--------------------------------------------------------------------------------

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (http . t)))


(delete-selection-mode 1)

;;--------------------------------------------------------------------------------
;; notmutch
;;--------------------------------------------------------------------------------

;; (unless (package-installed-p 'notmuch)
;;   (package-refresh-contents)
;;   (package-install 'notmuch))

(require 'notmuch)

(unless (getenv "NOTMUCH_CONFIG")
  (setenv "NOTMUCH_CONFIG"
          "/Users/nli/worklocal/mail_notmuch_sync/notmuch-config"))

;; Optional: define keybindings or behaviors here.
(setq notmuch-search-oldest-first nil) ;; Show newest emails first


(setq send-mail-function 'sendmail-send-it
      sendmail-program "/opt/homebrew/bin/msmtp") ;; adjust path if needed
(setq message-sendmail-f-is-evil t)
(setq message-sendmail-extra-arguments '("--read-envelope-from"))
(setq message-send-mail-function 'message-send-mail-with-sendmail)
