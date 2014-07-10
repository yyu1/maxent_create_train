FUNCTION SetIntersection, set_a, set_b

   ; Find the intersection of the ranges.
   mina = Min(set_a, Max=maxa) 
   minb = Min(set_b, Max=maxb)
   minab = mina > minb
   maxab = maxa < maxb

   ; If the set ranges don't intersect, then result = NULL.
   IF ((maxa LT minab) AND (minb GT maxab)) OR $
      ((maxb LT minab) AND (mina GT maxab)) THEN RETURN, -1

   r = Where((Histogram(set_a, Min=minab, Max=maxab) NE 0) AND  $
             (Histogram(set_b, Min=minab, Max=maxab) NE 0), count)

   IF count EQ 0 THEN RETURN, -1 ELSE RETURN, r + minab
END
