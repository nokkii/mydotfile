
;-----------------------------------------------------------------------------
;; グループ化せずにタブを表示
(require 'cl)
(when (require 'tabbar nil t)
  (setq tabbar-buffer-groups-function
	(lambda (b) (list "All Buffers")))
  (setq tabbar-buffer-list-function
	(lambda ()
	  (remove-if
	   (lambda(buffer)
	     (unless (string-match (buffer-name buffer)
		 "\\(*scratch*\\|*Apropos*\\|*shell*\\|*eshell*\\|*Customize*\\)")
	       (find (aref (buffer-name buffer) 0) " *"))
	     )
	   (buffer-list))))
(tabbar-mode))

;; 左に表示されるボタンを無効化
(setq tabbar-home-button-enabled "")
(setq tabbar-scroll-left-button-enabled "")
(setq tabbar-scroll-right-button-enabled "")
(setq tabbar-scroll-left-button-disabled "")
(setq tabbar-scroll-right-button-disabled "")

;; 色設定
 (set-face-attribute
   'tabbar-default-face nil
   :background "gray90") ;バー自体の色
  (set-face-attribute ;非アクティブなタブ
   'tabbar-unselected-face nil
   :background "gray90"
   :foreground "black"
   :box nil)
  (set-face-attribute ;アクティブなタブ
   'tabbar-selected-face nil
   :background "black"
   :foreground "white"
   :box nil)

;; 幅設定
  (set-face-attribute
   'tabbar-separator-face nil
   :height 0.7)

;; Firefoxライクなキーバインドに
(global-set-key [(control tab)]       'tabbar-forward)
(global-set-key [(control shift ttab)] 'tabbar-backward)
;; -nw では効かないので別のキーバインドを割り当てる
(global-set-key (kbd "C-x n") 'tabbar-forward)
(global-set-key (kbd "C-x p") 'tabbar-backward)

;;F4ボタンで切り替え
(global-set-key [f4] 'tabbar-mode)

