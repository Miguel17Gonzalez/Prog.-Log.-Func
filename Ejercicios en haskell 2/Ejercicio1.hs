calcFunc :: String -> Double -> [(Int, Double)]
calcFunc "seno" val = [(x, sin (fromIntegral x)) | x <- [1..round val]]
calcFunc "coseno" val = [(x, cos (fromIntegral x)) | x <- [1..round val]]
calcFunc "tangente" val = [(x, tan (fromIntegral x)) | x <- [1..round val]]
calcFunc "exponencial" val = [(x, exp (fromIntegral x)) | x <- [1..round val]]
calcFunc "logaritmo" val = [(x, log (fromIntegral x)) | x <- [1..round val]]
calcFunc _ _ = error "Función no válida"

impTab :: [(Int, Double)] -> IO ()
impTab tabla = mapM_ (\(indice, valor) -> putStrLn $ show indice ++ " -> " ++ show valor) tabla

main :: IO ()
main = do
    putStrLn "Calculadora Científica"
    putStrLn "Funciones disponibles: seno, coseno, tangente, exponencial, logaritmo"
    putStrLn "Ingrese la función:"
    funcion <- getLine
    putStrLn "Ingrese el valor:"
    valor <- readLn :: IO Double
    let resultado = calcFunc funcion valor
    putStrLn "Resultados:"
    impTab resultado
