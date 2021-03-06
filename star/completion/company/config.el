;;; -*- lexical-binding: t -*-

(use-package| company
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 2
        company-require-match nil
        company-dabbrev-downcase nil)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (global-company-mode 1)
  )

(load| short-finger)

(add-hook 'org-mode-hook #'short-finger-mode)
(add-hook 'markdown-mode-hook #'short-finger-mode)
