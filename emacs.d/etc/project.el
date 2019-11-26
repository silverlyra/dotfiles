(use-package projectile
  :bind (("C-c p" . projectile-command-map)))

(use-package magit
  :pin melpa)

(use-package saveplace
  :defer 5
  :config
  (setq save-place t))