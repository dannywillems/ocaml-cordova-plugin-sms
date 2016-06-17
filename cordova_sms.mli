(* --------------------------------------------------------------------------- *)
type android_intent =
  | No_open [@js ""]
  | Intent  [@js "Intent"]
  [@@js.enum]

type android_options = private Ojs.t

val create_android_options :
  ?intent:(android_intent [@js.default No_open])          ->
  unit                                                    ->
  android_options
[@@js.builder]
(* --------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------- *)
type options = private Ojs.t

val create_options :
  ?replace_line_breaks:(bool [@js.default false])         ->
  ?android:(android_options option [@js.default None])    ->
  unit                                                    ->
  options
[@@js.builder]
(* --------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------- *)
(* send [number] [message] ?[options] ?[success_callback ?[error_callback] *)
val send :
  num:string                                              -> (* number *)
  msg:string                                              -> (* message *)
  ?opt:(options [@js.default create_options ()])          -> (* options *)
  ?succ_cb:(unit -> unit)                                 -> (* success_cb *)
  ?err_cb:(string -> unit)                                -> (* error_cb *)
  unit                                                    ->
  unit
[@@js.global "sms.send"]
(* --------------------------------------------------------------------------- *)
