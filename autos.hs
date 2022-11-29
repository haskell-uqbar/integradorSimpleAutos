data Auto = UnAuto {
    combustible :: Int, 
    capacidad:: Int, 
    seguridad :: Int
    } deriving Show

--- punto 1 ---

calculoVelocidad :: Auto -> Int
calculoVelocidad auto = (100-combustible auto) * (seguridad auto)

--- punto 2 ---

llenarTanque :: Auto -> Auto
llenarTanque auto = auto {combustible = capacidad auto}

reparacionDeterminada :: String -> Auto -> Auto
reparacionDeterminada reparacion auto = auto {seguridad = porcentaje (seguridad auto) (length reparacion)}

porcentaje :: Int -> Int -> Int 
porcentaje base porc = base + (div (base * porc) 100)

--- punto 3 ---

data Repuesto = UnRepuesto {
    descripcion::String,
    magnitud::Int
    } deriving Show

mantenimientoGeneral :: [Repuesto] -> Auto -> Auto
mantenimientoGeneral repuestos =  cargarCombustible (head repuestos) . repuestoTanque repuestos . repuestoSeguridad (last repuestos) 

repuestoSeguridad :: Repuesto -> Auto -> Auto
repuestoSeguridad repuesto auto = auto { seguridad = porcentaje (seguridad auto) (magnitud repuesto) }

repuestoTanque :: [Repuesto] -> Auto -> Auto
repuestoTanque repuestos auto 
    | hayTanque repuestos = sustituir (buscarTanque repuestos) auto
    | otherwise = auto

hayTanque :: [Repuesto] -> Bool
hayTanque repuestos = any esTanque repuestos

buscarTanque:: [Repuesto] -> Repuesto
buscarTanque repuestos = head (filter esTanque repuestos) 

esTanque :: Repuesto -> Bool
esTanque repuesto = descripcion repuesto == "tanque"
-- esTanque = (=="tanque").descripcion

sustituir :: Repuesto -> Auto -> Auto
sustituir tanque auto = auto {combustible = 0, capacidad = magnitud tanque}

cargarCombustible :: Repuesto -> Auto -> Auto
cargarCombustible repuesto auto = auto { combustible = combustible auto + magnitud repuesto}

--- punto 4 --- 
 
diferenciaEnSeguridad:: (Auto -> Auto) -> Auto -> Int
diferenciaEnSeguridad mantenimiento auto = seguridad (mantenimiento auto) - seguridad auto

diferenciaEn:: (Auto -> Int) -> (Auto -> Auto) -> Auto -> Int
diferenciaEn caracteristica mantenimiento auto = caracteristica (mantenimiento auto) - caracteristica auto
