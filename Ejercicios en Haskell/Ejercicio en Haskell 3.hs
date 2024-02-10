import Data.List (nub)
import Data.Char (isSpace, isPunctuation)

-- Texto.
prepararTexto :: String -> String
prepararTexto texto = filter (\c -> not (isPunctuation c) || c == '\'') texto

-- Separa el texto limpio en palabras.
extraerPalabras :: String -> [String]
extraerPalabras = words . prepararTexto

-- Asocia cada palabra única con su longitud.
analizarPalabras :: [String] -> [(String, Int)]
analizarPalabras palabras = map (\palabra -> (palabra, length palabra)) $ nub palabras

-- Procesa el texto para analizar y mostrar las palabras y sus longitudes.
procesarTexto :: String -> [(String, Int)]
procesarTexto = analizarPalabras . extraerPalabras

-- Función principal para demostración.
main :: IO ()
main = do
    let texto = "Hola a todos, El clima esta genial."
    putStrLn "Texto original:"
    putStrLn texto
    putStrLn "Análisis de palabras y longitudes:"
    print $ procesarTexto texto
