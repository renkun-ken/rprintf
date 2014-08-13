

# rprintf

[![Build Status](https://travis-ci.org/renkun-ken/rprintf.png?branch=master)](https://travis-ci.org/renkun-ken/rprintf)

rprintf is an adaptive builder for formatted strings. Currently it provides a set of tools for building formatted strings under various replacement rules: 

- C-style formatting with `sprintf`
- Number-based formatting
- Variable-based formatting

The primary goal of this package is to make it easier to produce formatted strings in all popular styles.

## Installation

You can install from CRAN with

```r
install.packages("rprintf")
```

or you can install the latest development version from GitHub with

```r
devtools::install_github("rprintf","renkun-ken")
```

## Examples

The following examples demonstrate how `rprintf` functions works. You should be familiar with how `sprintf` works first. See the [documentation](http://stat.ethz.ch/R-manual/R-devel/library/base/html/sprintf.html) for more details.

### C-style formatting


```r
library(rprintf)
rprintf("Hello, %s", "world")
```

```
[1] "Hello, world"
```

```r
rprintf("%s (%d years old)", "Ken", 24)
```

```
[1] "Ken (24 years old)"
```

```r
rprintf("He is %d but has a height of %.1fcm", 18, 190)
```

```
[1] "He is 18 but has a height of 190.0cm"
```

### Number-based formatting


```r
rprintf("Hello, {1}", "world")
```

```
[1] "Hello, world"
```

```r
rprintf("{1} ({2} years old)","Ken",24)
```

```
[1] "Ken (24 years old)"
```

```r
rprintf("He is {1} but has a height of {2:.2f}cm",18,190)
```

```
[1] "He is 18 but has a height of 190.00cm"
```

```r
rprintf("{1}, {2:.1f}, {3:+.2f}, {2}, {1:.0f}",1.56,2.34,3.78)
```

```
[1] "1.56, 2.3, +3.78, 2.34, 2"
```

```r
rprintf("{2},{1}","x","y")
```

```
[1] "y,x"
```

### Variable-based formatting


```r
rprintf("Hello, $name", name="world")
```

```
[1] "Hello, world"
```

```r
rprintf("$name ($age years old)",name="Ken",age=24)
```

```
[1] "Ken (24 years old)"
```

```r
rprintf("He is $age but has a height of $height:.2fcm",age=18,height=190)
```

```
[1] "He is 18 but has a height of 190.00cm"
```

```r
rprintf("$a, $b:.1f, $c:+.2f, $b, $a:.0f",a=1.56,b=2.34,c=3.78)
```

```
[1] "1.56, 2.3, +3.78, 2.34, 2"
```

For each type of formatting, a specialized function is also provided. `rprintv` only handles named variable-based formatting, and `rprintn` only handles number-based formatting.

## License

This package is under [MIT License](http://opensource.org/licenses/MIT).
