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
  (setq evil-want-integration t)
  (setq evil-want-C-u-scroll t)
  :config (evil-mode 1)
  (define-key evil-normal-state-map (kbd "SPC") 'leader-key)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (define-key evil-insert-state-map (kbd "C-w") evil-window-map)
  (define-key evil-insert-state-map (kbd "C-w /") 'split-window-right)
  (define-key evil-insert-state-map (kbd "C-w -") 'split-window-below)
  (global-set-key (kbd "M-u") 'universal-argument)
  (setq evil-default-state 'emacs)
  (setq evil-insert-state-modes nil)
  (setq evil-motion-state-modes nil)
  (setq evil-normal-state-modes '(fundamental-mode
				  conf-mode
				  prog-mode
				  text-mode
				  dired))
  (add-hook 'with-editor-mode-hook 'evil-insert-state)

  (setq evil-insert-state-cursor '((bar . 2) "lime green")
	evil-normal-state-cursor '(box "yellow"))

  (add-hook 'evil-insert-state-exit-hook (lambda () (blink-cursor-mode 0)))
  (add-hook 'evil-insert-state-entry-hook (lambda () (blink-cursor-mode 1)))
  (setq blink-cursor-blinks 0)
  (blink-cursor-mode 0))
