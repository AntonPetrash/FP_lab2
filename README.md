## МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС

### Звіт з лабораторної роботи 1
 "Обробка списків з використанням базових функцій"
 дисципліни "Вступ до функціонального програмування"

**Студент**: *Петраш Антон Степанович КВ-13*


**Рік**: *2025*

## Завдання за варіантом №13:
Реалізуйте дві рекурсивні функції, що виконують деякі дії з вхідним(и) списком(-ами), за
можливості/необхідності використовуючи різні види рекурсії. Функції, які необхідно
реалізувати, задаються варіантом (п. 2.1.1). Вимоги до функцій:
1. Зміна списку згідно із завданням має відбуватись за рахунок конструювання нового
списку, а не зміни наявного (вхідного).
2. Не допускається використання функцій вищого порядку чи стандартних функцій
для роботи зі списками, що не наведені в четвертому розділі навчального
посібника.
3. Реалізована функція не має бути функцією вищого порядку, тобто приймати функції
в якості аргументів.
4. Не допускається використання псевдофункцій (деструктивного підходу).
5. Не допускається використання циклів.
Кожна реалізована функція має бути протестована для різних тестових наборів. Тести
мають бути оформленні у вигляді модульних тестів (див. п. 2.3).
![Варіант 13](https://github.com/user-attachments/assets/40cee3fb-519b-4108-8037-7caa9e891969)

**Код для першої частини:**
```
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
```
**Результат:**
```
Output:

Test 1: T
Test 2: T
Test 3: T
Test 4: T
Test 5: T
```

**Код для другої частини:**
```
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
```
**Результат:**
```
Output:

Test 1: T
Test 2: T
Test 3: T
Test 4: T
Test 5: T
```

