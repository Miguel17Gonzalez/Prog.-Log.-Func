filtrarPorCondicion' :: (a -> Bool) -> [a] -> [a]
filtrarPorCondicion' _ [] = []
filtrarPorCondicion' condicion (x:xs)
    | condicion x = x : filtrarPorCondicion' condicion xs
    | otherwise = filtrarPorCondicion' condicion xs

-- Ejemplo de uso:
main :: IO ()
main = do
    let listaNumeros = [-3, 4, -9, 12, -5, 6, 7, -8, 0, 10]
    let listaPositivos = filtrarPorCondicion' (\x -> x >= 0) listaNumeros -- Filtrar los números positivos
    let listaPares = filtrarPorCondicion' (\x -> x `mod` 2 == 0) listaNumeros -- Filtrar los números pares
    let listaCadenas = ["Hola", "Mundo", "de", "la", "Programacion", "Funcional"]
    let listaLargoMayorA3 = filtrarPorCondicion' (\s -> length s > 3) listaCadenas -- Filtrar las cadenas con longitud mayor a 3
    putStrLn "Lista de números:"
    print listaNumeros
    putStrLn "Lista filtrada de números positivos:"
    print listaPositivos
    putStrLn "Lista filtrada de números pares:"
    print listaPares
    putStrLn "Lista de cadenas:"
    print listaCadenas
    putStrLn "Lista filtrada de cadenas con longitud mayor a 3:"
    print listaLargoMayorA3
