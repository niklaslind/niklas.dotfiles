;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
;; Niklas' org-mode configuration.
;; Switch by commenting/uncommenting ONE of the lines below:
;;   nli-org-mode = stable, known-working config (fall-back)
;;   ai-org-mode  = experimental next-generation AI-aware config
;;--------------------------------------------------------------------------------
(let ((personal-dir (file-name-directory (or load-file-name
                                             buffer-file-name))))
  (add-to-list 'load-path personal-dir t)
  (add-to-list 'load-path (expand-file-name "org-configs" personal-dir) t))
;;(require 'nli-org-mode)
(require 'ai-org-mode)
;;--------------------------------------------------------------------------------


;;--------------------------------------------------------------------------------
;; python
;; --------------------------------------------------------------------------------
(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")


;;--------------------------------------------------------------------------------
;; notmuch
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
