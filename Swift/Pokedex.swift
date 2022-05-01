import Swift

// CREATE A PUBLIC CLASS CALLED POKEDEX THAT EXTENDS FROM CATALOGO


public class Pokedex:Catalogo {

    var totalPokemon:Int = 0
    var limite:Int = 3
    var misPokemon:[Pokemon] = [Pokemon]()
    misPokemon.reserveCapacity(limite)


    override existePokemon(apodo:String) -> Int{
        for i in 0..<misPokemon.count{
            if(misPokemon[i].apodo == apodo){
                return i
            }
        }
        return -1
    }
    override public buscarPokemonTipo(tipo:String) -> [Pokemon] {
        var pokemonTipo:[Pokemon] = [Pokemon]()
        for pokemon in self.misPokemon {
            if pokemon.tipo == tipo {
                pokemonTipo.append(pokemon)
            }
        }
        return pokemonTipo
    }
    override public buscarPokemon(i:Int) -> Pokemon{
        return self.misPokemon[i]
    }
    override public agregarPokemon(pokemon:Pokemon) {
        self.misPokemon.append(pokemon)
        self.totalPokemon += 1
    }
    override public verPokemon() -> String {
        var s:String = ""
        for i in 0..<self.totalPokemon {
            // str = str + (i+1) + ": " + this.misPokemon[i].nombre + "-" + this.misPokemon[i].apodo + "\n";
            s += "\(i+1): \(self.misPokemon[i].nombre) - \(self.misPokemon[i].apodo)\n"
        } 
        return s
    }

    public estaLlena() -> Bool{
        return self.totalPokemon == self.limite
    }
    
}