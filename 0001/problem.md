# Problem summary

## Input

Input will consist of up to 100 lines of numbers - all decimal numbers
between 0.0 and 10,000,000.0 (inclusive).  The `compute` executable or
`compute.py` script must also accept two numerical arguments provided on
the command line.

The first argument will be referred as a `threshold` value. It will be a number
between 0.0 and 1,000,000,000.0 (inclusive).

The second argument will be referred to as the `limit` value. It will also be
between 0.0 and 1,000,000,000.0 (inclusive).

How to produce output from this input is described below.

## Output

The program __must only output numbers__.  Every line of output must contain
one (and only one) numerical value.  Do not output anything other than what
is required.  One number will be written for every number accepted via standard
input.  One extra number will be written at the very end, as explained below.

Since there are up to 100 lines of input (0 <= n <= 100), there will therefore
be n+1 lines of output expected from a valid solution.  The last line of output
(line n+1) will be a value that represents the cumulative sum of all the values
previously written.  The preceding output values will depend on the arguments,
which will be used to transform the input into the output.

### Example

Command line:

    # compute threshold limit
    compute 1000 20000000

Standard input:

    19.0
    0.0
    1000
    1001.5
    20000
    25000000.0

Standard output:

    0.0
    0.0
    0.0
    1.5
    19000.0
    19980998.5
    20000000.0


## Explanation

Given the `n` inputs, outputs `1..n` will be produced based on these values,
taking into account the `threshold` and `limit` arguments.

The `threshold` argument will be used to modify every input so that if the input
amount is greater than the threshold, the output amount will be the portion of
the input value that exceeds the threshold. If the input is less than the
threshold, the output should be zero. Put another way, the output value
will be the larger of 0.0 or the value of `[input] - [threshold]`.

The `limit` amount serves to further constrain the output values. The cumulative
sum of of all `n` outputs must never exceed this value, however the individual
output values must be maximized in the order they are given without breaking the
rules imposed by `threshold` and `limit`.

After all inputs are processed, output value `n+1` will be written. It must be
equal to the sum of all `n` output values. It follows from the rules above that
output `n+1` must always be less than or equal to the `limit` argument
specified.


## Additional examples

### `Threshold`

The `threshold` argument works to modify each input value as explained above.
This table demonstrates handling of individual inputs given specific threshold
values, but is not a complete example.


| input | threshold | output |
|------:|----------:|-------:|
| 0.0   | 0.0       | 0.0    |
| 10.0  | 0.0       | 10.0   |
| 0.0   | 10.0      | 0.0    |
| 5.0   | 10.0      | 0.0    |
| 10.0  | 5.0       | 5.0    |
| 20.0  | 5.0       | 15.0   |


### `Limit`
The `limit` argument works to modify inputs on an aggregate basis.  The easiest
way to illustrate this is to assume a `threshold` of `0.0` and demonstrate the
effect.  This is a complete example which includes the `n+1` "sum" output.

__threshold == 0.0; limit == 100.0__

| input | output    |
|------:|----------:|
| 0.0   | 0.0       |
| 10.0  | 10.0      |
| 50.0  | 50.0      |
| 50.0  | __40.0__  |
| 10.0  | 0.0       |
| 20.0  | 0.0       |
|       | __100.0__ |

__Note:__ The cumulative sum of the first four inputs after applying the threshold
has exceeded the limit, thus the fourth output is `40.0` to ensure maximum output
values while respecting the `limit` argument.


__threshold == 0.0; limit == 0.0__

| input | output |
|------:|-------:|
| 0.0   | 0.0    |
| 10.0  | 0.0    |
| 20.0  | 0.0    |
|       | 0.0    |


## Important considerations worth noting/repeating

* Input lines will consist of decimal or integer numbers (i.e. The input numbers will be separated by newline characters).
* The output should consist of `n+1` lines, each containing one number.
* Decimal precision must be accurate to the tenths place.
  Inputs will not have precision beyond the tenths place, so rounding should be unnecessary.
  If any rules around input/output precision are ambiguous, feel free to state your assumptions in code comments.
  