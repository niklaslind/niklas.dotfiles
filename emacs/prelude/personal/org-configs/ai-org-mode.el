;;; ai-org-mode.el --- Niklas' next-generation AI-aware org-mode configuration -*- lexical-binding: t -*-
;;
;; EXPERIMENTAL / WORK-IN-PROGRESS.
;; A copy of nli-org-mode.el for iterating on the personal AI-agent setup.
;; Imported from custom.el via (require 'ai-org-mode).
;;
;; Swap the (require ...) line in custom.el to switch between:
;;   (require 'nli-org-mode)  ; stable, known-working config
;;   (require 'ai-org-mode)   ; experimental next-generation config
;; so the known-working config can always be restored.

;;; Commentary:

;; This file starts as an exact copy of nli-org-mode.el and is meant to diverge
;; while experimenting with the AI-agent org-mode setup (refiling TODOs to AI,
;; reading AI journal files, etc). Play around freely here; falling back to
;; nli-org-mode.el is just a one-line change in custom.el.

;;; Code:

;;--------------------------------------------------------------------------------
;; Org-mode
;;--------------------------------------------------------------------------------

(defconst org-org-mode-root "~/worklocal/202609_personal_tracker/org-mode"
  "Root directory for the AI-mode org files (ai/ and nli/ subdirectories).")

;; AI files
(defvar org-ai-todo-file
  (expand-file-name "ai/ai-todo.org" org-org-mode-root)
  "AI todo file.")
(defvar org-ai-journal-file
  (expand-file-name "ai/ai-journal.org" org-org-mode-root)
  "AI journal file.")
(defvar org-ai-instructions-file
  (expand-file-name "ai/ai-instructions.org" org-org-mode-root)
  "AI instructions file.")

;; nli files
(defvar org-nli-backlog-file
  (expand-file-name "nli/backlog-nli.org" org-org-mode-root)
  "nli backlog file.")
(defvar org-nli-journal-file
  (expand-file-name "nli/journal-nli.org" org-org-mode-root)
  "nli journal file.")
(defvar org-atilia-journal-file
  (expand-file-name "nli/journal-atilia.org" org-org-mode-root)
  "Atilia journal file.")
(defvar org-brf-journal-file
  (expand-file-name "nli/journal-brf.org" org-org-mode-root)
  "BRF journal file.")
(defvar org-mm-journal-file
  (expand-file-name "nli/journal-mm.org" org-org-mode-root)
  "Machine Matadors journal file.")
(defvar org-snoken-journal-file
  (expand-file-name "nli/journal-snoken.org" org-org-mode-root)
  "Snoken journal file.")
(defvar org-readinglist-file
  (expand-file-name "nli/readinglist.org" org-org-mode-root)
  "Reading list file.")

(setq org-agenda-files
      (list org-ai-todo-file
            org-ai-journal-file
            org-nli-backlog-file
            org-nli-journal-file
            org-atilia-journal-file
            org-brf-journal-file
            org-mm-journal-file
            org-snoken-journal-file
            org-readinglist-file))

(windmove-mode -1) ;;This overrides som org-mode keys like S-up

(add-hook 'org-mode-hook #'org-indent-mode)

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-<right>") #'org-shiftright)
  (define-key org-mode-map (kbd "C-<left>")  #'org-shiftleft))

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
      '(("Z" "Month" tags-todo "month")
        ("z" "Zen next" todo "NEXT")
        ("ab" "Viktiga uppgifter (A och B)"
         ((tags "+PRIORITY<=\"D\""
                ((org-agenda-overriding-header "Prioritet A & B (sorterat)")
                 (org-agenda-sorting-strategy '(priority-down)))))
         ((org-agenda-files (list org-nli-backlog-file))))))
(org-super-agenda-mode)






;;--------------------------------------------------------------------------------
;; Org-capture templates
;;--------------------------------------------------------------------------------

(setq org-capture-templates
      '(
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

        ("l" "nli backlog" entry
         (file+headline org-nli-backlog-file "backlog")
         "* TODO %?")

        ("t" "AI backlog" entry
         (file+headline org-ai-todo-file "INBOX")
         "* TODO %?")

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

(pretty-hydra-define my-hydra
  (:color green :quit-key "q" :exit t :title "My org")

  (
   "agenda & capture"
   (
    ("C" org-capture "Capture")
    ("z" (org-agenda nil "z") "NEXT")
    )
   "nli-backlogs"
   (
    ("n" (find-file org-nli-backlog-file) "backlog-nli")
    ("r" (find-file org-readinglist-file) "readinglist")
    )
   "nli-journals"
   (
    ("N" (find-file org-nli-journal-file) "journal-nli")
    ("A" (find-file org-atilia-journal-file) "journal-atilia")
    ("B" (find-file org-brf-journal-file) "journal-brf")
    ("M" (find-file org-mm-journal-file) "journal-mm")
    ("S" (find-file org-snoken-journal-file) "journal-snoken")
    )
   "AI"
   (
    ("t" (find-file org-ai-todo-file) "ai-todo")
    ("j" (find-file org-ai-journal-file) "ai-journal")
    ("i" (find-file org-ai-instructions-file) "ai-instructions")
    )
   ))

(global-set-key (kbd "M-o") 'my-hydra/body)

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

;;--------------------------------------------------------------------------------
;; AI journal / todo work-in-progress (experimental)
;;--------------------------------------------------------------------------------

;; TODO: iterate on the personal AI-agent org-mode setup (refile TODOs to AI,
;; read AI journal files) while keeping the old config switchable.

(provide 'ai-org-mode)
;;; ai-org-mode.el ends here
