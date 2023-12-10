# blend2d
### _Jeremiah LaRocco <jeremiah_larocco@fastmail.com>_

Common Lisp bindings to [Blend2D](https://github.com/blend2d/blend2d).

## Getting Started
These bindings will not be added to QuickLisp until after Blend2D has an official 1.0 release.  Until then, installation is manual, and it's recommended to build against a source version of Blend2D.

Fortunately, [cl-autowrap](https://github.com/jl2/cl-autowrap) makes it easy to build the bindings from the source code.

### Get and Build  Blend2D
First, fetch the [code](https://github.com/blend2d/blend2d) and follow the [build instructions](https://blend2d.com/download.html).  I've had good luck using the first shell script under "Building From Source".  To simplify later steps, you can install the library using "sudo make install", but it's not strictly necessary to follow these instructions.

### Get Blend2D Bindings
In your local Lisp project directory, clone the cl-blend2d library:

```Bash
git clone git@github.com:jl2/cl-blend2d.git
```

### Load Blend2D bindings in the REPL
In Slime:

```Common Lisp
(ql:quickload :blend2d.examples)
```

The quickload will take several seconds the first time, as autwrap needs to run c2ffi, parse the .spec files, and generate code.  Subsequent loads should be much faster.

Next, run one of the getting started examples:

```Common Lisp
(blend2d.examples:getting-started-1 "/home/jeremiah/blend2d.example.1.bmp")
```

This should produce a file blend2d.example.1.bmp


## License
ISC

Copyright (c) 2019 Jeremiah LaRocco <jeremiah_larocco@fastmail.com>


