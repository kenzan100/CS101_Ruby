fun pow(x: int, y: int) =
  if y=0
  then 1
  else x * pow(x, y-1)

fun cube(x: int) =
  pow(x,3)

val hoge =cube(8)
