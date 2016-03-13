(* --------------------------------------------------------------------------- *)
type android_options =
  <
    intent            : Js.js_string Js.t Js.readonly_prop
  > Js.t

type android_intent = No_open | Intent
let no_open         = No_open
let intent          = Intent

let create_android_options ?(intent=No_open) () =
  object%js
    val intent = match intent with
    | No_open -> Js.string ""
    | Intent -> Js.string "Intent"
  end
(* --------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------- *)
type options =
  <
    replaceLineBreaks : bool Js.t Js.readonly_prop ;
    android           : android_options Js.readonly_prop
  > Js.t

let create_options ?(replace_line_breaks=false) ?(android=None) () =
  object%js
    val replaceLineBreaks = Js.bool replace_line_breaks
    val android = match android with
      | None -> create_android_options ()
      | Some x -> x
  end
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

let sms () = Js.Unsafe.js_expr ("sms")
