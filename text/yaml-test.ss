;;; -*- Gerbil -*-
;;; © vyzo
;;; :std/text/yaml unit test
(import :std/test
        :std/sugar
        ./yaml)
(export yaml-test)

(def yaml-test
  (test-suite "test :clan/text/yaml"
    (test-case "test encoding of mapping keys"
      (check (yaml-load-string "foo: bar") => (list (hash ("foo" "bar"))))
      (parameterize ((yaml-key-format string->symbol))
        (check (yaml-load-string "foo: bar") => (list (hash (foo "bar")))))
      (parameterize ((yaml-key-format string->keyword))
        (check (yaml-load-string "foo: bar") => (list (hash (foo: "bar"))))))))))
