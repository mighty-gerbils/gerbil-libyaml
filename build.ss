#!/usr/bin/env gxi

(import :std/build-script :std/make)
(defbuild-script
  `((gsc: "text/libyaml"
          "-cc-options" ,(cppflags "libyaml" "")
          "-ld-options" ,(ldflags "libyaml" "-lyaml"))
    (ssi: "text/libyaml")
    "text/yaml"))
