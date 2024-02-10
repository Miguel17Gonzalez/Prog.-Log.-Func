import Prelude

type Vector2 = (Float, Float)
type Vector3 = (Float, Float, Float)

-- Función para calcular el módulo de un vector 2.
moduloVector2 :: Vector2 -> Float
moduloVector2 (x, y) = sqrt (x^2 + y^2)

-- Función para calcular el módulo de un vector 3.
moduloVector3 :: Vector3 -> Float
moduloVector3 (x, y, z) = sqrt (x^2 + y^2 + z^2)

-- Función principal que demuestra el cálculo del módulo de los vectores.
main :: IO ()
main = do
    -- Define y calcula el módulo de un vector 2.
    let vector2 = (8,11)
    putStrLn $ "El módulo del vector 2 " ++ show vector2 ++ " es " ++ show (moduloVector2 vector2)

    -- Define y calcula el módulo de un vector 3.
    let vector3 = (2, 7, 5)
    putStrLn $ "El módulo del vector 3 " ++ show vector3 ++ " es " ++ show (moduloVector3 vector3)