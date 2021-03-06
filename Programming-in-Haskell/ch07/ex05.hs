-- Using merge, define a recursive function `msort` that implements merge sort,
-- in which the empty list and lists with one element are already sorted, and
-- any other list is sorted by merging together the two lists that result from
-- sorting the two halves of the list separately.

merge ::  Ord a => [a] -> [a] -> [a]
merge [] xs = xs
merge xs [] = xs
merge (x : xs) (y : ys)
    | x < y = x : merge xs (y : ys)
    | otherwise = y : merge (x : xs) ys


halve :: [a] -> ([a], [a])
halve xs = splitAt n xs
    where n = div (length xs) 2


msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort left) (msort right)
    where (left, right) = halve xs


main :: IO ()
main = print (msort [2,5,6,1,3,4,0])
