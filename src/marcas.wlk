object graduaciones {
	var property graduacionReglamentariaMundial = 5
}
class MarcaDeCerveza {
	var property contenidoDeLupulo
}

class Rubia inherits MarcaDeCerveza {
	// recordemos que el efecto de poner "property" ... 
	var property graduacion
	// ... es que Wollok agrega de gamba estos métodos 
//	method graduacion() { return graduacion }
//	method graduacion(x) { graduacion = x }
}

class Negra inherits MarcaDeCerveza {
	// devuelve un número
	method graduacion() {
		return graduaciones.graduacionReglamentariaMundial().min(self.contenidoDeLupulo() * 2)
	}
}

class Roja inherits Negra {
	// devuelve un número
	override method graduacion() {
		return super() * 1.25
	}
}

class Jarra {
	var property marca
	var property capacidad = 2
	
	// devuelve un número
	method contenidoDeAlcohol() {
		return (capacidad * marca.graduacion()) / 100
	}
}



















