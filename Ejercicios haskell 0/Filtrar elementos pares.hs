paresFiltrados :: [Int] -> [Int]
paresFiltrados = filter even

main :: IO ()
main = do
    putStrLn "Numeros separados por espacios: "
    input <- getLine
    let num = map read $ words input :: [Int]
    putStrLn "Numeros pares resultantes: "
    print (paresFiltrados num)
