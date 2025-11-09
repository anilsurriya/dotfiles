;; disable startup screen
(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

;; disable top menu bar
(menu-bar-mode -1)

;; Setup visible bell
(setq visible-bell t)

(load-theme 'tango-dark)

(column-number-mode)
(global-display-line-numbers-mode t)

(dolist (mode '(eshell-mode-hook
		 term-mode-hook
		 shell-mode-hook))
	(add-hook mode (lambda () (display-line-numbers mode 0))))


;;;;;

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
 '(auto-save-file-name-transforms
   '((".*" "~/.emacs.d/autosaves/" t)))
 '(backup-directory-alist
   '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave and backups dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;;;;
