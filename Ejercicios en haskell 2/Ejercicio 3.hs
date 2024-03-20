type Nota = Int
type Calificacion = String

-- Convierte una nota numérica en una calificación cualitativa.
notaACalificacion :: Nota -> Calificacion
notaACalificacion nota
    | nota >= 95 = "Excelente"
    | nota >= 85 = "Notable"
    | nota >= 75 = "Bueno"
    | nota >= 70 = "Suficiente"
    | otherwise = "Desempeno Insuficiente"

-- Convierte una lista de notas en una lista de calificaciones correspondientes.
notasACalificaciones :: [Nota] -> [Calificacion]
notasACalificaciones = map notaACalificacion

-- Ejemplo de uso:
main :: IO ()
main = do
    let notas = [95, 65, 82, 74, 89]
    putStrLn "Lista de notas:"
    print notas
    putStrLn "Lista de calificaciones correspondientes:"
    print (notasACalificaciones notas)
