# Entrando a Boxes

**En las carreras, desde rally a fórmula 1, los autos requieren mantenimiento y reparaciones, antes e incluso durante la carrera.**


### Velocidad
1. Para comenzar, hay que calcular la velocidad de un auto, que se obtiene haciendo (100 - cantidad de combustible) * nivel de seguridad

### Mantenimiento
El enfoque funcional consiste en realizar ciertas actividades de mantenimiento en los autos. Entre ellos, se destacan las siguientes:
* Cargar combustible: Independientemente de cuánto combustible tenga, se completa el tanque combustible llevandolo a su capacidad máxima.
* Hacer una reparación determinada: Aumenta el nivel de seguridad del auto, en un porcentaje  igual a la cantidad de caracteres del nombre de la reparación realizada. por ejemplo, hacer la reparación "alerones" aumenta el nivel de seguridad en un 8%.

2. Definir las funciones que permitan que a un auto se le realice alguno de los mantenimientos y permita averiguar cómo quedó. 

### Arreglos profundos 
En algunas ocasiones, a un auto se le realizan tareas de mantenimiento más complejas, que implican el recambio de uno o más repuestos.

Se cuenta con la siguiente definición

``` haskell
data Repuesto = UnRepuesto {
	descripcion: String;
	magnitud: Int
} deriving Show
```

Cuando un auto se realiza mantenimiento con repuestos, pasa lo siguiente:
La seguridad aumenta en un porcentaje igual a la magnitud del último de los repuestos que se le cambian. Además, en caso que alguno de los repuestos tenga como descripcion "tanque" el tanque de combustible queda vacío y la capacidad máxima de combustible del auto pasa a ser la magnitud del tanque. Por otra parte, el mantenimiento concluye siempre agregándole al tanque tantos litros de combustible como la magnitud del primer repuesto. 

3. Lo mismo, pero para esta nueva tarea de mantenimiento. **Importante: Se debe usar la función composición para realizarlo.**
4. Explicar qué puede pasar si la lista de repuestos fuera infinita, identiticar alguna de las funciones definidas que funciene bien y otra que no.


### Mantenimiento efectivo

5. Dados una determinada tarea mantenimiento y un auto, averiguar la diferencia en el nivel de seguridad del auto entre antes y despues de realizar dicha tarea.
6. Lo mismo, pero obteniendo la diferencia en la velocidad
7. Plantear una forma más genérica de resolver los items anteriores, en la que se pase por paŕametro una determinada característica del auto a analizar su diferencia.
8. Inventar una nueva característica del auto, llamada rendimiento, con la cual se pueda también cuantificar cómo varió luego de una determinada tarea de mantenimiento

*Por ejemplo:*

``` haskell
diferenciaEn rendimiento unaFerrari cargarCombustible
5
``` 

9. Mostrar un ejemplo de aplicacion de esta función, con un arreglo profundo con un par de repuestos. (agregar en el código, como comentario, tanto la invocación como la respuesta obtenida) 
10. Justificar la utilización de aplicación parcial
