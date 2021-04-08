(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org"   . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("gnu"   . "http://elpa.gnu.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

(use-package evil
  :ensure t
  :init (setq evil-want-C-i-jump nil)
  (setq evil-want-C-u-scroll t)
  :config (evil-mode 1)
  (setq evil-insert-state-cursor '((bar . 2) "lime green")
        evil-normal-state-cursor '(box "yellow"))
  (add-hook 'evil-insert-state-exit-hook (lambda () (blink-cursor-mode 0)))
  (add-hook 'evil-insert-state-entry-hook (lambda () (blink-cursor-mode 1)))
  (setq blink-cursor-blinks 0)
  (blink-cursor-mode 0))
