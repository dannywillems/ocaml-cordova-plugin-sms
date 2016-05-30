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
type options = private Ojs.t

val create_options :
  ?replace_line_breaks:(bool [@js.default false])       ->
  ?android:(android_options option [@js.default None])  ->
  unit                                                  ->
  options
[@@js.builder]
(* --------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------- *)
type sms = private Ojs.t

val t : unit -> sms
[@@js.get "sms"]
(* --------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------- *)
val send :
  ?sms:sms ->
  num:string ->
  msg:string ->
  ?opt:options  -> (* options *)
  ?succ_cb:(unit -> unit)                         -> (* success_cb *)
  ?err_cb:(string -> unit)                        -> (* error_cb *)
  unit                                            ->
  unit

[@@js.custom
  val send_internal : sms ->
                      num:string ->
                      msg:string ->
                      ?opt:(options [@js.default create_options ()])  -> (* options *)
                      ?succ_cb:(unit -> unit)                         -> (* success_cb *)
                      ?err_cb:(string -> unit)                        -> (* error_cb *)
                      unit                                            ->
                      unit
                      [@@js]
  let default_sms = t
  let send ?sms ~num ~msg ?opt ?succ_cb ?err_cb () =
    let s = match sms with
    | None -> default_sms ()
    | Some o -> o
    in
    send_internal s ~num ~msg ?opt ?succ_cb ?err_cb ()
]
(* --------------------------------------------------------------------------- *)


