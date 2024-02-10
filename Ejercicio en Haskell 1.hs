type Costo = Float
type Porcentaje = Float 
type Producto = (Costo, Porcentaje)
type Cesta = [Producto] 

-- Aplica un descuento a un costo dado, basado en un porcentaje de descuento.
aplicarRebaja :: Costo -> Porcentaje -> Costo
aplicarRebaja costo descuento = costo * (1 - descuento / 100)

-- Aplica IVA a un costo dado, basado en un porcentaje de IVA.
aplicarImpuesto :: Costo -> Porcentaje -> Costo
aplicarImpuesto costo iva = costo * (1 + iva / 100)

-- Procesa la cesta de compras, aplicando una función específica (descuento o IVA) a cada producto.
-- Devuelve el costo total ajustado de toda la cesta.
evaluarCesta :: Cesta -> (Costo -> Porcentaje -> Costo) -> Costo
evaluarCesta cesta operacion = foldr (\(costo, porcentaje) acumulado -> operacion costo porcentaje + acumulado) 0 cesta

main :: IO ()
main = do
    -- Ejemplo de cesta con productos a los que se les aplicará un descuento.
    let cestaRebajas = [(150, 5), (250, 15)] :: Cesta
    -- Ejemplo de cesta con productos a los que se les aplicará IVA.
    let cestaIVA = [(150, 19), (250, 19)] :: Cesta
    
    -- Imprime el costo total de la cesta después de aplicar descuentos.
    putStrLn $ "Costo total después de rebajas: " ++ show (evaluarCesta cestaRebajas aplicarRebaja)
    -- Imprime el costo total de la cesta después de aplicar IVA.
    putStrLn $ "Costo total después de impuestos: " ++ show (evaluarCesta cestaIVA aplicarImpuesto)
