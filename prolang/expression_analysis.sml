(* less then expression analysis *)
(* 1. Syntax *)
3 < 0
(* any 2 expressions, with < in between *)

(* 2. Type Check *)
(* my guess: both 2 expressions must be the same type? *)
(* answer: bool, if only e1 and e2 have type int in the same static environment *)

(* 3. Evaluation *)
(* my guess: if first subexpression is less then the second one, return bool true otherwise, return false *)
(* answer: evaluate e1 to v1 and e2 to v2 in the same dynamic environment, produce true if v1 is less then v2, otherwise false *)
