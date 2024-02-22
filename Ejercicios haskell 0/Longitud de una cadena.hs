longCadena :: String -> Int
longCadena cadena = length [c | c <- cadena, c /= ' ']

main :: IO ()
main = do
    putStrLn "Cadena: "
    cadena <- getLine
    putStrLn ("La longitud de la cadena es de: " ++ show (longCadena cadena))
