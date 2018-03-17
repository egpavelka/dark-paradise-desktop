;;; rogue-org --- Org mode settings for rogue layer

;; Copyright (c) 2017 Abhinav Tushar

;; Author: Abhinav Tushar <lepisma@fastmail.com>
;; Version: 0.0.1
;; Package-Requires: ((emacs "25"))
;; Keywords: org, rogue
;; URL: https://github.com/lepisma/rogue/tree/master/local/rogue-org

;;; Commentary:

;; Personal config package for setting up org mode
;; This file is not a part of GNU Emacs.

;;; License:

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

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
          '(("t" "TODO" entry (file+headline "~/Dropbox/org/tasks.org" "0.0 everything that rises must converge")
             "* TODO %?\n  %i\n  %a")
            ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal")
             "* %?\nEntered on %U\n  %i\n  %a")
            ("b" "Bookmark" entry (file "notes.org")
             "* %?\n%a")))

    (setq org-agenda-files '("~/Dropbox/org"
                             "~/Dropbox/org/courses"
                             "~/Dropbox/org/journal"
                             "~/Dropbox/org/notes"
                             "~/Dropbox/org/planning"
                             "~/Dropbox/org/projects"
                             "~/Dropbox/org/research"))

    (setq org-html-validation-link nil)

    (setq org-refile-allow-creating-parent-nodes t
          org-outline-path-complete-in-steps nil
          org-refile-targets '((nil :maxlevel . 1)
                               (org-agenda-files :maxlevel . 1)))

    (setq org-agenda-custom-commands
          '(("n" "AGENDA"
             ((agenda "")))
            ("l" "Logística"
             ((todo "LOGÍSTICA"
                    ((org-agenda-overriding-header "LOGÍSTICA")
                     (org-agenda-
  (setf slime-lisp-implementations
        `((sbcl    ("sbcl"))
          (roswell ("ros" "-Q" "run"))
          (roswell-dune ("ros" "-Q" "run" "-e" "(ql:quickload :dune)" "-e" "(in-package :dune)")))
        slime-default-lisp 'roswell-dune)

  (slime-setup '(slime-asdf
                 slime-company
                 slime-fancy
                 slime-indentation
                 slime-sbcl-exts
                 slime-scratch
                 slime-tramp))sorting-strategy '(priority-down))))))
            ("d" "Próximo" agenda ""
             ((org-agenda-entry-types '(:deadline))
              (org-deadline-warning-days 30)
              (org-agenda-time-grid nil)
              (org-agenda-overriding-header "Próximo")))))))

(defun rogue-org-setup-general ()
  "Misc settings."

  (with-eval-after-load 'org
    (setq org-startup-indented t
          org-clock-idle-time 5
          ;; org-bullets-bullet-list '("╪" "⋇" "✚" "⊸" "∘")
          ;; org-bullets-bullet-list '("𐄺" "⋇" "✚" "⁙" "∷" "∴" "⠒" "∙")
          ;;  "༶" "⋗" "⁜" "𐄺" "⩾"
          org-bullets-bullet-list '("╪" "⍎" "✚" "≗" "═" "⍛" "—" "∘")
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
