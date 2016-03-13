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

## How to use ?

See the official documentation
[cordova-sms-plugin](https://github.com/cordova-sms/cordova-sms-plugin)

## ! BE CAREFUL !

The device plugin creates a new object called *sms*, but the object is
available when the *deviceready* event is handled.

We don't provide a *sms* variable in this plugin (as said in the official
documentation on js_of_ocaml). If we did, *sms* will be set to **undefined**
because the *sms* javascript object doesn't exist when we create
the variable.

Instead, we provide a function *Sms.sms* of type unit -> Sms.sms
Js.t which does the binding when you call it.
So, use

```OCaml
let on_device_ready =
  let sms = Sms.sms () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
