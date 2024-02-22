factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main = do
  let n = 6 -- Número para calcular el factorial
  putStrLn ("El factorial de " ++ show n ++ " es: " ++ show (factorial n))

