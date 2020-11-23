/*De cada juguete interesa calcular el costo de fabricación,
 * el precio de venta y su eficacia según se detalla en los siguientes puntos:
 */
 object cuv{
 	var property valor = 2 //Por default
 }
 class Pieza{
 	const property color
 	const property volumen
 	method esRosa(){
 		return self.color() == "Rosa"
 	}
 	method valor(){
 		return self.volumen()*cuv.valor()
 	}
 }
class Juguete{
	
	method costoFabricacion()
	method eficacia()
	method precioVenta(){
		return 10* self.eficacia()+ self.costoFabricacion()
	}
}

class Pelota inherits Juguete{
	var property radioPelota
	
	override method costoFabricacion(){
		return 3*radioPelota*cuv.valor()
	}
	
	override method eficacia(){
		return 12
	}
}
class JugueteConPiezas inherits Juguete{
	var property piezas = []
	
	method costoFijo()
	method piezaMayorVolumen(){
		return piezas.max({pieza => pieza.volumen()})
	}
	method cantidadDePiezas(){
		return piezas.size()
	}
	override method costoFabricacion(){
		return self.costoFijo()+ self.cantidadDePiezas() * self.piezaMayorVolumen().valor()
	}
	override method precioVenta(){
		return if (self.hayPiezaRosa()) super() + 20
		else super()
	}
	method hayPiezaRosa(){
		return piezas.any({pieza => pieza.esRosa()})
	}
	
}
class BaldecitoCuerposGeometricos inherits JugueteConPiezas{
	
	override method costoFijo() = 5
	override method eficacia(){
		return 3 * self.cantidadDePiezas()
	}
	
}
class JuegoTachitosApilables inherits JugueteConPiezas{
	override method costoFijo() = 3
	override method eficacia(){
		return piezas.sum({pieza => pieza.volumen()})
	}
}

class Ninie{
	var property edad //En Meses
	const property juguetes = []
	
	method tiempoEntretenimiento(juguete){
		return juguete.eficacia()* (1 + (self.edad()/100))
	}
	method meGusta(juguete){
		return true
	}
	method recibirJuguete(juguete){
		self.validarRecibirJuguete(juguete)
		juguetes.add(juguete)
	}
	method validarRecibirJuguete(juguete){
		if(!self.meGusta(juguete)){
			self.error("Gracias no me gusta el" + juguete)
		}
	}
	method donarJuguetes(ninie){
		self.validarDonarJuguetes(ninie)
		ninie.aceptarDonacion(self.juguetesQueLeGustan(ninie))
		self.sacarJuguetesDonados(self.juguetesQueLeGustan(ninie))
		
	}
	method validarDonarJuguetes(ninie){
		if(!self.tieneJuguetesQueLeGustan(ninie)){
			self.error("No hay juguetes que le gusten a " + ninie)
		}
	}
	method aceptarDonacion(_juguetes){
		_juguetes.forEach({juguete => self.recibirJuguete(juguete)})
	}
	method tieneJuguetesQueLeGustan(ninie){
		return juguetes.any({juguete =>ninie.meGusta(juguete)})
	}
	method juguetesQueLeGustan(ninie){
		return juguetes.filter({juguete=>ninie.meGusta(juguete)})
	}
	method sacarJuguetesDonados(listaDeJuguetesADonar){
		listaDeJuguetesADonar.forEach({juguete => juguetes.remove(juguete)})
	}
	
}
class NinieCuriose inherits Ninie{
	override method tiempoEntretenimiento(juguete){
		return super(juguete) * 1.5
	}
	override method meGusta(juguete){
		return juguete.precioVenta() <= 150
	}
}
class NinieRevoltose inherits Ninie{
	override method tiempoEntretenimiento(juguete){
		return super(juguete) / 2
	}
	override method meGusta(juguete){
		return self.tiempoEntretenimiento(juguete) > 7
	}
}