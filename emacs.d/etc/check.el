(use-package flycheck
  :pin melpa
  :ensure t
  :commands (flycheck-mode
             flycheck-next-error
             flycheck-previous-error)
  :bind (("C-c i b"   . flyspell-buffer)
         ("C-c i f"   . flyspell-mode)))
