(var rads 10)
(var an (/ math/pi rads))

(defn _tree [x1 y1 x2 y2 l a d]
  (draw-line-strip [[x1 y1] [x2 y2]] 0x00aacd10)
  (if (not (= d 0))
    (let [x3 (+ x2 (* l (math/cos a)))
          y3 (+ y2 (* l (math/sin a)))
          l2 (math/floor (* l 0.8))
          a2 (+ a an)
          a3 (- a an)]
      (_tree x2 y2 x3 y3 l2 a2 (- d 1))
      (_tree x2 y2 x3 y3 l2 a3 (- d 1)))))

(defn tree [x y l a d]
  (let [x1 x y1 y x2 x y2 y]
    (_tree x1 y1 x2 y2 l a d)))

(use jaylib)

(init-window 2040 1080 "Tree")
(set-target-fps 60)
(var v 0)
(while (not (window-should-close))
    (begin-drawing)
    (draw-rectangle 0 0 1920 1080 0x00000008)
    (tree 960 860 -300 (/ math/pi 2) 14)
    (set v (+ v 0.00005))
    (set an (+ (* math/pi 2) (* (* math/pi 2) (math/sin v))))
  (end-drawing))
(close-window)
