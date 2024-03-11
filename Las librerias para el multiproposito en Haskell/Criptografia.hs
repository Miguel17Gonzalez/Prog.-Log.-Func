{-# LANGUAGE OverloadedStrings #-}

import Crypto.Cipher.AES (AES256)
import Crypto.Cipher.Types (BlockCipher(..), Cipher(..), IV, makeIV)
import Crypto.Error (CryptoFailable(..))
import Crypto.Random (getRandomBytes)
import Data.ByteArray (Bytes)
import Data.ByteString (ByteString)
import qualified Data.ByteString.Char8 as C8

-- Función para inicializar el cifrador AES
initAES :: ByteString -> CryptoFailable AES256
initAES key = cipherInit key

-- Función para agregar padding al texto plano
pad :: ByteString -> ByteString
pad bs = bs `C8.append` C8.replicate (16 - C8.length bs `mod` 16) '\0'

-- Función para eliminar el padding del texto desencriptado
unpad :: ByteString -> ByteString
unpad bs = C8.take (C8.length bs - (fromEnum $ C8.last bs)) bs

-- Función para encriptar un mensaje utilizando AES
encryptAES :: ByteString -> IV AES256 -> ByteString -> ByteString
encryptAES key iv plaintext =
  case initAES key of
    CryptoPassed cipher ->
      let plaintextPadded = pad plaintext
      in ecbEncrypt cipher plaintextPadded
    CryptoFailed error -> error "Cifrado fallido"

-- Función para desencriptar un mensaje utilizando AES
decryptAES :: ByteString -> IV AES256 -> ByteString -> ByteString
decryptAES key iv ciphertext =
  case initAES key of
    CryptoPassed cipher -> unpad $ ecbDecrypt cipher ciphertext
    CryptoFailed error -> error "Descifrado fallido"

main :: IO ()
main = do
  -- Generar una clave aleatoria
  key <- getRandomBytes 32 :: IO ByteString
  -- Generar un vector de inicialización aleatorio
  iv <- getRandomBytes 16 :: IO ByteString
  let plaintext = "Mensaje secreto"
      ciphertext = encryptAES key (maybe (error "IV inválido") id $ makeIV iv) (C8.pack plaintext)
  putStrLn $ "Texto encriptado: " ++ C8.unpack ciphertext
  let decryptedText = decryptAES key (maybe (error "IV inválido") id $ makeIV iv) ciphertext
  putStrLn $ "Texto desencriptado: " ++ C8.unpack decryptedText
