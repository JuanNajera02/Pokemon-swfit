import Swift


public class Pokedex:Catalogo {

    var totalPokemon:Int = 0
    var limite:Int = 3
    var misPokemon:[Pokemon] = []


    override func existePokemon(apodo:String) -> Int{
        for i in 0..<misPokemon.count{
            if(misPokemon[i].apodo == apodo){
                return i
            }
        }
        return -1
    }
    override public func buscarPokemonTipo(tipo:String) -> [Pokemon] {
        var pokemonTipo:[Pokemon] = [Pokemon]()
        for pokemon in self.misPokemon {
            if pokemon.tipo == tipo {
                pokemonTipo.append(pokemon)
            }
        }
        return pokemonTipo
    }
    override public func buscarPokemon(i:Int) -> Pokemon{
        return self.misPokemon[i]
    }
    override public func agregarPokemon(pokemon:Pokemon) {
        self.misPokemon.append(pokemon)
        self.totalPokemon += 1
    }
    override public func verPokemon() -> String {
        var s:String = ""
        for i in 0..<self.totalPokemon {
            s += "\(i+1): \(self.misPokemon[i].nombre) - \(self.misPokemon[i].apodo)\n"
        } 
        return s
    }

    public func estaLlena() -> Bool{
        return self.totalPokemon == self.limite
    }
    
}