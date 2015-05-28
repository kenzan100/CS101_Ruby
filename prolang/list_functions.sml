fun list_product(xs : int list) =
  if null xs
  then 1
  else hd xs * list_product(tl xs)

val x = list_product([])
val y = list_product([5])
val z = list_product([1,10,4])

fun countdown(x : int) =
  if x = 0
  then []
  else x :: countdown(x - 1)

val xx = countdown(10)

fun factorial2(n : int) =
  list_product(countdown(n))

val yy = factorial2(10)

fun append(xs : int list, ys: int list) =
  if null xs
  then ys
  else
    hd(xs)::(append((tl xs),ys))

val appended_list = append([1,2], [3,4])
