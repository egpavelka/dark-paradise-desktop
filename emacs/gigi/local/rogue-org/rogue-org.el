;;; rogue-org --- Org mode settings for rogue layer

;; Copyright (c) 2017 Abhinav Tushar
;; Author: Abhinav Tushar <lepisma@fastmail.com>
;; URL: https://github.com/lepisma/rogue/tree/master/local/rogue-org


;;; Code:

(require 'org)

 (defun rogue-org-setup-tex ()
  (setq org-latex-pdf-process `("latexmk -pdflatex=xelatex -f -pdf %f"))
  (setq TeX-engine 'xetex))

(defun rogue-org-setup-babel ()
  "Setup org-babel."
  (setq org-confirm-babel-evaluate nil
        org-src-fontify-natively t
        org-src-tab-acts-natively t)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '(;;(C          . t)
     (calc       . t)
     (emacs-lisp . t)
     (gnuplot    . t)
     (haskell    . t)
     (js         . t)
     (latex      . t)
     (lisp       . t)
     ;;(makefile   . t)
     (matlab     . t)
     (python     . t)
     ;;(R          . t) ;; R throws errors
     (restclient . t)
     (ruby       . t)
     ;;(sagemath   . t)
     (sass       . t)
     ;;(sh         . t)
     (shell      . t)
     (sql        . t))))

;;;###autoload
(defun rogue-org-shuffle-save ()
  "Shuffle and save current file"
  (interactive)
  (goto-char (point-min))
  (org-sort-entries nil ?f (lambda () (random 1000)))
  (save-buffer))

(defun rogue-org-reset-buffers ()
  "Reset org-mode in all org buffers"
  (dolist (buff (buffer-list))
    (with-current-buffer buff
      (if (string-equal "org-mode" major-mode)
          (org-mode)))))

(defun rogue-org-setup-notes ()
  "Setup agenda/captures and other notes related things"

  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  (with-eval-after-load 'org
    ;; Capture templates
    (setq org-capture-templates
          '(("t" "TAREA" entry (file+headline "~/Dropbox/org/tareas.org" "0.0 everything that rises must converge")
             "** TODO %?\n  %i\n  %a")
            ("e" "EVENTO DE CALENDARIO" entry (file user-gcal-file)
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

    (setq org-archive-location "~/Dropbox/org/.archivo_de_tareas.org"
          org-agenda-window-setup 'current-window
          org-agenda-files '("~/Dropbox/org"
                             "~/Dropbox/org/cursos"
                             "~/Dropbox/org/español"))
          ;; "~/Dropbox/org/desarrollo"
          ;; "~/Dropbox/org/escritura"
          ;; "~/Dropbox/org/investigaciones"

    (setq org-agenda-custom-commands
          '(("n" "Agenda"
             ((agenda "")))
            ("t" "Tareas"
             ((todo "Tareas"
                    ((org-agenda-overriding-header "Tareas")
                     (org-agenda-sorting-strategy '(priority-down))))))
            ("p" "Fechas límites próximas" agenda ""
             ((org-agenda-entry-types '(:deadline))
              (org-deadline-warning-days 30)
              (org-agenda-time-grid nil)
              (org-agenda-overriding-header "Fechas límites próximas"))))))) 

(defun rogue-org-setup-general ()
  "Misc settings."

  (with-eval-after-load 'org
    (setq org-startup-indented t
          org-clock-idle-time 5
          ;; org-bullets-bullet-list '("╪" "⋇" "✚" "⊸" "∘")
          ;; org-bullets-bullet-list '("𐄺" "⋇" "⁙" "∷" "∴" "⠒" "∙")
          org-bullets-bullet-list '("╪" "⍎" "≗" "═" "⍛" "—" "∘")
          ;; org-bullets-bullet-list '("")
          org-ellipsis "..."
          org-pretty-entities t
          org-hide-emphasis-markers t
          org-agenda-block-separator ""
          org-fontify-whole-heading-line t
          org-fontify-done-headline t
          org-fontify-quote-and-verse-blocks t
          spaceline-org-clock-p t)

    (customize-set-variable 'org-modules
                            '(org-bibtex
                              org-docview
                              org-habit
                              org-info
                              org-w3m))))

(provide 'rogue-org)

;;; rogue-org.el ends here
