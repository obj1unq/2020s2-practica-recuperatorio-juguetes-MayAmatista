# Juguetes de Bebés

## Contexto

Un grupo de investigación de sociología está estudiando el efecto y la aceptación
de los juguetes en grupos de bebes, Por este motivo es que se nos ha encargado 
la construcción de un sistema que ayude a realizar estos cálculos. 

## Juguetes

Para esta versión sólo se tiene en cuenta los siguientes juguetes:
 
- baldecitos de cuerpos geométricos, 
- pelotas de diferentes tamaños y
- juegos de tachitos apilables. 

![Imagen de juguetes de ejemplo](juguetes.png)

Pero se sabe que en el futuro se agregarán nuevos juguetes, 
por lo tanto, se espera que su incorporación sea lo más sencilla posible.

De cada juguete interesa calcular el *costo de fabricación*, el *precio de venta* 
y su *eficacia* según se detalla en los siguientes puntos:

## Costo de fabricación de un juguete

Se pide saber el costo de un juguete

Para calcular los costos entra en juego un valor llamado _Costo por unidad de volumen_ 
(a partir de ahora lo abreviamos *CUV*). Se trata de un número que se tiene que 
poder configurar. Representa cuando cuesta un metro cúbico de volumen de un 
juguete y por lo tanto influye en estos cálculos que se describen a continuación.

- Una pelota tiene un radio que varía entre cada pelota. El costo es 3 veces 
  el radio,  multiplicado por el CUV.
  
  Por ejemplo el costo de una pelota de radio 4, suponiendo un CUV de 2 es: 
  ```
  3 * 4 * 2 = 24
  debido a:
  3 = es la cantidad de veces que hay que multiplicar el radio
  4 = es el radio
  2 = es el CUV
  ```
  
- Un *baldecito de cuerpos geométricos* tiene un costo fijo de 5 pesos 
  al cual se le suma el costo de la pieza de mayor volumen.
  El costo de una pieza se calcula como el volumen multiplicado el CUV.  
  
  Por ejemplo, el costo de un baldecito que tiene un cubo de volumen 4, y un 
  cilindro de volumen 3; y suponiendo un CUV de 2 es:

  ```
  5 + ( 2 * (4 * 2) ) = 21
  debido a que:
  5 = es el costo fijo
  2 = es la cantidad de cuerpos que tiene
  4 = es el volumen del cubo, que es el cuerpo de mayor volumen 
  2 = es el CUV
  ```   

- El costo de un *juego de tachitos apilables* se calcula muy similar al costo de
  _los baldecitos de cuerpos geométricos_, ya que todos los juegos que se componen
  por piezas se calculan de esa manera. La unica diferencia es que el costo fijo
  para este caso es siempre de 3

  Por ejemplo, un juego de 3 tachitos de volumenes 6, 5, y 4; y
  suponiendo un CUV de 2 es 
  
  ``` 
  3 + (3 * (6 * 2) ) = 39 
  
  3 = es el costo fijo
  3 = es la cantidad de tachitos que tiene
  6 = es el volumen del tachito mayor 
  2 = es el CVU
  ```
 
 _TIP:_ Evitar pensar el costo fijo de los tachitos y baldecitos como `const`. 
 Modelarlo como un método que devuelve un literal puede evitar problemas de implementación.  

## Eficacia de un juguete

La eficacia es una estimación de cuanto tiempo puede entretener un juguete a une bebe,
sin tener en cuenta de quien se trate. 

- *Pelota* la eficacia es de 12 minutos siempre (no influye el radio). 
  En el ejemplo descripto anteriormente, la eficacia es `12`.
- *Baldecito de cuerpos geométricos*: La eficacia es de 3 minutos fijos por la cantidad de cuerpos que tenga. 
  En el ejemplo descripto anteriormente, la eficacia es `3 * 2 = 6`	    
- *Juego de tachitos apilables*: La eficacia del juego completo es la sumatoria de las eficacias
 que aporta cada tachito. Cada tachito aporta una eficacia individual que es igual a su volumen 
(un tachito de volumen 6 tiene una eficacia de 6 minutos).
  En el ejemplo descripto anteriormente la eficacia es `6 + 5 + 4  = 15 `	


## Precio de un juguete

  Se calcula como la multiplicación entre la eficacia y 10, al cual se le suma el costo: 
  `precio = (eficacia * 10) + costo`. Sin embargo, en el caso de los juguetes 
  que se componen por piezas (los baldecitos y los juegos de tachitos apilables)
  hay que agregar 20 pesos si alguna de las piezas es de color rosa 

  Para los casos de ejemplo, asumir que todas las piezas son azules excepto el 
  cilindro que es de color rosa. Los precios quedan:
  
  ```
    pelota = 12 * 10 + 24 = 144
    baldecito = 6 * 10 + 21  + 20 = 101
    tachitos = 15 * 10 + 39  = 189
  ```  


_Off topic_: ¿Conocías la problemática del [impuesto rosa](https://es.wikipedia.org/wiki/Impuesto_rosa)?

## Entretenimiento de une niñe

Saber por cuánto tiempo une niñe puede ser entretenido por un juguete. Lo cual se calcula de la siguiente manera:

-   Para une niñe típique, la cantidad de tiempo es la eficacia del juguete 
	multiplicado por un coeficiente que se calcula como 1 más la edad (en meses) 
	sobre 100.
    
    `Tiempo = eficaciaJuguete *  (1 + (edadNiño / 100))`
    
    Por ejemplo, para Valentin que es un niño típico de 10 meses la pelota lo entretiene por
    `12 * (1 + 10/100) = 13.2` 
       
    
- Para une niñe curiose, el tiempo es el 150% del tiempo de une típique
        `Tiempo =  (eficaciaJuguete *  (1 + (edadNiño / 100))) * 1.5`
     Por ejemplo, para Zoe que es una niña curiosa de 20 meses el tiempo que la pelota la entretiene es
     ` (12 * (1 + 20/100)) * 1.5 = 21.6` 
        
 - Para une niñe revoltose, el tiempo es la mitad de la eficacia del juguete, sin importar la edad.
        `Tiempo =  (eficaciaJuguete *  (1 + (edadNiño / 100))) / 2`
     Por ejemplo, para Milena que es una niña revoltosa de 15 meses el tiempo de la pelota la entretiene por
     ` (12 * (1 + 15/100)) /2 1.5 = 6.9` 
 
## Comprar un juguete

Registrar que le regalaron un juguete a une niñe. Éste debe conocer 
todos los juguetes que tiene. 
Solo se pueden regalar juguetes que acepte.

- *Une niñe típique* acepta cualquier juguete 
- *Une niñe curiose* solo acepta juguetes cuyo precio no supere 150
- *Une niñe revoltose* solo acepta juguetes que le entretengan por mas de 7 minutos

Ejemplos:
-  valentin acepta la pelota y los tachitos
-  zoe acepta la pelota pero rechaza los tachitos
-  milena rechaza la pelota y acepta los tachitos

## Donar juguetes

Un niñe le puede donar a otre todos sus juguetes.

Para eso tiene que pasar que al menos uno de los juguetes a donar 
sea aceptado por le receptore, si eso no ocurre el requerimiento no se puede cumplir

Una vez validado que se pueda donar al menos uno, todos aquellos juguetes 
que son aceptados por le receptor son transferidos.

Ejemplos:
-  Valentin, que tiene la pelota, el baldecito y los tachitos le dona a Milena 
   quien hasta ese momento no tiene nada.  
   Luego de lo cual Milena se queda con los tachitos, valentin con la pelota y el baldecito, ya que solo 
   los tachitos son aceptados por Milena.
 
-  Zoe que solo tiene la pelota y el baldecito, intenta donarle a Milena pero no se puede ya que
no tiene ningún juguete que sea aceptado




 








 
