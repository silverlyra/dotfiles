(use-package company
  :hook (after-init . global-company-mode)
  :commands (company-mode)
  :bind (:map company-active-map
	      ([tab] . company-select-next)
	      ([backtab] . company-select-previous)
	      ("C-n" . company-select-next)
	      ("C-p" . company-select-previous))
  :config
  (setq company-idle-delay            0.1
        company-minimum-prefix-length 3
        company-selection-wrap-around t
        company-show-numbers          t))

(use-package which-key
  :defer 5
  :commands which-key-mode
  :config
  (which-key-mode))

(use-package recentf
  :defer 10
  :init
  (recentf-mode 1)
  :config
  (setq recentf-max-menu-items 100))
