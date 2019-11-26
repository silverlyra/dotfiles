(use-package ivy
  :demand t
  :bind (("C-x b"   . ivy-switch-buffer)
         ("C-x B"   . ivy-switch-buffer-other-window)
         ("M-H"     . ivy-resume)
         ("C-x C-b" . ibuffer))
  :bind (:map ivy-minibuffer-map
              ("<tab>" . ivy-alt-done)
              ("SPC"   . ivy-alt-done-or-space)
              ("C-d"   . ivy-done-or-delete-char)
              ("C-i"   . ivy-partial-or-done)
              ("C-r"   . ivy-previous-line-or-history)
              ("M-r"   . ivy-reverse-i-search))
  :bind (:map ivy-switch-buffer-map
              ("C-k" . ivy-switch-buffer-kill))
  :custom
  (ivy-dynamic-exhibit-delay-ms 200)
  (ivy-height 10)
  (ivy-initial-inputs-alist nil t)
  (ivy-magic-tilde nil)
  (ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
  (ivy-use-virtual-buffers t)
  (ivy-wrap t)

  :preface
  (defun ivy-done-or-delete-char ()
    (interactive)
    (call-interactively
     (if (eolp)
         #'ivy-immediate-done
       #'ivy-delete-char)))

  (defun ivy-alt-done-or-space ()
    (interactive)
    (call-interactively
     (if (= ivy--length 1)
         #'ivy-alt-done
       #'self-insert-command)))

  (defun ivy-switch-buffer-kill ()
    (interactive)
    (debug)
    (let ((bn (ivy-state-current ivy-last)))
      (when (get-buffer bn)
        (kill-buffer bn))
      (unless (buffer-live-p (ivy-state-buffer ivy-last))
        (setf (ivy-state-buffer ivy-last)
              (with-ivy-window (current-buffer))))
      (setq ivy--all-candidates (delete bn ivy--all-candidates))
      (ivy--exhibit)))

  ;; This is the value of `magit-completing-read-function', so that we see
  ;; Magit's own sorting choices.
  (defun my-ivy-completing-read (&rest args)
    (let ((ivy-sort-functions-alist '((t . nil))))
      (apply 'ivy-completing-read args)))

  :config
  (ivy-mode 1)
  (ivy-set-occur 'ivy-switch-buffer 'ivy-switch-buffer-occur))

(use-package swiper
  :ensure t
  :after ivy
  :bind (("C-s" . swiper)
         :map swiper-map
              ("M-y" . yank)
              ("M-%" . swiper-query-replace)
              ("C-." . swiper-avy)))

(use-package counsel
  :diminish
  :ensure t
  :after ivy
  :demand t
  :bind (("C-*"     . counsel-org-agenda-headlines)
         ("C-x C-f" . counsel-find-file)
         ("M-x"     . counsel-M-x)
         ("C-c e d" . counsel-describe-function)
         ("C-c e f" . counsel-file-jump)
         ("C-c e j" . counsel-dired-jump)
         ("C-c e l" . counsel-find-library)
         ("C-c e q" . counsel-set-variable)
         ("C-c e u" . counsel-unicode-char)
         ("C-x r b" . counsel-bookmark)))
