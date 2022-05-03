import Swift

public class Entrenador {
    private var nombre:String
    public var miPokedex:Pokedex 

    //constructor
    public init(nombre: String) {
        self.nombre = nombre
        self.miPokedex = Pokedex()
    }

    public func obtenerNombre() -> String {
        return self.nombre
    }

    public func caminar() -> Bool {
        // crea un numero aleatorio entre 1 y 100
        let probabilidad:Int =  Int.random(in: 1...100)
        if probabilidad >= 50{
            return true
        }
        return false
    }

    public func elegirPokemon(posicion:Int) -> Pokemon{
        return self.miPokedex.buscarPokemon(posicion: posicion)
    }

    public func curarPokemon(miPokemon:Pokemon){
        miPokemon.vida = miPokemon.vidaTotal
    }
    public func atrapar() -> Bool {
        let probabilidad:Int =  Int.random(in: 1...100)
        if probabilidad >= 50{
            return true
        }
        return false
    }
    
}
    
    // CREATE A