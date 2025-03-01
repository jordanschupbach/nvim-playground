;; A simple hack

;; Print hello world
(print "Hello, world!!!")
(print "")

;; Print a list of numbers
(print "Here's a list of numbers:")
(print '(1 2 3 4 5 6 8 9))
(print "")

(defun random-list (n) (loop repeat n collect (random 1.0 (make-random-state t))))
(defparameter x (random-list 10))
(print "And here's 10 random uniform numbers:")
(print x)
(print "")

;; To string
(defparameter mynum (princ-to-string (random 10.0 (make-random-state t))))
;; String concatenation

(print (concatenate 'string "My random number is: " mynum))


(print "creating a hash table....")
(defparameter *my-hash-table* (make-hash-table))
(print "done....")
(print *my-hash-table*)

(defparameter key1 "asdf")
(defparameter value1 "fdsa")
(print key1)
(print value1)

;; (defstruct (person (:type vector))  ; You can specify the overall type if needed
;;   (name (:type string))
;;   (age  (:type integer)))


(defstruct person
  name
  age)


(defvar john (make-person :name "John Doe" :age 30))

(print john)

;; (declaim (ftype (function (string) string) person-name))
;; (declaim (ftype (function (integer) integer) person-age))


(setf (gethash 'key1 *my-hash-table*) 'value1)
;; (printc-to-string '(gethash 'key1 *my-hash-table*))
;; (remhash 'key1 *my-hash-table*)
;; (print (gethash 'key1 *my-hash-table*))





