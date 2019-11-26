(use-package exec-path-from-shell)

(use-package tramp
             :defer t
             :config (setq tramp-default-method "ssh"))
