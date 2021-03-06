;;; init-pyim.el --- -*- lexical-binding: t -*-
;;
;; Filename: init-pyim.el
;; Description: Initialize Pyim
;; Author: Mingde (Matthew) Zeng
;; Copyright (C) 2019 Mingde (Matthew) Zeng
;; Created: Thu Jun 20 00:36:05 2019 (-0400)
;; Version: 2.0.0
;; Last-Updated: Mon Aug 12 22:33:53 2019 (-0400)
;;           By: Mingde (Matthew) Zeng
;; URL: https://github.com/MatthewZMD/.emacs.d
;; Keywords: M-EMACS .emacs.d init
;; Compatibility: emacs-version >= 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This initializes pyim
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; PyimPac
(use-package pyim
  :custom
  (default-input-method "pyim")
  (pyim-default-scheme 'quanpin)
  (pyim-page-tooltip 'popup)
  (pyim-page-length 9)
  :config
  (pyim-isearch-mode 1)
  ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换速度 :-)
  ;; 我自己使用的中英文动态切换规则是：
  ;; 1. 光标只有在注释里面时，才可以输入中文。
  ;; 2. 光标前是汉字字符时，才能输入中文。
  ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  pyim-probe-isearch-mode
                  pyim-probe-program-mode
                  pyim-probe-org-structure-template))
  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))
  :bind
  ("M-j" . pyim-convert-string-at-point))
;; -PyimPac

;; PyimBaseDictPac
(use-package pyim-basedict
  :after pyim
  :config (pyim-basedict-enable))
;; -PyimBaseDictPac

(provide 'init-pyim)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-pyim.el ends here
