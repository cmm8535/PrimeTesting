Why I wrote this: 

I was messing a round with trying to find patterns in prime numbers, and I found a pattern in particular 
I found to be weird. This pattern was that some prime numbers (such as 5 and 7) seemed to have a pretty
good chance of generating primes out of numbers above them if the number was converted to the prime base, the
digits are flipped, and then converted back into base 10 (the last part is irrelevent for determining primality,
but it makes it easier to read). The main point of this program was to calculate how many times this would happen
in a range given a certian base. Currently the program doesn't do everything I've been wanting to test (for example
disregarding primes who generate themselves in a base, the proportion of successes for composite numbers whose
prime factors are above the base, etc.).

How to use:

Load the file into a Haskell interpreter, read the code to see what functions are available (currently there
are no comments, so understanding the point of everything might be a pain), and use the functions as you see fit.
