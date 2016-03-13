(* --------------------------------------------------------------------------- *)
type android_options =
  <
    intent            : Js.js_string Js.t Js.readonly_prop
  > Js.t

type android_intent
val no_open : android_intent
val intent  : android_intent

val create_android_options : ?intent:android_intent -> unit -> android_options
(* --------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------- *)
type options =
  <
    replaceLineBreaks : bool Js.t Js.readonly_prop ;
    android           : android_options Js.readonly_prop
  > Js.t

val create_options :  ?replace_line_breaks:bool ->
                      ?android:android_options option ->
                      unit -> options
(* --------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------- *)
class type sms =
  object
    (* send [number] [message] *)
    method send       : Js.js_string Js.t -> Js.js_string Js.t -> unit Js.meth
    (* send [number] [message] [options] *)
    method send_opt   : Js.js_string Js.t -> Js.js_string Js.t -> options
                      -> unit Js.meth
    (* send [number] [message] [options] [succes_callback *)
    method send_succ  : Js.js_string Js.t -> Js.js_string Js.t -> options
                      -> (unit -> unit) -> unit Js.meth
    (* send [number] [message] [options] [succes_callback [error_callback] *)
    method send_cb    : Js.js_string Js.t -> Js.js_string Js.t -> options
                      -> (unit -> unit) -> (Js.js_string Js.t -> unit)
                      -> unit Js.meth
  end
(* --------------------------------------------------------------------------- *)

val sms : unit -> sms Js.t
