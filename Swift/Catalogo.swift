import Swift

public class Catalogo {

    private var totalPokemones: Int = 3
    // declaracion de arreglo de pokemon
    private var pokemon: [Pokemon] = []


    //constructor
    public init() {

        let pok1: Pokemon = Fuego("CHARIZARD")
        let pok2: Pokemon = Agua("BLASTOISE")
        let pok3: Pokemon = Planta("VENUSAUR")

        self.pokemon.append(pok1)
        self.pokemon.append(pok2)
        self.pokemon.append(pok3)
    }

    //Mostrar el total de pokemon existentes en el juego
    public func obtenerTotalPokemones() -> Int {
        return self.totalPokemones
    }

    //Ver si existe el pokemon buscandolo por nombre
    public func existePokemon(nombre: String) -> Int {
        for i in 0...totalPokemones - 1 {
            if nombre == pokemon[i].nombre {
                return i
            }
        }

        return -1
    }

    //buscar pokemon por tipo
    public func buscarPokemonTipo(tipo: String) -> [Pokemon] {
        var pokemon_tipo: [Pokemon] = [Pokemon]()
        
        for i in 0...totalPokemones - 1 {
            if tipo == pokemon[i].tipo {
                pokemon_tipo.append(pokemon[i])
            }
        }

        return pokemon_tipo
    }

    //si el pokemon existe, devolverlo
    public func buscarPokemon(i: Int) -> Pokemon {

        return self.pokemon[i]
    }
    
    // ver todos los pokemon existentes en el juego (solo el nombre)
    public func verPokemon() -> String {
        var str: String = ""

        for i in 0...totalPokemones - 1 {
            // str = "1: " + pokemon[0].nombre + "\n2: " + pokemon[1].nombre + "\n3: " + pokemon[2].nombre;
            str += "\(i + 1): " + self.pokemon[i].nombre + "\n"
        }
        
        return str
    }





}
