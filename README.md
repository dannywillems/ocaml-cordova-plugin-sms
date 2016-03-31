# ocaml-cordova-sms-plugin

Binding to
[cordova-sms-plugin](https://github.com/cordova-sms/cordova-sms-plugin)

[Example
application](https://github.com/dannywillems/ocaml-cordova-sms-plugin-example).
**In development**

## What does cordova-sms-plugin do ?

```
Cross-platform plugin for Cordova / PhoneGap to to easily send SMS. Available
for Android, iOS, and Windows Phone 8.

This plugin works with Cordova 3.x, 4.x and 5.x version.
```

Source: [cordova-sms-plugin](https://github.com/cordova-sms/cordova-sms-plugin)

## Repository branches and tags

We are migrating bindings from
[js_of_ocaml](https://github.com/ocsigen/js_of_ocaml) (low level bindings) to
[gen_js_api](https://github.com/lexifi/gen_js_api) (high level bindings).

The gen_js_api binding allows to use *pure* ocaml types (you don't have to use
the ## syntax from js_of_ocaml or Js.string type but only # and string type).

The js_of_ocaml version is available in the branch
[*js_of_ocaml*](https://github.com/dannywillems/ocaml-cordova-plugin-sms/tree/js_of_ocaml)
but we **recommend** to use the gen_js_api version which is the master branch.

## How to use ?

See the official documentation
[cordova-sms-plugin](https://github.com/cordova-sms/cordova-sms-plugin)

## ! BE CAREFUL !

The device plugin creates a new object called *sms*, but the object is
available when the *deviceready* event is handled.

We provide a function *Sms.t* of type unit -> Sms.sms
which does the binding when you call it.
So, use

```OCaml
let on_device_ready _ =
  let sms = Sms.t () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
