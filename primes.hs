isPrime :: Int -> Bool
isPrime n = if n==1 then False else
    let 
        check :: Int -> Int -> Bool 
        check _ 1 = True
        check n d = ((mod n d) /= 0) && (check n (d-1))
    in check n (n-1)

primes :: Int -> [Int]
primes n = if isPrime n then n:(primes (n+1)) else primes (n+1)

primeFactor :: Int -> [Int]
primeFactor n = if n==1 then [] else
    let
        divideAll :: Int -> Int -> Int
        divideAll n d = if (mod n d) == 0 then divideAll (div n d) d else n
        check :: Int -> Int -> Int -> [Int]
        check n d r
            | (n == d) = []
            | (r == 1) = []
            | ((mod r d) == 0) = d:(check n (d+1) (divideAll r d))
            | otherwise = check n (d+1) r
    in check n 2 n

toBase :: Int -> Int -> ([Int],Int)
toBase n b =
    let lst :: Int -> [Int] -> [Int]
        lst x y = if x==0 then y else lst (div x b) ((mod x b):y) in (lst n [],b)

fromBase :: ([Int],Int) -> Int
fromBase (l,b) =
    let rtn :: [Int] -> Int -> Int
        rtn [] r = r
        rtn (x:xs) r = rtn xs ((r*b)+x)
    in rtn l 0

revDgts :: ([Int],Int) -> ([Int],Int)
revDgts (l,b) =
    let rev :: [Int] -> [Int] -> [Int]
        rev [] r = r
        rev (x:xs) r = rev xs (x:r)
    in (rev l [],b)

transform :: Int -> Int -> Int
transform n b = fromBase (revDgts (toBase n b))

tester :: [Int] -> Int -> (Int,Int)
tester l b =
    let test :: [Int] -> (Int,Int) -> (Int,Int)
        test [] r = r
        test (x:xs) (s,t)
            | isPrime (transform x b) = test xs (s+1,t+1)
            | otherwise = test xs (s,t+1)
    in test l (0,0)

testNPrimesAfterB :: Int -> Int -> (Int,Int)
testNPrimesAfterB n b = 
    let nextPrimes :: [Int] -> [Int]
        nextPrimes (x:xs) = if b<x then x:xs else nextPrimes xs
    in tester (take n (nextPrimes (primes 2))) b
