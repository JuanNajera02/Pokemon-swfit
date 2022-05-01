import Swift

public class Planta:Pokemon {
    
        //constructor de PLANTA
        public init(nombre: String){
            super.init(nombre: nombre, vida: 90, vidaTotal: 90, tipo: "PLANTA", ataque: 20, defensa: 10, fuerteContra: "AGUA", debilContra: "FUEGO")
        }

        //constructor de PLANTA con mote
        public init(nombre: String){
            super.init(nombre: nombre, vida: 90, vidaTotal: 90, tipo: "PLANTA", ataque: 20, defensa: 10, fuerteContra: "AGUA", debilContra: "FUEGO")
            // obtener el apodo
            self.apodo = apodo
        }

        override public obtenerEstadisticas() -> String {
            return "Mote: \(self.apodo)\n" + super.obtenerEstadisticas();
        }
    
    
    
}
