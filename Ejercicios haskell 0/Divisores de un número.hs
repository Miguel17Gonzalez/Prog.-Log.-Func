divisores :: Int -> [Int]
divisores n = [x | x <- [1..n], n `mod` x == 0]

main :: IO ()
main = do
    putStrLn "Numero a introducir: "
    numeroStr <- getLine
    let num = read numeroStr :: Int
    let divisoresNum = divisores num
    putStrLn $ "Los divisores de " ++ show num ++ " son: " ++ show divisoresNum
