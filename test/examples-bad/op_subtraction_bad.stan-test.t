  $ $TESTDIR//../../_build/default/stanc.exe "$TESTDIR//op_subtraction_bad.stan"
  Semantic error at file ".*/examples-bad//op_subtraction_bad.stan", line 7, characters 7-12: (re)
  Ill-typed arguments supplied to infix operator -. Available signatures: 
  (real, matrix) => matrix
  (real, row_vector) => row_vector
  (real, vector) => vector
  (matrix, real) => matrix
  (row_vector, real) => row_vector
  (vector, real) => vector
  (matrix, matrix) => matrix
  (row_vector, row_vector) => row_vector
  (vector, vector) => vector
  (real, real) => real
  (int, int) => int
  Instead supplied arguments of incompatible type: vector, matrix.
  [1]
