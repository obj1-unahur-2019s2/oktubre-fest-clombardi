import marcas.*

class Carpa {
	var property limite = 50
	var property tieneBandaDeMusica = false
	var property marca
	var property quienesEstan = []
	
	// devuelve: número
	method cantidadDeGenteAdentro() {
		return quienesEstan.size()
	}
	
	// espera: persona, devuelve: nada, es una acción
	method registrarIngreso(persona) {
		quienesEstan.add(persona)
	}
	
	// espera: persona, devuelve: booleano
	method dejaIngresar(persona) {
		return self.hayLugar() and not persona.estaEbria()
	}
	
	// devuelve: booleano
	method hayLugar() {
		return self.cantidadDeGenteAdentro() < limite
	}
	
	// espera: persona y número, devuelve: nada, es una acción
	method servirJarra(persona,capacidad) {
		if (not quienesEstan.contains(persona)) {
			self.error("No estás en la carpa")
		}
		// estamos creando el objeto que representa a la carpa en la acción de servir
		const nuevaJarra = new Jarra(marca=self.marca(), capacidad=capacidad)
		persona.recibirJarra(nuevaJarra)
	}
}










