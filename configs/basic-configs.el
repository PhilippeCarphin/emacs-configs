;; Looks
(setq inhibit-startup-screen t)
(setq inhibit-startup-buffer-menu t)
;; (tool-bar-mode -1)
(scroll-bar-mode -1)
(custom-set-variables '(custom-enabled-themes '(misterioso)))
;; (custom-set-faces '(default ((t (:height 200)))))
(custom-set-variables '(org-startup-with-inline-images t))
(custom-set-variables '(org-image-actual-width 100))

;; Cursor
(custom-set-variables '(cursor-type '(bar . 4)))
(custom-set-faces '(cursor ((t (:background "SlateGray3")))))
(blink-cursor-mode)

;; Higlight current line
;; Looks good in some themes but not others
;; (global-hl-line-mode 1)

;; Smooth scrolling and keep cursor 10 lines away from top and bottom
(setq scroll-step 1)
(setq-default scroll-margin 10)

;; Visual line mode with chars to show visual wrapping
(custom-set-variables '(visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow)))
(global-visual-line-mode 1)

;; MISC
(custom-set-variables '(vc-follow-symlinks t))
(setq-default fill-column 80)
(custom-set-variables '(indent-tabs-mode nil))
