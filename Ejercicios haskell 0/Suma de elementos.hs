sumarLista :: [Int] -> Int
sumarLista [] = 0 
sumarLista (x:xs) = x + sumarLista xs 

main :: IO ()
main = do

    let lista1 = [6, 7, 8, 9, 10] 
    let lista2 = [15, 25, 35]    
    let lista3 = [-5, 5, -10, 10] 

    print (sumarLista lista1) 
    print (sumarLista lista2) 
    print (sumarLista lista3) 
