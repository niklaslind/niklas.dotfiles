;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ace-window adoc-mode ag anzu browse-kill-ring company consult crux
                csv-mode diff-hl diminish discover-my-major
                dockerfile-mode easy-kill elisp-slime-nav epl evil
                exec-path-from-shell expand-region flycheck gist
                git-modes git-timemachine guru-mode hl-todo
                imenu-anywhere js2-mode json-mode lsp-ui magit
                move-text nlinum operate-on-number orderless
                projectile rainbow-delimiters rainbow-mode smartparens
                smartrep super-save undo-tree vertico
                volatile-highlights web-mode xah-fly-keys yaml-mode
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

;; indent org-mode
(add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode t))
          t)

(setq org-agenda-files (list
                        "~/Dropbox/emacs-org/deft/backlog-brf.org"
                        "~/Dropbox/emacs-org/deft/backlog-inbox.org"
                        "~/Dropbox/emacs-org/deft/backlog-mm.org"
                        "~/Dropbox/emacs-org/deft/backlog-nli.org"
                        "~/Dropbox/emacs-org/journals/journal-atilia.org/journal-atilia.org"
                        "~/Dropbox/emacs-org/journals/journal-atilia.org/journal-brf.org"
                        "~/Dropbox/emacs-org/journals/journal-atilia.org/journal-mm.org"
                        "~/Dropbox/emacs-org/journals/journal-atilia.org/journal-nli.org"
                        "~/Dropbox/emacs-org/journals/journal-atilia.org/journal-snoken.org"
                        ))
