import System.IO

-- Definiciones básicas de números y decenas
basicNumbersList :: [String]
basicNumbersList = ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten",
                    "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]

tensList :: [String]
tensList = ["Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]

-- Función auxiliar para convertir números a palabras
numberToWords :: Int -> String
numberToWords n
  | n >= 0 && n <= 19 = basicNumbersList !! n
  | n >= 20 && n < 100 = tensList !! (n `div` 10 - 2) ++ if n `mod` 10 /= 0 then "-" ++ basicNumbersList !! (n `mod` 10) else ""
  | n == 100 = "One Hundred"
  | otherwise = "Número fuera de rango"

-- Función FizzBuzz con estructura simplificada
fizzBuzz :: Int -> String
fizzBuzz n
  | n `mod` 15 == 0 = "FizzBuzz!"
  | n `mod` 3 == 0 = "Buzz!"
  | n `mod` 5 == 0 = "Fizz!"
  | otherwise = numberToWords n

-- Función principal simplificada
main :: IO ()
main = do
  putStrLn "Ingrese un número entre 0 y 100:"
  input <- getLine
  let number = read input :: Int
  putStrLn $ if number >= 0 && number <= 100 then fizzBuzz number else "El número está fuera de rango."
