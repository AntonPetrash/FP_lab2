(defun decompress-list (lst)
  (cond
    ;;якщо список порожній, він повертається
    ((null lst) nil)
    ;; розпакуємо першу пару і додаємо результат рекурсії
    (t
     (let ((count (car (car lst)))      ; кількість повторень
           (element (cadr (car lst)))) ; сам елемент
       (append (make-list count :initial-element element) ; список повторень
               (decompress-list (cdr lst)))))))           ; обробка решти списку

(defun test-decompress-list ()
  (format t "Test 1: ~A~%" (equal (decompress-list '((1 1) (2 a) (3 3) (1 4))) '(1 a a 3 3 3 4)))
  (format t "Test 2: ~A~%" (equal (decompress-list '((4 x) (0 y) (2 z))) '(x x x x z z)))
  (format t "Test 3: ~A~%" (equal (decompress-list nil) nil))
  (format t "Test 4: ~A~%" (equal (decompress-list '((1 a))) '(a)))
  (format t "Test 5: ~A~%" (equal (decompress-list '((0 x))) nil)))

(test-decompress-list)