(defn fib [n] (_fib (- n 2) 1 1 @[1 1]))

(defn _fib [n i j arr]
  (if (= n 0)
    arr
    (_fib (- n 1) j (+ i j) (array/push arr (+ i j)))))

(fib 20)
