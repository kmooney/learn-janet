(use jaylib)

(init-window 640 480 "Test Game")
(set-target-fps 60)
(hide-cursor)

(while (not (window-should-close))
  (begin-drawing)

  (clear-background [1 1 1])
  (let [[x y] (get-mouse-position)]
    (draw-circle-gradient (math/floor x) (math/floor y) 31.4 :white :red)
    (draw-poly [500 200] (math/floor (* 10 (/ x 640))) (math/floor (* (/ y 480) 200)) 0 :orange)
    (draw-line-bezier
      [(- x 100) y]
      [(+ x 100) (+ y 50)]
      4 :pink)
    (draw-line-ex
      [x (- y 10)]
      [x (+ y 10)]
      4 :sky-blue)
    (draw-line-strip
      [[x 0] [x 100] [50 y] [10 180]]
      :black))

  (end-drawing))

(close-window)
