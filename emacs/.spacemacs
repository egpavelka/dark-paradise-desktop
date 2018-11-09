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
     php
     (auto-completion :variables
                      auto-completion-enable-help-tooltop t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                     :disabled-for markdown org)
     better-defaults
     colors
     csv
     django
     emacs-lisp
     evernote
     extra-langs
     finance
     gigi
     git
     go
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
     ;; nixos
     (nlinum :variables
             nlinum-relative-mode nil)
     octave
     (org :variables
          org-enable-bootstrap-support t
          ;; org-enable-github-support t
          ;; org-enable-reveal-js-support t
          org-projectile-file "TODO.org")
     pandoc
     pdf-tools
     (pythons :variables
              python-test-runner 'pytest
              python-enable-yapf-format-on-save t
              python-sort-imports-on-save t)
     react
     (ruby :variables
           ruby-enable-enh-ruby-mode t
           ruby-version-manager 'rvm
           ruby-test-runner 'rspec)
     ruby-on-rails
     sql
     ;; theming
     twitter
     ;; typography ;; use typo-mode to cycle among typographic characters for quotation marks, brackets, dashes, ellipses
     yaml
     )
   dotspacemacs-additional-packages '()
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '(evil-anzu evil-args evil-ediff evil-escape evil-exchange evil-iedit-state evil-indent-plus evil-lisp-state evil-mv evil-nerd-commenter evil-matchit evil-numbers evil-search-highlight-persist evil-surround evil-tutor evil-unimpaired evil-visual-dark-mode vi-tilde-fringe)
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
   dotspacemacs-themes '(spacemacs-dark-paradise)
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

  (defconst user-org-dir   (file-name-as-directory "~/Media/documentos/org"))
  (defconst user-notes-dir (file-name-as-directory (concat user-org-dir "notas")))
  (defconst user-journal-dir (file-name-as-directory (concat user-org-dir "diario")))
  (defconst user-books-dir (file-name-as-directory (concat user-org-dir "~/Media/libros")))

  (defconst user-bookmarks-file (concat user-notes-dir "marcadores.org"))
  (defconst user-gcal-file (concat user-org-dir "calendario.org"))

  (setq exec-path-from-shell-arguments '("-c"))

  (setq custom-file "~/.emacs.d/custom.el")
  (load custom-file)
  )
(defun dotspacemacs/user-config ()
  (setq ;; make-backup-files nil
   ;; auto-save-default nil
        backup-by-copying t
        backup-directory-alist `((".*" . ,temporary-file-directory))
        auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
        delete-old-versions t
        kept-old-versions 2
        kept-new-versions 4
        version-control t
        magit-repository-directories '("~/Code/Current/")
        global-git-commit-mode t
        )
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
                line-spacing 2
                fringe-mode 15
                max-mini-window-height 1)
  (with-eval-after-load 'web-mode
    (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))
  )
