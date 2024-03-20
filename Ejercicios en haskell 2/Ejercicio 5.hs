data Inmueble = Inmueble { año :: Int, metros :: Int, habitaciones :: Int, garaje :: Bool, zona :: Char, precio :: Float } deriving Show

-- Calcula el precio de un inmueble en función de sus características y la zona
calcularPrecio :: Inmueble -> Float
calcularPrecio inmueble =
    let coeficienteZona = if zona inmueble == 'A' then 1 else 1.5
        precioBase = fromIntegral (metros inmueble * 1000 + habitaciones inmueble * 5000 + if garaje inmueble then 15000 else 0)
        antiguedad = fromIntegral (2024 - año inmueble)
    in precioBase * (1 - antiguedad / 100) * coeficienteZona

-- Agrega el precio calculado a cada inmueble en la lista
agregarPrecio :: [Inmueble] -> [Inmueble]
agregarPrecio inmuebles = map (\x -> x { precio = calcularPrecio x }) inmuebles

-- Imprime un inmueble en una línea
mostrarInmueble :: Inmueble -> IO ()
mostrarInmueble inmueble = putStrLn $ show inmueble

-- Ejemplo de uso
main :: IO ()
main = do
    let inmuebles = [ Inmueble 2000 100 3 True 'A' 0,
                      Inmueble 2012 60 2 True 'B' 0,
                      Inmueble 1980 120 4 False 'A' 0,
                      Inmueble 2005 75 3 True 'B' 0,
                      Inmueble 2015 90 2 False 'A' 0 ]
        inmueblesConPrecio = agregarPrecio inmuebles
    putStrLn "Inmuebles con sus precios calculados:"
    mapM_ mostrarInmueble inmueblesConPrecio


