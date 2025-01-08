(defun remove-even-triples (lst)
  (cond
    ;; якщо список закороткий, повертаємо його
    ((null lst) nil)
    ((< (length lst) 3) lst)
    ;; Залишити першу трійку, пропустити другу, продовжити з рештою
    (t
     (append (subseq lst 0 3) ; залишаємо першу трійку
             (remove-even-triples (nthcdr 6 lst)))))) ; пропускаємо другу трійку

(defun test-remove-even-triples ()
  (format t "Test 1: ~A~%" (equal (remove-even-triples '(a b c d e f g h i)) '(a b c g h i)))
  (format t "Test 2: ~A~%" (equal (remove-even-triples '(1 2 3 4 5 6 7 8 9 10 11 12)) '(1 2 3 7 8 9)))
  (format t "Test 3: ~A~%" (equal (remove-even-triples '(x y z)) '(x y z)))
  (format t "Test 4: ~A~%" (equal (remove-even-triples nil) nil))
  (format t "Test 5: ~A~%" (equal (remove-even-triples '(a b c d e f g)) '(a b c g))))

(test-remove-even-triples )