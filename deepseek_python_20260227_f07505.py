import numpy as np

def pivotaje_parcial_escalado(A, b):
    """
    Implementación del método de pivotaje parcial escalado
    """
    n = len(b)
    # Convertir a float para evitar problemas
    A = A.astype(float)
    b = b.astype(float)
    
    # Crear matriz aumentada
    M = np.column_stack([A, b])
    
    # Paso 1: Calcular factores de escala s_i
    s = np.max(np.abs(A), axis=1)
    
    # Verificar si algún s_i es cero (posible problema)
    if np.any(s == 0):
        print("Advertencia: Hay filas con todos ceros")
    
    for k in range(n-1):
        # Paso 2: Encontrar fila pivote usando criterio escalado
        max_ratio = 0
        max_row = k
        
        for i in range(k, n):
            if s[i] != 0:  # Evitar división por cero
                ratio = abs(M[i, k]) / s[i]
                if ratio > max_ratio:
                    max_ratio = ratio
                    max_row = i
        
        # Paso 3: Intercambiar filas si es necesario
        if max_row != k:
            M[[k, max_row]] = M[[max_row, k]]
            s[[k, max_row]] = s[[max_row, k]]
        
        # Paso 4: Eliminación (hacer ceros debajo del pivote)
        for i in range(k+1, n):
            if M[k, k] != 0:  # Evitar división por cero
                factor = M[i, k] / M[k, k]
                M[i, k:] = M[i, k:] - factor * M[k, k:]
    
    return M