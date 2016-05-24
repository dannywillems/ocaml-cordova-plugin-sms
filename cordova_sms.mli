(* --------------------------------------------------------------------------- *)
class android_options : Ojs.t ->
  object
    inherit Ojs.obj
    method intent            : string
  end

type android_intent =
  | No_open [@js ""]
  | Intent  [@js "Intent"]
  [@@js.enum]

[@@@js.stop]
val no_open : android_intent
val intent  : android_intent
[@@@js.start]

[@@@js.implem
let no_open         = No_open
let intent          = Intent
]

val create_android_options :
  ?intent:(android_intent [@js.default No_open])  ->
  unit                                            ->
  android_options
[@@js.builder]
(* --------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------- *)
class options : Ojs.t ->
  object
    inherit Ojs.obj
    method replace_line_breaks  : bool
    method android              : android_options
  end

val create_options :
  ?replace_line_breaks:(bool [@js.default false]) ->
  ?android:(android_options option [@js.default None])   ->
  unit                                            ->
  options
[@@js.builder]
(* --------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------- *)
class sms : Ojs.t ->
  object
    inherit Ojs.obj
    (* send [number] [message] ?[options] ?[success_callback ?[error_callback] *)
    method send    : num:string                                     -> (* number *)
                     msg:string                                     -> (* message *)
                     ?opt:(options [@js.default create_options ()])  -> (* options *)
                     ?succ_cb:(unit -> unit)                         -> (* success_cb *)
                     ?err_cb:(string -> unit)                        -> (* error_cb *)
                     unit                                            ->
                     unit
  end
(* --------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------- *)
val t : unit -> sms
[@@js.get "sms"]
(* --------------------------------------------------------------------------- *)
