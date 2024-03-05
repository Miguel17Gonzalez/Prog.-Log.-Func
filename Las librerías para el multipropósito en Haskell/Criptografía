import Crypto.Cipher.AES
import Crypto.Random
-- Función para encriptar un mensaje utilizando AES
encryptAES :: Key -> IV -> String -> String
encryptAES key iv plaintext =
 let cipher = initAES key
 encrypted = encryptCBC cipher iv (pad plaintext)
 in unpad encrypted
-- Función para desencriptar un mensaje utilizando AES
decryptAES :: Key -> IV -> String -> String
decryptAES key iv ciphertext =
 let cipher = initAES key
 decrypted = unpad (decryptCBC cipher iv ciphertext)
 in decrypted
-- Función auxiliar para agregar padding al texto plano
pad :: String -> String
pad text = text ++ replicate (16 - length text mod 16) '\0'
-- Función auxiliar para eliminar el padding del texto desencriptado
unpad :: String -> String
unpad text = let n = length text - 1 in take (n - fromEnum (last text)) text
-- Función principal
main :: IO ()
main = do
 -- Generar una clave aleatoria
 gen <- newGenIO :: IO SystemRandom
 let (key, _) = genBytes 16 gen
 -- Generar un vector de inicialización aleatorio
 let (iv, _) = genBytes 16 gen
 let plaintext = "Mensaje secreto"
 ciphertext = encryptAES key iv plaintext
 putStrLn $ "Texto encriptado: " ++ ciphertext
 let decryptedText = decryptAES key iv ciphertext
 putStrLn $ "Texto desencriptado: " ++ decryptedText
