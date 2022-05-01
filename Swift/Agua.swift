import Swift

public class Agua:Pokemon {
    
        
        //constructor de agua
        public init(nombre: String){
            super.init(nombre: nombre, vida: 95, vidaTotal: 95, tipo: "AGUA", ataque: 15, defensa: 15, fuerteContra: "FUEGO", debilContra: "PLANTA")
        }
        
         //constructor de agua con apodo
        public init(nombre: String){
            super.init(nombre: nombre, vida: 95, vidaTotal: 95, tipo: "AGUA", ataque: 15, defensa: 15, fuerteContra: "FUEGO", debilContra: "PLANTA")
            // obtener el apodo
            self.apodo = apodo
        }

        override public obtenerEstadisticas() -> String {
            return "Mote: \(self.apodo)\n" + super.obtenerEstadisticas();
        }
        
        
}
