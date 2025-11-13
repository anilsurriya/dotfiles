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
(setq-default display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(dolist (mode '(eshell-mode-hook
		 term-mode-hook
		 shell-mode-hook))
	(add-hook mode (lambda () (display-line-numbers-mode 0))))


;;;;;

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.V
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))


;; create the autosave and backups dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;;;;

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))


(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)

         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))



(global-set-key (kbd "M-s-h")  'windmove-left)
(global-set-key (kbd "M-s-l") 'windmove-right)
(global-set-key (kbd "M-s-k")    'windmove-up)
(global-set-key (kbd "M-s-j")  'windmove-down)
