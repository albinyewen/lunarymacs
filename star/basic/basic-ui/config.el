;;
;; Var
;;

(defvar moon-banner "
███╗   ███╗ ██████╗  ██████╗ ███╗   ██╗    ███████╗███╗   ███╗ █████╗  ██████╗███████╗
████╗ ████║██╔═══██╗██╔═══██╗████╗  ██║    ██╔════╝████╗ ████║██╔══██╗██╔════╝██╔════╝
██╔████╔██║██║   ██║██║   ██║██╔██╗ ██║    █████╗  ██╔████╔██║███████║██║     ███████╗
██║╚██╔╝██║██║   ██║██║   ██║██║╚██╗██║    ██╔══╝  ██║╚██╔╝██║██╔══██║██║     ╚════██║
██║ ╚═╝ ██║╚██████╔╝╚██████╔╝██║ ╚████║    ███████╗██║ ╚═╝ ██║██║  ██║╚██████╗███████║
╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝    ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝
                                                                                      ")

(defvar moon-short-banner "
███╗   ███╗ ██████╗  ██████╗ ███╗   ██╗
████╗ ████║██╔═══██╗██╔═══██╗████╗  ██║
██╔████╔██║██║   ██║██║   ██║██╔██╗ ██║
██║╚██╔╝██║██║   ██║██║   ██║██║╚██╗██║
██║ ╚═╝ ██║╚██████╔╝╚██████╔╝██║ ╚████║
╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝
                                       ")

;;
;; Func
;;


(defun moon/draw-homepage ()
  "Draw MOON EMACS or MOON on the middle of current buffer.

MOON is used when buffer's width is less than 86."
  (interactive)
  (let (
	(banner-list (if (>= (window-width) 86)
                         (split-string moon-banner "\n")
                       (split-string moon-short-banner "\n")))
	)
    (let (
	  (space-to-insert
	   (make-string
	    (/ (- (window-width)
                  ;; first line could be empty, use second line for length
                  (length (nth 1 banner-list))) 2) ?\s))
	  )
      (insert (make-string 10 ?\n))
      (dolist (line banner-list)
	(insert space-to-insert)
	(insert line)
	(insert "\n"))
      ))
  )

;;
;; Cursor Color
;;


(defun moon-normal-state-cursor-color ()
  "Cursor color in normal state."
  (cond
   ((equal moon-current-theme "spacemacs-dark")
    lunary-yellow)
   ((equal moon-current-theme "spacemacs-light")
    spacemacs-light-purple)
   ))

(defun moon-insert-state-cursor-color ()
  "Cursor color in insert state."
  lunary-pink)

(change-cursor-on-hook| evil-normal-state-entry-hook moon-normal-state-cursor-color)
;; secure cursor color after changing theme
(change-cursor-on-hook| moon-load-theme-hook moon-normal-state-cursor-color)
(change-cursor-on-hook| evil-insert-state-entry-hook moon-insert-state-cursor-color)




;;
;; Font
;;

;; (moon-set-font| :family "Source Code Pro" :weight 'light :size 14)
(moon-set-font| :family "SF Mono" :weight 'light :size 14)


;;
;; Homepage
;;

;; Homepage
(add-hook 'moon-init-hook #'moon/draw-homepage t)
(add-hook 'moon-post-init-hook #'moon-display-benchmark t)


;;
;; Config
;;

;; visual line mode
;; visual line mode makes swiper very slow
;; so I'll disable it for now
;; (global-visual-line-mode 1)
