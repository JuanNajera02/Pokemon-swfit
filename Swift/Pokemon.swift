import Swift

public class Pokemon {

	internal var apodo: String = "SALVAJE"
	internal var nombre: String
	internal var vida: Int
	internal var vidaTotal: Int
	internal var nivel: Int = 1
	internal var tipo: String
	internal var ataque: Int
	internal var defensa: Int
	internal var fuerteContra: String
	prointernaltected var debilContra: String

	//constructor
	public init(nombre: String, vida: Int, vidaTotal: Int, nivel: Int, tipo: String, ataque: Int, defensa: Int, fuerteContra: String, debilContra: String) {
		self.nombre = nombre
		self.vida = vida
		self.vidaTotal = vidaTotal
		self.nivel = nivel
		self.tipo = tipo
		self.ataque = ataque
		self.defensa = defensa
		self.fuerteContra = fuerteContra
		self.debilContra = debilContra
	}



	// obtener estadisticas
	internal func obtenerEstadisticas() -> String {
		var str: String = ""
	
		str += "Nombre: \(self.nombre)\n"
		str += "Vida: \(self.vida)\n"
		str += "Vida Total: \(self.vidaTotal)\n"
		str += "Nivel: \(self.nivel)\n"
		str += "Tipo: \(self.tipo)\n"
		str += "Ataque: \(self.ataque)\n"
		str += "Defensa: \(self.defensa)\n"
		str += "Fuerte Contra: \(self.fuerteContra)\n"
		str += "Debil Contra: \(self.debilContra)\n"

		return str
	}


	//metodo pelear faltante
	


}
