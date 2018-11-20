;;; gigi-org --- org-mode settings

;; BASED ON:
;; Copyright (c) 2017 Abhinav Tushar
;; Author: Abhinav Tushar <lepisma@fastmail.com>
;; URL: https://github.com/lepisma/rogue/tree/master/local/rogue-org


;;; Code:

(require 'org)

(defun gigi-org-setup-tex ()
  ;; (setq org-latex-pdf-process `("latexmk -pdflatex=xelatex -f -pdf %f"))
  ;; (setq TeX-engine 'xetex)
  org-latex-create-formula-image-program 'imagemagick)

(defun gigi-org-setup-babel ()
  "Setup org-babel."
  (setq org-confirm-babel-evaluate nil
        org-src-fontify-natively t
        org-src-tab-acts-natively t)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '(;;(C          . t)
     (calc       . t)
     (emacs-lisp . t)
     ;;(gnuplot    . t)
     (haskell    . t)
     (js         . t)
     (latex      . t)
     ;;(lisp       . t)
     ;;(makefile   . t)
     (matlab     . t)
     (python     . t)
     ;; (R          . t) ;; R throws errors
     ;;(restclient . t)
     (ruby       . t)
     ;;(sagemath   . t)
     (sass       . t)
     ;;(sh         . t)
     (shell      . t)
     (sql        . t))))

(defun gigi-org-setup-notes ()
  "Setup agenda/captures and other notes related things"

  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  (with-eval-after-load 'org
    ;; Capture templates
    (setq org-capture-templates
          '(("t" "TAREA" entry (file+headline "~/Media/documentos/documentos/org/tareas.org" "0.0 everything that rises must converge")
             "** TODO %?\n  %i\n  %a")
            ("e" "EVENTO" entry (file user-gcal-file)
             "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
            ("d" "DIARIO" entry (file+olp+datetree user-journal-dir)
             "* %?\nEntered on %U\n  %i\n  %a")
            ("b" "MARCADOR" entry (file "notas.org")
             "* %?\n%a")))

    (setq org-html-validation-link nil)

    (setq org-refile-allow-creating-parent-nodes t
          org-outline-path-complete-in-steps nil
          org-refile-targets '((nil :maxlevel . 1)
                               (org-agenda-files :maxlevel . 1)))

    (setq org-archive-location "~/Media/documentos/org/.archivo_de_tareas.org"
          org-agenda-window-setup 'current-window
          org-agenda-files '("~/Media/documentos/org"
                             "~/Media/documentos/org/cursos"
                             "~/Media/documentos/org/español")
          org-agenda-files (file-expand-wildcards "~/Code/*/TODO.org"))
          ;; "~/Media/documentos/org/desarrollo"
          ;; "~/Media/documentos/org/escritura"
    ;; "~/Media/documentos/org/investigaciones"

    (setq org-todo-keywords '((sequence "□" "◪" "▶" "|" "■" "☒")))
    ;; todo, partially done, postponed | completed, cancelled

    (setq org-agenda-custom-commands
          '(("n" "agenda"
             ((agenda "")))
            ("t" "tareas"
             ((todo "tareas"
                    ((org-agenda-overriding-header "tareas")
                     (org-agenda-sorting-strategy '(priority-down))))))
            ("p" "próximas fechas limite" agenda ""
             ((org-agenda-entry-types '(:deadline))
              (org-deadline-warning-days 30)
              (org-agenda-time-grid nil)
              (org-agenda-overriding-header "próximas fechas límite")))))))

(defun gigi-org-setup-keywords ()

  (defface keyword-icons-face
    '((t (:inherit none :background nil :foreground "#d07c67" :family "ETBembo" :height 1.5)))
    "face for bullet journal style icons"
    )

  (defvar org-mode-keywords
                          '(("⛥" . 'keyword-icons-face)
                            ("▲" . 'keyword-icons-face)
                            ("❗" . 'keyword-icons-face)
                            ("✓" . 'keyword-icons-face)
                            ("<" . 'keyword-icons-face)
                            ("▪" . 'keyword-icons-face)
                            ("❓" . 'keyword-icons-face)
                            ("⛅" . 'keyword-icons-face)
                            ("🗲" . 'keyword-icons-face)
                            ("♥" . 'keyword-icons-face)
                            ("＄" . 'keyword-icons-face)
                            ))
  (font-lock-add-keywords 'org-mode org-mode-keywords)
  )

(defun gigi-org-setup-general ()
  "Misc settings."

  (with-eval-after-load 'org
    (setq org-startup-indented t
          org-clock-idle-time 5
          org-bullets-bullet-list '("⋅")
          org-ellipsis "..."
          org-pretty-entities t
          org-hide-emphasis-markers t
          org-agenda-block-separator ""
          org-fontify-whole-heading-line t
          org-fontify-done-headline t
          org-fontify-quote-and-verse-blocks t
          spaceline-org-clock-p t
          abbrev-file-name "~/.emacs.d/private/gigi/abbrev_defs")

    (customize-set-variable 'org-modules
                            '(org-bookmark
                              org-checklist
                              org-choose
                              org-collector
                              org-docview
                              org-habit
                              org-info
                              org-inlinetask
                              org-toc))))

(provide 'gigi-org)

;;; gigi-org.el ends here
