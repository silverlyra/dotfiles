;; package repositories
(setq package-enable-at-startup nil
      package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/"))
      package-pinned-packages '((bind-key . "melpa")
                                (diminish . "melpa")
                                (use-package . "melpa")))
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (setq use-package-expand-minimally byte-compile-current-file))

(setq use-package-always-ensure t)

(use-package benchmark-init
             :ensure t
             :config (add-hook 'after-init-hook 'benchmark-init/deactivate))

;; dependencies
(use-package diminish
             :pin melpa)
(use-package async
             :pin melpa)
(use-package dash
             :pin melpa)
(use-package ht
             :pin melpa)
(use-package s
             :pin melpa)
(use-package f
             :pin melpa)
(use-package queue
             :pin gnu)
(use-package epl
             :pin melpa)
(use-package pkg-info
             :pin melpa)
(use-package use-package-ensure-system-package
             :pin melpa)

(use-package quelpa
             :pin melpa)
(use-package quelpa-use-package
             :pin melpa
             :config (quelpa-use-package-activate-advice))

(use-package no-littering
             :demand)

;; packages in etc (todo: demystify)
(async-bytecomp-package-mode 1)
(let ((loaded (mapcar #'file-name-sans-extension (delq nil (mapcar #'car load-history)))))
  (dolist (file (directory-files "~/.emacs.d/etc" t ".+\\.elc?$"))
    (let ((library (file-name-sans-extension file)))
      (unless (member library loaded)
        (load library nil t)
        (push library loaded)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (counsel swiper ivy which-key company ni ts aggressive-indent doom-modeline doom-themes exec-path-from-shell magit evil-org evil-surround evil-collection dired queue use-package-ensure-system-package treemacs-projectile quelpa-use-package no-littering evil dired-rmjunk dired-narrow diminish buffer-expose benchmark-init async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
