rprintf
=======

[![Build Status](https://travis-ci.org/renkun-ken/rprintf.png?branch=master)](https://travis-ci.org/renkun-ken/rprintf)

rprintf is an adaptive builder for formatted strings. Currently it provides a set of tools for building formatted strings under various replacement rules: 

- C-style formatting with `sprintf`
- Named variable-based formatting
- Number-based formatting

The primary goal of this package is to make it easier to produce formatted strings in all popular styles.

## Installation

You can install from CRAN with

```s
install.packages("rprintf")
```

or you can install the latest development version from GitHub with

```s
devtools::install_github("rprintf","renkun-ken")
```

## Examples

The following examples demonstrate how `rprintf` functions works. You should be familiar with how `sprintf` works first. See the [documentation](http://stat.ethz.ch/R-manual/R-devel/library/base/html/sprintf.html) for more details.

### C-style formatting

```rconsole
> rprintf("Hello, %s","world")
[1] "Hello, world"

> rprintf("%s (%d years old)","Ken",24)
[1] "Ken (24 years old)"

> rprintf("He is %d but has a height of %.1fcm",18,190)
[1] "He is 18 but has a height of 190.0cm"
```

### Named variable-based formatting

```rconsole
> rprintf("Hello, $name", name="world")
[1] "Hello, world"

> rprintf("$name ($age years old)",name="Ken",age=24)
[1] "Ken (24 years old)"

> rprintf("He is $age but has a height of $height:.2fcm",age=18,height=190)
[1] "He is 18 but has a height of 190.00cm"

> rprintf("$a, $b:.1f, $c:+.2f, $b, $a:.0f",a=1.56,b=2.34,c=3.78)
[1] "1.56, 2.3, +3.78, 2.34, 2"
```

### Number-based formatting

```rconsole
> rprintf("Hello, {1}", "world")
[1] "Hello, world"

> rprintf("{1} ({2} years old)","Ken",24)
[1] "Ken (24 years old)"

> rprintf("He is {1} but has a height of {2:.2f}cm",18,190)
[1] "He is 18 but has a height of 190.00cm"

> rprintf("{1}, {2:.1f}, {3:+.2f}, {2}, {1:.0f}",1.56,2.34,3.78)
[1] "1.56, 2.3, +3.78, 2.34, 2"

> rprintf("{2},{1}","x","y")
[1] "y,x"
```

### Working with named character vectors and lists

```rconsole
> rprintf(c("%s:%d","$name:$age","{1}:{2}"),name="Ken",age=24)
[1] "Ken:24" "Ken:24" "Ken:24"

> rprintf(c(a="%s:%d",b="$name:$age",c="{1}:{2}"),name="Ken",age=24)
       a        b        c 
"Ken:24" "Ken:24" "Ken:24"

> rprintf(list("%s:%d","$name:$age","{1}:{2}"),name="Ken",age=24)
[[1]]
[1] "Ken:24"

[[2]]
[1] "Ken:24"

[[3]]
[1] "Ken:24"

> rprintf(list(a="%s:%d",b="$name:$age",c="{1}:{2}"),name="Ken",age=24)
$a
[1] "Ken:24"

$b
[1] "Ken:24"

$c
[1] "Ken:24"
```

For each type of formatting, a specialized function is also provided. `rprintv` only handles named variable-based formatting, and `rprintn` only handles number-based formatting.

## Help overview

```s
help(package = rprintf)
```

## License

This package is under [MIT License](http://opensource.org/licenses/MIT).
