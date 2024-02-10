-- Calcula el promedio de una lista de números.
promedio :: [Float] -> Float
promedio xs = sum xs / fromIntegral (length xs)

-- Calcula la desviación de una lista de números.
desviacion :: [Float] -> Float
desviacion xs =
  let prom = promedio xs
      sumaCuadrados = sum [ (x - prom) ** 2 | x <- xs ]
      n = fromIntegral (length xs)
  in sqrt (sumaCuadrados / n)

-- Calcula la puntuación Tip de un valor en la muestra.
puntuacionTip :: Float -> [Float] -> Float
puntuacionTip x xs =
  let prom = promedio xs
      desv = desviacion xs
  in (x - prom) / desv

-- Filtra y devuelve los valores Atípicos de una muestra.
valoresAtip :: [Float] -> [Float]
valoresAtip xs =
  filter (\x -> let z = puntuacionTip x xs in z < -3 || z > 3) xs

-- Ejemplo de uso
main :: IO ()
main = do
  let muestra = [5, 10, 20, 22, 35, 17, 18, 50, 65, 11]
  putStrLn "Números:"
  print muestra
  putStrLn "Valores Atípicos:"
  print (valoresAtip muestra)

