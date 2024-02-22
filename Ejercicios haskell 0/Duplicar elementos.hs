elemDuplicados :: [Int] -> [Int]
elemDuplicados = map (*2)

main :: IO ()
main = do
    putStrLn "Numeros separados por espacio: "
    input <- getLine
    let num = map read $ words input :: [Int]
    putStrLn "duplicados: "
    print (elemDuplicados num)
