(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ignored-local-variable-values
   '((org-roam-db-location . "/Users/nli/Dropbox/GTD/roam/nli/org-roam.db")
     (org-roam-directory . "/Users/nli/Dropbox/GTD/roam/nli")))
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(org-agenda-files
   '("/Users/nli/Dropbox/emacs-org/deft/backlog-uc.org"
     "/Users/nli/Dropbox/emacs-org/deft/backlog-aivision.org"
     "/Users/nli/Dropbox/emacs-org/deft/backlog-atilia.org"
     "/Users/nli/Dropbox/emacs-org/deft/backlog-brf.org"
     "/Users/nli/Dropbox/emacs-org/deft/backlog-elastx.org"
     "/Users/nli/Dropbox/emacs-org/deft/backlog-habit.org"
     "/Users/nli/Dropbox/emacs-org/deft/backlog-inbox.org"
     "/Users/nli/Dropbox/emacs-org/deft/backlog-mm.org"
     "/Users/nli/Dropbox/emacs-org/deft/backlog-nli.org"
     "/Users/nli/Dropbox/emacs-org/deft/backlog-rune.org"
     "/Users/nli/Dropbox/emacs-org/deft/backlog-snoken.org"
     "/Users/nli/Dropbox/emacs-org/deft/backlog-vega.org"
     "/Users/nli/Dropbox/emacs-org/deft/jul2022.org"
     "/Users/nli/Dropbox/emacs-org/deft/microstories.org"
     "/Users/nli/Dropbox/emacs-org/deft/målarkurs2022.org"
     "/Users/nli/Dropbox/emacs-org/deft/omfatta.org"
     "/Users/nli/Dropbox/emacs-org/deft/org-aivision-journal-file.org"
     "/Users/nli/Dropbox/emacs-org/deft/readinglist.org"
     "/Users/nli/Dropbox/emacs-org/deft/rivertable.org"
     "/Users/nli/Dropbox/emacs-org/deft/roda.org"
     "/Users/nli/Dropbox/emacs-org/deft/stambyte.org"
     "/Users/nli/Dropbox/emacs-org/deft/young_schema_omfatta.org"))
 '(org-ql-views
   '(("salesforce" :buffers-files
      ("/Users/nli/Dropbox/emacs-org/deft/backlog-uc.org"
       "/Users/nli/Dropbox/emacs-org/deft/backlog-aivision.org"
       "/Users/nli/Dropbox/emacs-org/deft/backlog-atilia.org"
       "/Users/nli/Dropbox/emacs-org/deft/backlog-brf.org"
       "/Users/nli/Dropbox/emacs-org/deft/backlog-elastx.org"
       "/Users/nli/Dropbox/emacs-org/deft/backlog-habit.org"
       "/Users/nli/Dropbox/emacs-org/deft/backlog-inbox.org"
       "/Users/nli/Dropbox/emacs-org/deft/backlog-mm.org"
       "/Users/nli/Dropbox/emacs-org/deft/backlog-nli.org"
       "/Users/nli/Dropbox/emacs-org/deft/backlog-rune.org"
       "/Users/nli/Dropbox/emacs-org/deft/backlog-snoken.org"
       "/Users/nli/Dropbox/emacs-org/deft/backlog-vega.org"
       "/Users/nli/Dropbox/emacs-org/deft/jul2022.org"
       "/Users/nli/Dropbox/emacs-org/deft/microstories.org"
       "/Users/nli/Dropbox/emacs-org/deft/målarkurs2022.org"
       "/Users/nli/Dropbox/emacs-org/deft/omfatta.org"
       "/Users/nli/Dropbox/emacs-org/deft/org-aivision-journal-file.org"
       "/Users/nli/Dropbox/emacs-org/deft/readinglist.org"
       "/Users/nli/Dropbox/emacs-org/deft/rivertable.org"
       "/Users/nli/Dropbox/emacs-org/deft/roda.org"
       "/Users/nli/Dropbox/emacs-org/deft/stambyte.org"
       "/Users/nli/Dropbox/emacs-org/deft/young_schema_omfatta.org")
      :query (tags "salesforce") :sort nil :narrow nil :super-groups
      ((:auto-parent)) :title "salesforce")
     ("Overview: Agenda-like" :buffers-files org-agenda-files :query
      (and (not (done))
           (or (habit) (deadline auto) (scheduled :to today)
               (ts-active :on today)))
      :sort (todo priority date) :super-groups org-super-agenda-groups :title
      "Agenda-like")
     ("Overview: NEXT tasks" :buffers-files org-agenda-files :query
      (todo "NEXT") :sort (date priority) :super-groups org-super-agenda-groups
      :title "Overview: NEXT tasks")
     ("Calendar: Today" :buffers-files org-agenda-files :query
      (ts-active :on today) :title "Today" :super-groups org-super-agenda-groups
      :sort (priority))
     ("Calendar: This week"
      . #[0
          "\301 \302\303\304\305\304\306\304\307\310\301 \311\1!\10>\204\34\0\312\313\314\3D\"\210\211\315H\204\232\0\211\315\316\317\320\311\6\6!\10>\2048\0\312\313\314\6\10D\"\210\5\321H\204\223\0\5\321\311\6\10!\10>\210\6\7\322H\6\10\323H\6\11\324H\6\12\325H\6\13\326H\6\14\327H\5\203\215\0\4\203\215\0\3\203\215\0\2\203\215\0\1\203\215\0\211\203\215\0\330\331\6\7\6\7\6\7\6\7\6\7\6\7&\6!\266\206\202\221\0\330 \266\206I\210\5\321H\"!I\210\211\315H\262\1[\6\12#&\7\302\303\332\305\333\306\333\307\310\327\301 \311\1!\10>\204\300\0\312\313\314\3D\"\210\211\315H\204>\1\211\315\316\317\320\311\6\6!\10>\204\334\0\312\313\314\6\10D\"\210\5\321H\2047\1\5\321\311\6\10!\10>\210\6\7\322H\6\10\323H\6\11\324H\6\12\325H\6\13\326H\6\14\327H\5\2031\1\4\2031\1\3\2031\1\2\2031\1\1\2031\1\211\2031\1\330\331\6\7\6\7\6\7\6\7\6\7\6\7&\6!\266\206\2025\1\330 \266\206I\210\5\321H\"!I\210\211\315H\262\1Z\6\13#&\7\334\335 \336\337\5\340\6\6\257\5\341\342\343\344\345\346&\10\207"
          [cl-struct-ts-tags ts-now ts-apply :hour 0 :minute :second ts-adjust
                             day type-of signal wrong-type-argument ts 7
                             string-to-number format-time-string "%w" 17 3 2 1 4
                             5 6 float-time encode-time 23 59 org-ql-search
                             org-agenda-files ts-active :from :to :title
                             "This week" :super-groups org-super-agenda-groups
                             :sort (priority)]
          34 "Show items with an active timestamp during this calendar week."
          nil])
     ("Calendar: Next week"
      . #[0
          "\301\302\303\304 #\305\306\307\310\307\311\307\301\302\304 \312\1!\10>\204 \0\313\314\315\3D\"\210\211\303H\204\236\0\211\303\316\317\320\312\6\6!\10>\204<\0\313\314\315\6\10D\"\210\5\321H\204\227\0\5\321\312\6\10!\10>\210\6\7\322H\6\10\323H\6\11\324H\6\12\325H\6\13\326H\6\14\327H\5\203\221\0\4\203\221\0\3\203\221\0\2\203\221\0\1\203\221\0\211\203\221\0\330\331\6\7\6\7\6\7\6\7\6\7\6\7&\6!\266\206\202\225\0\330 \266\206I\210\5\321H\"!I\210\211\303H\262\1[\6\12#&\7\305\306\332\310\333\311\333\301\302\327\304 \312\1!\10>\204\304\0\313\314\315\3D\"\210\211\303H\204B\1\211\303\316\317\320\312\6\6!\10>\204\340\0\313\314\315\6\10D\"\210\5\321H\204;\1\5\321\312\6\10!\10>\210\6\7\322H\6\10\323H\6\11\324H\6\12\325H\6\13\326H\6\14\327H\5\2035\1\4\2035\1\3\2035\1\2\2035\1\1\2035\1\211\2035\1\330\331\6\7\6\7\6\7\6\7\6\7\6\7&\6!\266\206\2029\1\330 \266\206I\210\5\321H\"!I\210\211\303H\262\1Z\6\13#&\7\334\335 \336\337\5\340\6\6\257\5\341\342\343\344\345\346&\10\207"
          [cl-struct-ts-tags ts-adjust day 7 ts-now ts-apply :hour 0 :minute
                             :second type-of signal wrong-type-argument ts
                             string-to-number format-time-string "%w" 17 3 2 1 4
                             5 6 float-time encode-time 23 59 org-ql-search
                             org-agenda-files ts-active :from :to :title
                             "Next week" :super-groups org-super-agenda-groups
                             :sort (priority)]
          34
          "Show items with an active timestamp during the next calendar week."
          nil])
     ("Review: Recently timestamped" . org-ql-view-recent-items)
     (#("Review: Dangling tasks" 0 22 (help-echo "Tasks whose ancestor is done"))
      :buffers-files org-agenda-files :query (and (todo) (ancestors (done)))
      :title
      #("Review: Dangling tasks" 0 22 (help-echo "Tasks whose ancestor is done"))
      :sort (todo priority date) :super-groups ((:auto-parent t)))
     (#("Review: Stale tasks" 0 19
        (help-echo "Tasks without a timestamp in the past 2 weeks"))
      :buffers-files org-agenda-files :query (and (todo) (not (ts :from -14)))
      :title
      #("Review: Stale tasks" 0 19
        (help-echo "Tasks without a timestamp in the past 2 weeks"))
      :sort (todo priority date) :super-groups ((:auto-parent t)))
     (#("Review: Stuck projects" 0 22
        (help-echo "Tasks with sub-tasks but no NEXT sub-tasks"))
      :buffers-files org-agenda-files :query
      (and (todo) (descendants (todo)) (not (descendants (todo "NEXT")))) :title
      #("Review: Stuck projects" 0 22
        (help-echo "Tasks with sub-tasks but no NEXT sub-tasks"))
      :sort (date priority) :super-groups org-super-agenda-groups)))
 '(org-safe-remote-resources
   '("\\`https://fniessen\\.github\\.io/org-html-themes/org/theme-ReadTheOrg\\.setup\\'"
     "\\`https://fniessen\\.github\\.io/org-html-themes/org/theme-bigblow\\.setup\\'"))
 '(package-selected-packages
   '(aidermacs beacon dir-treeview dir-treeview-themes dired-narrow
     ef-themes gptel helm-rg json-reformat json-snatcher just-mode
     marginalia ob-http ox-json ox-pandoc pandoc-mode pyenv-mode racket-mode
     swiper-helm wgrep)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'projectile-ripgrep 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
