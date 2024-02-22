listaReversa :: [a] -> [a]
listaReversa [] = []
listaReversa (x:xs) = listaReversa xs ++ [x]

main :: IO ()
main = do
    putStrLn "Numeros separados por espacios: "
    input <- getLine
    let num = map read $ words input :: [Int]
    print (listaReversa num)