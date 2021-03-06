context("rprintv: variable-based formatting")

test_that("rprintv works as expected", {
    expect_equivalent(rprintv("$name:s", name = "a"), "a")
    expect_equivalent(rprintv("$num:d", num = 10), "10")
    expect_equivalent(rprintv("$pi:.2f", pi = pi), "3.14")
    expect_equivalent(rprintv("$pi:+.2f", pi = pi), "+3.14")
    expect_equivalent(rprintv("$pi: .2f", pi = pi), " 3.14")
    expect_equivalent(rprintv("$name1:s,$name", name = "a", name1 = "b"), "b,a")
    expect_equivalent(rprintv("$a,$b:s,$c:.2f,$b,$a", a = "a", b = "b", c = 1.4), "a,b,1.40,b,a")
    expect_equivalent(rprintv("$$name", name = "a"), "$name")
    expect_equivalent(rprintv("$x,$y", x = 1, y = 2), "1,2")

    p <- list(name = "Ken", age = 25)
    expect_equivalent(rprintv("$name $age", p), "Ken 25")

    name <- "test1"
    expect_equivalent(rprintv("$name $age", name = "test0", age = 0), "test0 0")
    expect_equivalent(rprintv("$name $age", age = 10), "test1 10")

    e <- new.env()
    e$age <- 20
    expect_equivalent(rprintv("$name $age", .envir = e), "test1 20")

    expect_error(rprintv("$age"))
})
