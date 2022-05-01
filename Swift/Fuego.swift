import Swift

public class Fuego:Pokemon {

        //constructor de fuego
        public init(nombre: String){
            super.init(nombre: nombre, vida: 70, vidaTotal: 70, tipo: "FUEGO", ataque: 20, defensa: 10, fuerteContra: "PLANTA", debilContra: "AGUA")
        }

        //constructor de fuego con apodo
        public init(nombre: String){
            super.init(nombre: nombre, vida: 70, vidaTotal: 70, tipo: "FUEGO", ataque: 20, defensa: 10, fuerteContra: "PLANTA", debilContra: "AGUA")
            // obtener el apodo
            self.apodo = apodo
        }
    
        override public  obtenerEstadisticas() -> String {
            return "Mote: \(self.apodo)\n" + super.obtenerEstadisticas();
        }
    
    
    
    
    

}
