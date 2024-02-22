numPares :: Int -> [Int]
numPares n = [x | x <- [1..n], x `mod` 2 == 0]

main :: IO ()
main = do
    putStrLn "Número: "
    input <- getLine
    let numero = read input :: Int
    print (numPares numero)