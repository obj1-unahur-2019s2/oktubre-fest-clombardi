class Persona {
	var property jarrasCompradas = []
	var peso = 80
	var aguante = 50	
	var property leGustaEscucharMusica = false
	
	// devuelve: número
	method alcoholIngerido() {
		return jarrasCompradas.sum({ jarra => jarra.contenidoDeAlcohol() })
	}	
	
	// espera: Jarra
	// devuelve: nada, es una acción
	method recibirJarra(jarra) {
		jarrasCompradas.add(jarra)
	}
	
	// devuelve: booleano
	method estaEbria() {
		return self.alcoholIngerido() * peso > aguante
	}
	
	// espera: Carpa, devuelve: booleano
	method quiereEntrar(carpa) {
		return self.leGustaMarca(carpa.marca()) 
		and
		self.leGustaEscucharMusica() == carpa.tieneBandaDeMusica() 
	}
	
	// espera: Carpa, devuelve: booleano
	method puedeEntrar(carpa) {
		return self.quiereEntrar(carpa) and carpa.dejaIngresar(self)
	}
	
	// espera: Carpa, devuelve: nada, es una acción
	method entrar(carpa) {
		if (not self.puedeEntrar(carpa)) {
			self.error("No se puede")
		}
		carpa.registrarIngreso(self)
	}
	
	// método abstracto, necesario para que Wollok acepte el método quiereEntrar(carpa)
	// espera: Carpa, devuelve: booleano
	method leGustaMarca(marca)
}


class Aleman inherits Persona {
	// espera: Carpa, devuelve: booleano
	override method leGustaMarca(marca) {
		return true
	}

	// espera: Carpa, devuelve: booleano
	override method quiereEntrar(carpa) {
		return super(carpa) and carpa.cantidadDeGenteAdentro().even()
	}
}


class Belga inherits Persona {
	// espera: Carpa, devuelve: booleano
	method leGustaMarca(marca) {
		return marca.contenidoDeLupulo() > 4
	}
}

class Checo inherits Persona {
	// espera: Carpa, devuelve: booleano
	method leGustaMarca(marca) {
		return marca.graduacion() > 8
	}
}
