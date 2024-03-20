type Asignatura = String
type Nota = Int
type Calificacion = String
type Registro = [(Asignatura, Nota)]

-- Función para convertir una cadena a mayúsculas
toUpper' :: String -> String
toUpper' = map (\c -> if c >= 'a' && c <= 'z' then toEnum (fromEnum c - 32) else c)

-- Convierte una nota numérica en una calificación cualitativa.
notaACalificacion :: Nota -> Calificacion
notaACalificacion nota
    | nota >= 95 = "Excelente"
    | nota >= 85 = "Notable"
    | nota >= 75 = "Bueno"
    | nota >= 70 = "Suficiente"
    | otherwise = "Desempeno Insuficiente"

-- Transforma el nombre de una asignatura a mayúsculas.
asignaturaEnMayusculas :: Asignatura -> Asignatura
asignaturaEnMayusculas = toUpper'

-- Procesa el registro académico, convirtiendo nombres de asignaturas a mayúsculas y notas a calificaciones.
procesarRegistro :: Registro -> [(Asignatura, Calificacion)]
procesarRegistro registro = map (\(asignatura, nota) -> (asignaturaEnMayusculas asignatura, notaACalificacion nota)) registro

-- Punto de entrada principal del programa para demostración.
main :: IO ()
main = do
    let registroAcademico = [("Algebra", 95), ("Geografia", 65), ("Quimica", 82), ("Arte", 74), ("Historia", 89)]
    putStrLn "Registro Académico:"
    print registroAcademico
    putStrLn "Registro Académico Evaluado:"
    print (procesarRegistro registroAcademico)
