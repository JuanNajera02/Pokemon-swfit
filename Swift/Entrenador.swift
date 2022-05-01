import Swift

// CREATE A CLASS PUBLIC CALL Entrenador


public class Entrenador {
    private nombre:String
    public miPokedex:Pokedex 

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
        let probabilidad:Int = Int(arc4random_uniform(100))
        return probabilidad >= 50
    }

    public func elegirPokemon(posicion:Int) -> Pokemon{
        return self.miPokedex.buscarPokemon(posicion: posicion)
    }

    public func curarPokemon(miPokemon:Pokemon){
        miPokemon.vida = miPokemon.vidaTotal
    }
    public func atrapar(){
        let probabilidad:Int = Int(arc4random_uniform(100))
        return probabilidad>= 50
    }
    
}
    
    // CREATE A