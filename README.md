# ocaml-cordova-plugin-sms

[![LGPL-v3 licensed](https://img.shields.io/badge/license-LGPLv3-blue.svg)](https://raw.githubusercontent.com/dannywillems/ocaml-cordova-plugin-sms/master/LICENSE)
[![Build Status](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-sms.svg?branch=master)](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-sms)

Binding to
[cordova-sms-plugin](https://github.com/cordova-sms/cordova-sms-plugin)

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

## How to install and compile your project by using this plugin ?

Don't forget to switch to a compiler **>= 4.03.0**.
```Shell
opam switch 4.03.0
```

You can use opam by pinning the repository with
```Shell
opam pin add cordova-plugin-sms https://github.com/dannywillems/ocaml-cordova-plugin-sms.git
```

and to compile your project, use
```Shell
ocamlfind ocamlc -c -o [output_file] -package gen_js_api -package cordova-plugin-sms [...] -linkpkg [other arguments]
```

Don't forget to install the cordova plugin activity indicator with
```Shell
cordova plugin add cordova-plugin-sms
```

## How to use ?

See the official documentation
[cordova-sms-plugin](https://github.com/cordova-sms/cordova-sms-plugin)
