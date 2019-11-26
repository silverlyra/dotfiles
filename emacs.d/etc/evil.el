(use-package evil
	     :init
	     (setq evil-want-keybinding nil)
             :config
             (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-surround
             :after evil
             :config
             (global-evil-surround-mode 1))

(use-package evil-org
             :after (evil org)
             :config
             (add-hook 'org-mode-hook 'evil-org-mode)
             (add-hook 'evil-org-mode-hook
                       (lambda () (evil-org-set-key-theme)))
             (require 'evil-org-agenda)
             (evil-org-agenda-set-keys))
