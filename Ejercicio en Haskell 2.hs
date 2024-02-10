-- Define una función genérica para aplicar cualquier función dada a todos los elementos de una lista.
aplicarAFuncion :: (a -> b) -> [a] -> [b]
aplicarAFuncion = map 

-- Función que multiplica por dos el valor de entrada.
doble :: Int -> Int
doble = (* 2)

-- Función que eleva al cuadrado el valor de entrada.
cuadrado :: Int -> Int
cuadrado = (^ 2)

-- Punto de entrada principal del programa.
main :: IO ()
main = do
    let valores = [2, 4, 6, 8, 10] 
    putStrLn "Lista:"
    print valores 
    
    putStrLn "Valor al doble:"
    print $ aplicarAFuncion doble valores 
    
    putStrLn "Valor al cuadrado:"
    print $ aplicarAFuncion cuadrado valores 
