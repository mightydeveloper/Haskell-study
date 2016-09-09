{-# OPTIONS_GHC -Wall #-}
module HW01 where

-- Exercise 1 -----------------------------------------

-- Get the last digit from a number
lastDigit :: Integer -> Integer
lastDigit n = mod n 10

-- Drop the last digit from a number
dropLastDigit :: Integer -> Integer
dropLastDigit n = quot n 10

-- Exercise 2 -----------------------------------------

toRevDigits :: Integer -> [Integer]
toRevDigits 0 = []
toRevDigits n
    | n <= 0    = []
    | otherwise = (lastDigit n) : toRevDigits (dropLastDigit n)

-- Exercise 3 -----------------------------------------

-- Double every second number in a list starting on the left.
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther (x:[]) = [x]
doubleEveryOther (x:y:rest) = (x:2*y:doubleEveryOther rest)

-- Exercise 4 -----------------------------------------

-- Calculate the sum of all the digits in every Integer.
sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (x:rest) = (lastDigit x) + (dropLastDigit x) + (sumDigits rest)


-- Exercise 5 -----------------------------------------

-- Validate a credit card number using the above functions.
luhn :: Integer -> Bool
luhn n = (lastDigit (sumDigits (doubleEveryOther (toRevDigits n)))) == 0

-- Exercise 6 -----------------------------------------

-- Towers of Hanoi for three pegs
type Peg = String
type Move = (Peg, Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 1 a b c = [(a,b)]
hanoi n a b c = (hanoi (n-1) a c b) ++ (hanoi 1 a b c) ++ (hanoi (n-1) c b a)





