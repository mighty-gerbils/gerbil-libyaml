# Gerbil YAML Processor

This package provides a Gerbil YAML processor using `liblmdb`.

## Dependencies

You need to have `libyaml` installed in your system.

In ubuntu:
```
$ sudo apt install libyaml-dev
```

## Installation

To install the package in your `$GERBIL_PATH` (`~/.gerbil` by default):
```shell
$ gerbil pkg install github.com/mighty-gerbils/gerbil-libyaml
```

## API
To use bindings from this package:
```scheme
(import :clan/text/yaml)
```
### yaml-key-format
``` scheme
(yaml-key-format) -> formatter
(yaml-key-format new-formatter) -> old-formatter
```

A parameter that controls how string keys are stored in mappings.  YAML allows
non-string keys in mappings (e.g. numbers, sequences, and other mappings).
These are not affected by this parameter.

No conversion is done by default.

To convert map keys to symbols:
``` scheme
> (parameterize ((yaml-key-format string->symbol))
   (hash-keys (car (yaml-load-string "foo: bar"))))
(foo)
```


To convert map keys to keywords:
``` scheme
> (parameterize ((yaml-key-format string->keyword))
   (hash-keys (car (yaml-load-string "foo: bar"))))
(foo:)
```


### yaml-load
``` scheme
(yaml-load filename) -> any | error
  filename := string
```

Loads a YAML data from given *filename*. Signals an error if fails to parse YAML.

### yaml-load-string
``` scheme
(yaml-load-string str) -> any | error
  str := string of YAML data
```

Parses a YAML data from *str*. Signals an error if fails to parse YAML.

### yaml-dump
``` scheme
(yaml-dump filename . args)
  filename := string
```

Dumps the arguments to a YAML file.


# License and Copyright

© 2017-2023 The Gerbil Core Team and contributors; License: LGPLv2.1 and Apache 2.0

Originally written by vyzo.
