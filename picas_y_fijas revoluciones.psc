
	Funcion resultado <- calcularFijas(unidad,decena,centena,mil,uno,dos,tres,cuatro)
		resultado = 0
		
		Si unidad==cuatro Entonces
			resultado = resultado + 1
		FinSi
		
		Si decena==tres Entonces
			resultado = resultado + 1
		FinSi
		
		Si centena==dos Entonces
			resultado = resultado + 1
		FinSi
		
		Si mil==uno Entonces
			resultado = resultado + 1
		FinSi
FinFuncion


Funcion resultado <- calcularPicas(unidad,decena,centena,mil,uno,dos,tres,cuatro)
	resultado = 0
	
	Si (unidad==tres)o(unidad==dos)o(unidad==uno) Entonces
		resultado = resultado + 1
	FinSi
	
	Si (decena==cuatro)o(decena==dos)o(decena==uno) Entonces
		resultado = resultado + 1
	FinSi
	
	Si (centena==cuatro)o(centena==tres)o(centena==uno) Entonces
		resultado = resultado + 1
	FinSi
	
	Si (mil==cuatro)o(mil==tres)o(mil==dos) Entonces
		resultado = resultado + 1
	FinSi
FinFuncion
Algoritmo picas_y_fijas
	
	//numero_secreto 
	uno <- azar(10)
	
	dos <- azar(10)
	Mientras (uno==dos) Hacer
		dos <- azar(10)
	FinMientras
	
	tres <- azar(10)
	Mientras (tres == uno) o (tres == dos) Hacer
		tres <- azar(10)
	FinMientras
	
	cuatro <- azar(10)
	Mientras (cuatro == tres) o (cuatro == dos) o (cuatro == uno) Hacer
		cuatro <- azar(10)
	FinMientras
	
	//Escribir uno, dos, tres, cuatro
	
	//Entrada e interacción del usuario
	Escribir "------------------------------------------------------Picas y fijas------------------------------------------------------"
	Escribir "Número secreto generado. Ingrese su suposición de 4 dígitos. No se pueden repetir dígitos. Intentos máximos: 12"
	
	contador_suposiciones=0
	
	
	Mientras contador_suposiciones<12 y Fijas<>4 Hacer
		
		//Aquí se divide el número en dígitos
		Leer suposicion
		
		calculo = suposicion
		
		unidad = calculo MOD 10
		calculo = (calculo - unidad) / 10
		
		decena = calculo MOD 10
		calculo = (calculo - decena) / 10
		
		centena = calculo MOD 10 
		
		mil = (calculo - centena) / 10 
		
		Si (unidad<>decena)y(unidad<>centena)y(unidad<>mil)y(decena<>centena)y(decena<>mil)y(centena<>mil)y(mil<=9)y(mil>=1) Entonces
			
			contador_suposiciones = contador_suposiciones + 1
			
			Escribir "Suposicion " ,contador_suposiciones,":"," Mil: " ,mil, " Centena: " ,centena, " Decena: " ,decena, " Unidad: " ,unidad
			
			Fijas = calcularFijas(unidad,decena,centena,mil,uno,dos,tres,cuatro)
			
			Escribir "Tus fijas:",Fijas
			
			Picas = calcularPicas(unidad,decena,centena,mil,uno,dos,tres,cuatro)
			
			Escribir "Tus Picas: ", Picas
			
		SiNo
			Escribir "Número no válido. Ingrese 4 dígitos sin repetir"
		FinSi
		
		
		Si contador_suposiciones == 12 Entonces
			Escribir "Juego finalizado. Último intento detectado. Muy mal, este juego no es para ti"
		FinSi
		
		
		Si Fijas == 4  y contador_suposiciones < 2 Entonces
			Escribir "Has ganado. ¡Excelente!, ¡Eres un maestro estas fuera del alcance de los demás!"
		FinSi
		
		
		Si Fijas == 4 y contador_suposiciones >= 2  y contador_suposiciones < 4 Entonces
			Escribir "Muy bueno, ¡puedes ser un gran competidor!"
		FinSi
		
		
		Si Fijas == 4 y contador_suposiciones >= 5 y contador_suposiciones < 8 Entonces
			Escribir "Bien, estas progresando debes buscar tus límites"
		FinSi
		
		
		Si Fijas == 4 y contador_suposiciones >= 8 y contador_suposiciones < 10 Entonces
			Escribir "Regular, Aún es largo el camino por recorrer"
		FinSi
		
	FinMientras
FinAlgoritmo
