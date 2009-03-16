;;; company-ispell.el --- a company-mode completion back-end using ispell
;;
;; Copyright (C) 2009 Nikolaj Schumacher
;;
;; This file is part of company.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(require 'company)
(require 'ispell)
(eval-when-compile (require 'cl))

(defcustom company-ispell-dictionary nil
  "*Dictionary to use for `company-ispell'.
If nil, use `ispell-complete-word-dict'."
  :group 'company
  :type '(choice (const :tag "default (nil)" nil)
                 (file :tag "dictionary" t)))

(defun company-ispell (command &optional arg &rest ignored)
  (case command
    ('prefix (company-grab "\\<\\w+\\>"))
    ('candidates (lookup-words arg (or company-ispell-dictionary
                                       ispell-complete-word-dict)))
    ('sorted t)
    ('ignore-case t)))

(provide 'company-ispell)
;;; company-ispell.el ends here