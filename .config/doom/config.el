;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; --------------------------------------------------------------------------------
;; Niklas Settings below
;; --------------------------------------------------------------------------------


(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)



;; Use M-c for copy since M-w makes me close other applications :(
(global-set-key "\M-c" 'clipboard-kill-ring-save)
(global-set-key "\M-y" 'helm-show-kill-ring)


;; Save history
(savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))



;;--------------------------------------------------------------------------------
;; expand-region
;;--------------------------------------------------------------------------------
(global-set-key [?\C-+] 'er/expand-region)
;;--------------------------------------------------------------------------------


;;--------------------------------------------------------------------------------
;; js javascript
;;
(setq js-indent-level 2)



;;--------------------------------------------------------------------------------
;; Org-mode
;;--------------------------------------------------------------------------------


(setq org-directory "~/Dropbox/emacs-org")
(setq org-agenda-files '("~/Dropbox/emacs-org/deft"))
(setq org-agenda-text-search-extra-files (directory-files-recursively  "~/Dropbox/emacs-org/journals" "\\.org$"))
(setq org-startup-with-inline-images t)
(setq org-image-actual-width '(300))
(setq org-cycle-separator-lines 1) ;;Do not show empty lines between folded org-headers
(setq org-agenda-persistent-filter t) ;;if you limit a search with / TAB SomeTag the agenda remembers this filter until you change it.



;;--------------------------------------------------------------------------------
;; Org-journal files
;;--------------------------------------------------------------------------------

(let ((default-directory "~/Dropbox/emacs-org/journals"))
  (setq org-nli-journal-file (expand-file-name "journal-nli.org"))
  (setq org-atilia-journal-file (expand-file-name "journal-atilia.org"))
  (setq org-uc-journal-file (expand-file-name "journal-uc.org"))
  (setq org-brf-journal-file (expand-file-name "journal-brf.org"))
  (setq org-mm-journal-file (expand-file-name "journal-mm.org"))
  (setq org-elastx-journal-file (expand-file-name "journal-elastx.org"))
  (setq org-k2c-journal-file (expand-file-name "journal-k2c.org"))
  )
(setq org-inbox-file  "~/Dropbox/emacs-org/deft/backlog-inbox.org")
(setq org-roam-backlogs  "/Users/nli/Dropbox/emacs-org/roam/20231009085518-backlogs.org")




(set-register ?n (cons 'file org-nli-journal-file))
(set-register ?a (cons 'file org-atilia-journal-file))
(set-register ?u (cons 'file org-uc-journal-file))
(set-register ?b (cons 'file org-brf-journal-file))
(set-register ?m (cons 'file org-mm-journal-file))
(set-register ?e (cons 'file org-elastx-journal-file))
(set-register ?k (cons 'file org-k2c-journal-file))
(set-register ?d (cons 'file org-roam-backlogs))


(setq org-refile-targets '((org-agenda-files :maxlevel . 2)))
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)
(setq org-log-done nil)



;;--------------------------------------------------------------------------------
;; Org-habit
;;--------------------------------------------------------------------------------


(require 'org-habit)
(setq org-modules '(org-habit))
(use-package! org-habit
  :after org
  :config
  (setq org-habit-following-days 7
        org-habit-preceding-days 35
        org-habit-show-habits t)  )


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

        ("u" "UC journal" entry
         (file+datetree org-uc-journal-file)
         "* %T %?" :jump-to-captured 1)

        ("a" "Atilia journal" entry
         (file+datetree org-atilia-journal-file)
         "* %T %?" :jump-to-captured 1)

        ("b" "Brf journal" entry
         (file+datetree org-brf-journal-file)
         "* %T %?" :jump-to-captured 1)

        ("m" "Machine Matadors journal" entry
         (file+datetree org-mm-journal-file)
         "* %T %?" :jump-to-captured 1)

        ("e" "Elastx journal" entry
         (file+datetree org-elastx-journal-file)
         "* %T %?" :jump-to-captured 1)

        ("k" "K2C journal" entry
         (file+datetree org-k2c-journal-file)
         "* %T %?" :jump-to-captured 1)

        )
      )

;;--------------------------------------------------------------------------------
;; deft
;; https://jblevins.org/projects/deft/
;; --------------------------------------------------------------------------------

(setq deft-extensions '( "org" "txt" "md")) ;;org is default for new files

(setq deft-default-extension '"org") ;;org is default for new files

(setq deft-recursive t)

(setq deft-use-filename-as-title nil)

(setq deft-use-filter-string-for-filename t)

(setq deft-file-naming-rules
      '((noslash . "_")
        (nospace . "_")
        (case-fn . downcase)))

(setq deft-org-mode-title-prefix t) ;;prefix w #+TITLE:

(setq deft-directory "/Users/nli/Dropbox/emacs-org/deft")

(setq deft-auto-save-interval 0)

;;--------------------------------------------------------------------------------
;; key-chord for org-file registers and org-capture
;;--------------------------------------------------------------------------------

;;(require 'key-chord)
(key-chord-define-global "JJ" 'jump-to-register) ;;list org files
(key-chord-define-global "CC" 'org-capture)
;;(key-chord-define-global "DD" 'deft)¨
(key-chord-define-global "DD" (lambda() (interactive)(find-file org-roam-backlogs)))
(key-chord-define-global "TT" (lambda() (interactive)(find-file org-today-file)))
(key-chord-define-global "ZZ" (lambda() (interactive)(org-agenda nil "z")))

(key-chord-mode +1)

;;--------------------------------------------------------------------------------
;; org-present
;;--------------------------------------------------------------------------------


(setq visual-fill-column-width 110
      visual-fill-column-center-text t)



(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                 (org-present-big)
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (visual-fill-column-mode 1)
                 (visual-line-mode 1)
                 (org-present-read-only)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (org-present-small)
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (visual-fill-column-mode 0)
                 (visual-line-mode 0)
                 (org-present-read-write)))))



;;--------------------------------------------------------------------------------
;; reveal
;;--------------------------------------------------------------------------------
(setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")



;;--------------------------------------------------------------------------------
;; org-roam
;;--------------------------------------------------------------------------------


;; Org-roam-ui tries to keep up with the latest features of org-roam, which conflicts with Doom Emacs's desire for stability. To make sure nothing breaks, use the latest version of org-roam by unpinning it.
;;(unpin! org-roam)
;;(require 'org-roam-ui)

(setq org-roam-directory "~/Dropbox/emacs-org/roam"
      org-roam-db-location (expand-file-name "org-roam.db" org-roam-directory))

(setq org-roam-capture-ref-templates
      '(("r" "ref" plain "%?"
         :target (file+head "web/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+created: %U\n\n${body}\n")
         :unnarrowed t)))

(setq org-roam-capture-templates
      '(("d" "default" plain "%?" :target
         (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
         :unnarrowed t)
        ("m" "movie" plain "*** ${title}\n :PROPERTIES:\n :ID: %(org-id-uuid)\n :RATING:\n :END:\n%t\n"
         :target (file+olp "movies.org" ("Watched")
                           ))))

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
  (find-file (concat "~/Dropbox/emacs-org/deft/" filename)))

(pretty-hydra-define my-hydra
  (:color green :quit-key "q" :title "My org")

  ("Backlogs"
   (
    ("c" (backlogPath "backlog-inbox.org") "backlog-inbox.org")
    ("n" (backlogPath "backlog-nli.org") "backlog-nli.org")
    ("k" (backlogPath "backlog-rune.org") "backlog-rune.org")
    ("u" (backlogPath "backlog-uc.org") "backlog-uc.org")
    ("a" (backlogPath "backlog-atilia.org") "backlog-atilia.org")
    ("b" (backlogPath "backlog-brf.org") "backlog-brf.org")
    ("e" (backlogPath "backlog-elastx.org") "backlog-elastx.org")
    ("m" (backlogPath "backlog-mm.org") "backlog-mm.org")
    ("h" (backlogPath "backlog-habit.org") "backlog-habit.org")
    ("s" (backlogPath "backlog-snoken.org") "backlog-snoken.org")
    ("v" (backlogPath "backlog-vega.org") "backlog-vega.org")

    )
   "Journals"
   (
    ("N" (find-file org-nli-journal-file) "org-nli-journal-file")
    ("U" (find-file org-uc-journal-file) "org-uc-journal-file")
    ("K" (find-file org-k2c-journal-file) "org-k2c-journal-file")
    ("E" (find-file org-elastx-journal-file) "org-elastx-journal-file")
    ("A" (find-file org-atilia-journal-file) "org-atilia-journal-file")
    ("M" (find-file org-mm-journal-file) "org-mm-journal-file")
    ("B" (find-file org-brf-journal-file) "org-brf-journal-file")
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

