fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

main :: IO ()
main = do
    putStrLn "Numero a introducir: "
    input <- getLine
    let indice = read input :: Int
    putStrLn ("El " ++ show indice ++ "-esimo numero de Fibonacci es: " ++ show (fibonacci indice))