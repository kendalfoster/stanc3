(** Some functions for checking whether conversions between types are allowed *)

open Ast

val check_compatible_arguments_mod_conv :
     string
  -> (Middle.autodifftype * Middle.unsizedtype) list
  -> (Middle.autodifftype * Middle.unsizedtype) list
  -> bool
(** Check that the rhs list of function argument types can be converted to the
    lhs *)

val check_of_same_type_mod_array_conv :
  string -> Middle.unsizedtype -> Middle.unsizedtype -> bool
(** Check that the rhs type can be converted to the lhs, where we allow
    conversion inside an array constructor *)

val check_of_compatible_return_type :
  Middle.returntype -> statement_returntype -> bool
(** Check that the rhs function body statement_returntype is compatible with the
    lhs returntype *)