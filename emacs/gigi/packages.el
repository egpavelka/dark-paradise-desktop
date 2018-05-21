;;; packages.el --- rogue Layer packages File for Spacemacs

(defconst gigi-packages
  '(calfw
    calfw-org
    doom-themes
    (ligature-support :location local)
    ;; mediawiki
    multiple-cursors
    neotree
    nov
    org-cliplink
    org-gcal
    org-journal
    org-noter
    (org-pretty-table :location (recipe :fetcher github :repo "Fuco1/org-pretty-table"))
    pretty-mode
    (rogue-org :location local)
    (rogue-ui :location local)
    (rogue-utils :location local)
    (spaceline-all-the-icons :location local)
    writeroom-mode))

;; Initialize packages
(defun gigi/init-all-the-icons ()
  (use-package all-the-icons))

(defun gigi/init-calfw ()
  (use-package calfw
    :bind (("C-c q" . cfw:open-org-calendar))
    :config
    (setq cfw:fchar-junction ?┼
          cfw:fchar-vertical-line ?│
          cfw:fchar-horizontal-line ?─
          cfw:fchar-left-junction ?├
          cfw:fchar-right-junction ?┤
          cfw:fchar-top-junction ?┬
          cfw:fchar-top-left-corner ?┌
          cfw:fchar-top-right-corner ?┐)
    (setq cfw:render-line-breaker 'cfw:render-line-breaker-none)
    (setq cfw:face-item-separator-color nil)))

(defun gigi/init-calfw-org ()
  (use-package calfw-org
    :after calfw
    :config
    (setq cfw:org-face-agenda-item-foreground-color "#ecccc3")))

(defun gigi/init-doom-themes ()
  (use-package doom-themes
    :config
    (setq doom-themes-enable-bold t
          doom-themes-enable-italic t)

    (doom-themes-neotree-config)
    (setq doom-neotree-enable-variable-pitch nil
          doom-neotree-file-icons 'simple
          doom-neotree-line-spacing 4)
    (doom-themes-org-config)))

(defun gigi/init-ligature-support ()
  (use-package ligature-support))

(defun gigi/init-mediawiki ()
  (use-package mediawiki
    :config
    (setq mediawiki-draft-data-file "~/.mediawiki/draft.wiki"
          mediawiki-site-default "unfcking my life")
    ;; Secret file
    ;; (setq mediawiki-site-alist '(("Site name"
    ;;                               "url"
    ;;                               "usernme"
    ;;                               nil ??
    ;;                               "default page")))
    (load-file (concat user-secrets-dir "mediawiki.el"))))

(defun gigi/init-multiple-cursors ()
  (use-package multiple-cursors
    :bind (("C-<" . mc/edit-beginnings-of-lines)
           ("C->" . mc/edit-ends-of-lines)
           ("C-M-<mouse-1>" . mc/add-cursor-on-click))))

(defun gigi/init-nov ()
  (use-package nov
    :config
    (push '("\\.epub\\'" . nov-mode) auto-mode-alist)
    (setq nov-text-width 80)))

(defun gigi/init-neotree ()
  (use-package neotree
    :after rogue-utils
    :bind (("<f8>" . neotree-toggle)
           ("C-c C-p" . neotree-project-dir))
    :config
    (setq neo-smart-open t
          projectile-switch-project-action 'neotree-projectile-action)))

(defun gigi/init-org-cliplink ()
  (use-package org-cliplink
    :bind (("C-c y" . org-cliplink))))

(defun gigi/init-org-gcal ()
  (use-package org-gcal
    :ensure t
    :after (org calfw calfw-org)
    :hook ((cfw:calendar-mode . org-gcal-sync))
    :config
    (setq org-gcal-file-alist `(("egpavelka@gmail.com" . ,user-gcal-file)))
    ;; Secret file
    ;; (setq org-gcal-client-id ""
    ;;      org-gcal-client-secret "")
    (load-file (concat user-secrets-dir "gcal.el"))))

(defun gigi/init-org-journal ()
  (use-package org-journal
    :config
    (setq org-journal-dir user-journal-dir)))


(defun gigi/init-org-noter ()
  (use-package org-noter
    :after org
    :config
    (org-noter-set-auto-save-last-location t)
    ))

(defun gigi/init-org-pretty-table ()
  (use-package org-pretty-table
    :demand t
    :init
    (add-hook 'org-mode-hook (lambda () (org-pretty-table-mode 1)))))

(defun gigi/init-pretty-mode ()
  (use-package pretty-mode
    :config
    (progn
      (global-pretty-mode t)
      (global-prettify-symbols-mode 1)
     (pretty-deactivate-groups
      '(:equality :ordering :ordering-double :ordering-triple
                  :arrows :arrows-twoheaded :punctuation
                  :logic :sets))
     (pretty-activate-groups
      '(:greek :arithmetic-nary))
      )))

(defun gigi/init-rogue-org ()
  (use-package rogue-org
    :after org
    :config
    (rogue-org-setup-general)
    (rogue-org-setup-notes)
    (rogue-org-setup-babel)
    (rogue-org-setup-tex)))

(defun gigi/init-rogue-ui ()
  (use-package rogue-ui
    :after rogue-utils
    :config
    (rogue-ui-setup)))

(defun gigi/init-rogue-utils ()
  (use-package rogue-utils))

(defun gigi/init-spaceline-all-the-icons ()
  (progn
    (use-package spaceline-all-the-icons
      :after spaceline)
    (use-package spaceline
      :after powerline
      :config
      (setq-default mode-line-format '("%e" (:eval (spaceline-ml-ati)))))))

(defun gigi/init-writeroom-mode ()
  (use-package writeroom-mode
    :config
    (setq writeroom-restore-window-config t)0))
