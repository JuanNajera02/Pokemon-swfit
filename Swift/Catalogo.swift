import Swift

public class Catalogo {

    private var totalPokemones: Int = 3
    public var pokemon: [Pokemon] = [Pokemon]()
    pokemon.reserveCapacity(totalPokemones)


    //constructor
    public init() {

        let pok1: Pokemon = Fuego("CHARIZARD")
        let pok2: Pokemon = Agua("BLASTOISE")
        let pok3: Pokemon = Planta("VENUSAUR")

        pokemon[0] = pok1
        pokemon[1] = pok2
        pokemon[2] = pok3

    }

    //Mostrar el total de pokemon existentes en el juego
    public func mostrarTotalPokemon() -> Int {
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
    public func buscarPokemonPorTipo(tipo: String) -> [Pokemon] {
        var pokemon_tipo: [Pokemon] = [Pokemon]()
        pokemon_tipo.reserveCapacity(totalPokemones)
        
        var contador: Int = 0

        for i in 0...totalPokemones - 1 {
            if tipo == pokemon[i].tipo {
                pokemons[contador] = pokemon[i]
                contador += 1
            }
        }

        return pokemon_tipo
    }

    //si el pokemon existe, devolverlo
    public func buscarPokemon(i: Int) -> Pokemon {
        return pokemon[i]
    }
    
    // ver todos los pokemon existentes en el juego (solo el nombre)
    public func verTodosLosPokemon() -> String {
        var str: String = ""

        for i in 0...totalPokemones - 1 {
            str += pokemon[i].nombre + "\n"
        }
        
        return str
    }





}
