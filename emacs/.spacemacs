;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     octave
     (auto-completion :variables
                      auto-completion-enable-help-tooltop t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-private-snippets-directory "~/.emacs.d/private/snippets"
                     :disabled-for markdown org)
     better-defaults
     colors
     csv
     dash
     emacs-lisp
     evernote
     extra-langs
     gigi
     graphviz
     ;; git
     ;; github
     haskell
     html
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     ipython-notebook
     ivy
     javascript
     (latex :variables
            latex-enable-folding t
            latex-enable-auto-fill t)
     (markdown :variables
               markdown-live-preview-engine 'vmd)
     (nlinum :variables
              nlinum-relative-mode nil)
     (org :variables
          org-enable-bootstrap-support t
          org-enable-github-support t
          org-enable-reveal-js-support t)
     pandoc
     pdf-tools
     python
     (ranger :variables
             ranger-show-preview t)
     restclient
     react
     ruby
     ruby-on-rails
     sql
     theming
     tmux
     twitter
     typography
     yaml
     )
   dotspacemacs-additional-packages '()
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '(evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu vi-tilde-fringe)
   dotspacemacs-delete-orphan-packages t
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'emacs
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'org-mode
   dotspacemacs-themes '(spacemacs-dark-paradise
                         spacemacs-babywave)
   dotspacemacs-colorize-cursor-according-to-state nil
   dotspacemacs-default-font '("Fira Code"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 0.8)
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift nil
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 80
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   dotspacemacs-centered-buff
   ))

(defun dotspacemacs/user-init ()
  (defconst user-layer-dir (file-name-as-directory "~/.emacs.d/private"))
  (defconst user-secrets-dir (file-name-as-directory (concat user-layer-dir "secrets")))
  (defconst user-project-dir (getenv "PROJECTS_DIR"))

  (defconst user-org-dir   (file-name-as-directory "~/Dropbox/org"))
  (defconst user-notes-dir (file-name-as-directory (concat user-org-dir "notas")))
  (defconst user-journal-dir (file-name-as-directory (concat user-org-dir "diario")))
  (defconst user-books-dir (file-name-as-directory (concat user-org-dir "/media/Books")))

  (defconst user-bookmarks-file (concat user-notes-dir "marcadores.org"))
  (defconst user-gcal-file (concat user-org-dir "calendario.org"))

  (setq exec-path-from-shell-arguments '("-c"))

  (setq custom-file "~/.emacs.d/custom.el")
  (load custom-file)
  )
(
defun dotspacemacs/user-config ()
  (setq backup-directory-alist `(("" . "~/.emacs.d/auto-save"))
        backup-by-copying t
        delete-old-versions t
        kept-old-versions 2
        kept-new-versions 4)
  (setq-default  web-mode-markup-indent-offset 2
                web-mode-css-indent-offset 2
                web-mode-code-indent-offset 2
                css-indent-offset 2
                js2-basic-offset 2
                js-indent-level 2
                js2-strict-missing-semi-warning nil
                js2-missing-semi-one-line-override nil
                typescript-indent-level 2
                neo-window-fixed-size nil
                line-spacing 2)
                ;; fringe-mode 25)
  )
