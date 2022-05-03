import Swift

public class Pelea {

    private var ganador: Int = 0
    private var danoHecho: Int = 0

    // funcion pelear
    public func pelear(miPoke: Pokemon, pokeSalvaje: Pokemon, moneda: Int) {

        if(moneda == 1) {
            danoHecho = miPoke.atacar(pokeDanado:pokeSalvaje)
            pokeSalvaje.vida -= danoHecho
        } else {
            danoHecho = pokeSalvaje.atacar(pokeDanado:miPoke)
            miPoke.vida -= danoHecho
        }
        if(miPoke.vida <= 0) {
            ganador = 2
        }
        if(pokeSalvaje.vida <= 0){

        ganador = 1
        } 
    
    }

    //funcion obtener ganador
    public func obtenerGanador() -> Int {
        return ganador
    }

    //funcion genera numero 1 o 2 aleatorio
    public func lanzarMoneda() -> Int {
        //genera numero aleatorio entre 1 y 2


        let numero = Int.random(in: 1...2)

        return numero
    }

    // funcion obtener dano hecho
    public func obtenerDanoHecho() -> Int {
        return danoHecho
    }

}


public class MenuPokedex {

    public func mostrarPokedex(ent: Entrenador)  {

        var opcion: Int = 0

        while(opcion != 4){

            print("\n  MENU POKEDEX")
            print("1. Buscar Pokemon por apodo")
            print("2. Buscar Pokemon por tipo")
            print("3. Ver todos tus pokemon")
            print("4. Volver al menu principalr")
            print("Ingrese una opcion: ")
            opcion = Int(readLine()!)! 

            switch opcion {
                
                case 1:  

                        print("Ingrese el apodo del pokemon: ")
                        let apodo: String = readLine()!
                        let posicion: Int = ent.miPokedex.existePokemon(nombre:apodo)
                            
                        if(posicion != -1){
                            print("El pokemon \(apodo) existe en el catalogo")
                            print(ent.miPokedex.buscarPokemon(i:posicion).obtenerEstadisticas())
                                
                        }else{
                            print("El pokemon \(apodo) no posicion en el catalogo")
                        }
                            
                        break

                case 2:

                        print("Ingrese el tipo del pokemon: ")
                        let tipo: String = readLine()!
                        let pokemons: [Pokemon] = ent.miPokedex.buscarPokemonTipo(tipo:tipo)

                        if(pokemons.count != 0){
                            print("Los pokemons del tipo \(tipo) son: ")
                            for pokemon in pokemons {
                                print(pokemon.obtenerEstadisticas())
                            }
                        }else{
                            print("No hay pokemons del tipo \(tipo)")
                        }

                        break

                case 3:

                        print(ent.miPokedex.verPokemon())

                        break

                case 4:


                        break

                default:
                    
                        print("Opcion invalida")
                        break




            }


        }

    }

}

public class MenuCatalogo {
    // public static int mostrarCatalogo

    public func mostrarCatalogo()  {

        let catalogo: Catalogo = Catalogo()
        var opcion: Int = 0

        while(opcion != 4 ){
            
            print("\n  MENU CATALOGO")
            print("1. Buscar Pokemon por nombre")
            print("2. Buscar Pokemon por tipo")
            print("3. Ver todos los Pokemon disponibles en el juego")
            print("4. Volver al menu principalr")
            print("Ingrese una opcion: ")
            opcion = Int(readLine()!)!

            switch opcion {

            case 1:

                print("Ingrese el nombre del pokemon: ")
                let nombre: String = readLine()!
                let posicion: Int = catalogo.existePokemon(nombre:nombre)

                if(posicion != -1){
                    print("El pokemon \(nombre) posicion en el catalogo")
                    print(catalogo.buscarPokemon(i:posicion).obtenerEstadisticas())

                }else{
                    print("El pokemon \(nombre) no posicion en el catalogo")
                }

                break

            case 2:

                print("Ingrese el tipo del pokemon: ")
                let tipo: String = readLine()!
                let pokemons: [Pokemon] = catalogo.buscarPokemonTipo(tipo:tipo)

                if(pokemons.count != 0){
                    print("Los pokemons del tipo \(tipo) son: ")
                    for pokemon in pokemons {
                        print(pokemon.obtenerEstadisticas())
                    }
                }else{
                    print("No hay pokemons del tipo \(tipo)")
                }

                break

                
            case 3:

                print(catalogo.verPokemon())

                break
    
            case 4:

                break
            default:

                print("Opcion invalida")
      
                break
            }
        }
        
}
}



let _ = main()
public func main() -> Int{
    var nombre: String = ""
    print("Bienvenido al mejor juego de Pokemon")
    print("Ingrese su nombre: ")
    nombre = readLine()!
    let entrenador = Entrenador(nombre: nombre)
    elegirPokemon(ent:entrenador)
    let opcion: Int = 0
    let MenuCatalogo = MenuCatalogo()
    let MenuPokedex = MenuPokedex()

    while opcion != 4 {
        print("   MENU PRINCIPAL")
        print("Que desea hacer?")
        print("1: Abrir menu Catalogo")
        print("2: Abrir menu Pokedex")
        print("3: Caminar")
        print("4: Salir del juego")
        let opcion: Int = Int(readLine()!)!
        switch opcion {
        case 1:
            MenuCatalogo.mostrarCatalogo()
            break
        case 2:
            MenuPokedex.mostrarPokedex(ent:entrenador)
            break
        case 3:
            caminar(ent:entrenador)
            break
        case 4:
            print("Saliendo del juego...")
            // cierra el programa
            return 0
        default:
            print("Opcion no valida")
            break
        }
    }
}


    public func caminar(ent:Entrenador){
        print("Pulse una tecla para dar 1 paso: ")
        let _ = readLine()!
        if ent.caminar(){
            let cat = Catalogo()
            let posicion =  Int.random(in: 0...2)
            let pokemonSalvaje = cat.pokemon[posicion]
            
            print("Te haz encontra con un \(pokemonSalvaje.nombre) salvaje")
            print("Ingrese el pokemon para pelear: ")
            print(ent.miPokedex.verPokemon())
            let posicion2 = Int(readLine()!)
            
            let pokelegido = ent.elegirPokemon(posicion:posicion2! - 1 )
            
            let pelea = Pelea()
            var resMoneda = 0
            
            while pelea.obtenerGanador() == 0{
                print("Presiona una tecla para lanzar una moneda")
                let _ = readLine()!
                resMoneda = pelea.lanzarMoneda()
                if resMoneda == 1{
                    print("Tu pokemon atacara")
                    if pokelegido.fuerteContra == pokemonSalvaje.tipo{
                        print("ES UN ATAQUE SUPER EFICAZ")
                    }
                    if pokelegido.debilContra == pokemonSalvaje.tipo{
                        print("NO ES UN ATAQUE MUY EFECTIVO")
                    }
                    pelea.pelear(miPoke:pokelegido,pokeSalvaje: pokemonSalvaje,moneda: resMoneda)
                    print(pokelegido.apodo + " ha causado \(pelea.obtenerDanoHecho()) de dano")
                    print("El \(pokemonSalvaje.nombre) salvaje tiene \(pokemonSalvaje.vida) de vida")
                    continue
                }
                
                print("El pokemon salvaje te atacara")
                if pokemonSalvaje.fuerteContra == pokelegido.tipo{
                    print("ES UN ATAQUE SUPER EFICAZ")
                }
                if pokemonSalvaje.debilContra == pokelegido.tipo{
                    print("NO ES UN ATAQUE MUY EFECTIVO")
                }
                pelea.pelear(miPoke:pokelegido,pokeSalvaje: pokemonSalvaje,moneda: resMoneda)
                print("El \(pokemonSalvaje.nombre) salvaje te ha causado \(pelea.obtenerDanoHecho()) de dano")
                print(pokelegido.apodo + "  tiene \(pokelegido.vida) de vida")
            }
            // YA HAY UN GANADOR
            if pelea.obtenerGanador() == 2{
                print("Te han derrotado")
            }else{
                print("Haz derrotado al Pokemon salvaje \(pokemonSalvaje.nombre)")
                pokelegido.subirNivel()
                print(pokelegido.apodo + " ha subido a nivel \(pokelegido.nivel)")
                
                if !ent.miPokedex.estaLlena(){
                    print("�Deseas capturar al pokemon salvaje \(pokemonSalvaje.nombre)")
                    print("1: Si")
                    print("2: No")
                    let resp = Int(readLine()!)
                    if resp == 1{
                        intentarAtrapar(entrenador:ent, pokemonAtrapar:pokemonSalvaje)
                    }
                }
            }
        }else{
            print("No ha pasado nada...")
        }
    }
    public func intentarAtrapar(entrenador: Entrenador, pokemonAtrapar: Pokemon) {
        var intentos: Int = 0
        while intentos < 3 {
            print("Intento numero: \(intentos)")
            print("Digite un 1 para lanzar una Pokebola: ")
            let _:String = readLine()!
            if entrenador.atrapar() {
                print("Felicidades haz atrapado un \(pokemonAtrapar.nombre)")
                print("¿Que mote deseas darle a tu nuevo \(pokemonAtrapar.nombre)?: ")
                pokemonAtrapar.apodo = readLine()!
                entrenador.curarPokemon(miPokemon:pokemonAtrapar)
                entrenador.miPokedex.agregarPokemon(pokemon:pokemonAtrapar)
                break
            }
            print("El \(pokemonAtrapar.nombre) se ha escapado de la Pokebola")
            intentos += 1
        }
        if intentos >= 3 {
            print("Intentos terminados, el \(pokemonAtrapar.nombre) ha huido")
        }
    }



    public func elegirPokemon(ent:Entrenador){
        var apodo:String = ""
        let cat1 = Catalogo()
        
        print("Que Pokemon desea obtener:")
        print(cat1.verPokemon())
        let opcion = Int(readLine()!)
        let nomPokemon = cat1.pokemon[opcion! - 1].nombre
        let tipoPokemon = cat1.pokemon[opcion! - 1].tipo
        print("Felicidades Obtuviste un \(nomPokemon)")

        print("Que mote le deseas poner a tu Pokemon?")
        apodo = readLine()!
        
        var pokeElegido:Pokemon

        if (tipoPokemon == "FUEGO") {
            pokeElegido = Fuego(nombre: nomPokemon, apodo: apodo)
        } else if (tipoPokemon == "AGUA") {
            pokeElegido = Agua(nombre: nomPokemon, apodo: apodo)
        } else { // tipoPokemon == "PLANTA"
            pokeElegido = Planta(nombre: nomPokemon, apodo: apodo)
        }
        ent.miPokedex.agregarPokemon(pokemon:pokeElegido)

    }

public class Fuego:Pokemon {

        //constructor de fuego
        public init(nombre: String){
            super.init(nombre: nombre, vida: 70, vidaTotal: 70, tipo: "FUEGO", ataque: 20, defensa: 10, fuerteContra: "PLANTA", debilContra: "AGUA")
        }

        //constructor de fuego con apodo
        public init(nombre:String,apodo: String){
            super.init(nombre: nombre, vida: 70, vidaTotal: 70, tipo: "FUEGO", ataque: 20, defensa: 10, fuerteContra: "PLANTA", debilContra: "AGUA")
            // obtener el apodo
            self.apodo = apodo
        }
    
        override public func obtenerEstadisticas() -> String {
            return "Mote: \(self.apodo)\n" + super.obtenerEstadisticas();
        }

}
public class Agua:Pokemon {
    
        //constructor de agua
        public init(nombre: String){
            super.init(nombre: nombre, vida: 95, vidaTotal: 95, tipo: "AGUA", ataque: 15, defensa: 15, fuerteContra: "FUEGO", debilContra: "PLANTA")
        }
        
         //constructor de agua con apodo
        public init(nombre:String,apodo: String){
            super.init(nombre: nombre, vida: 95, vidaTotal: 95, tipo: "AGUA", ataque: 15, defensa: 15, fuerteContra: "FUEGO", debilContra: "PLANTA")
            // obtener el apodo
            self.apodo = apodo
        }

        override public func obtenerEstadisticas() -> String {
            return "Mote: \(self.apodo)\n" + super.obtenerEstadisticas();
        }
        
        
}
public class Planta:Pokemon {
    
        //constructor de PLANTA
        public init(nombre: String){
            super.init(nombre: nombre, vida: 90, vidaTotal: 90, tipo: "PLANTA", ataque: 20, defensa: 10, fuerteContra: "AGUA", debilContra: "FUEGO")
        }

        //constructor de PLANTA con mote
        public init(nombre:String,apodo: String){
            super.init(nombre: nombre, vida: 90, vidaTotal: 90, tipo: "PLANTA", ataque: 20, defensa: 10, fuerteContra: "AGUA", debilContra: "FUEGO")
            // obtener el apodo
            self.apodo = apodo
        }

        override public func obtenerEstadisticas() -> String {
            return "Mote: \(self.apodo)\n" + super.obtenerEstadisticas();
        }
    
    
    
}
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
	internal var debilContra: String

	//constructor
	public init(nombre: String, vida: Int, vidaTotal: Int,  tipo: String, ataque: Int, defensa: Int, fuerteContra: String, debilContra: String) {
		self.nombre = nombre
		self.vida = vida
		self.vidaTotal = vidaTotal
		self.tipo = tipo
		self.ataque = ataque
		self.defensa = defensa
		self.fuerteContra = fuerteContra
		self.debilContra = debilContra
	}
	internal func atacar(pokeDanado: Pokemon) -> Int {
		var danioHecho = (self.ataque + 10 ) * self.nivel - pokeDanado.defensa	 * pokeDanado.nivel
		if self.fuerteContra == pokeDanado.tipo {
			danioHecho *= 2
		}
		if self.debilContra == pokeDanado.tipo {
			danioHecho -= 2
		}
		return danioHecho
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

	public func subirNivel(){
		self.nivel += 1
	}
	//metodo pelear faltante

}


public class Catalogo {

    private var totalPokemones: Int = 3
    // declaracion de arreglo de pokemon
    public var pokemon: [Pokemon] = []


    //constructor
    public init() {

        let pok1: Pokemon = Fuego(nombre:"CHARIZARD")
        let pok2: Pokemon = Agua(nombre:"BLASTOISE")
        let pok3: Pokemon = Planta(nombre:"VENUSAUR")

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


public class Pokedex:Catalogo {

    var totalPokemon:Int = 0
    var limite:Int = 3
    var misPokemon:[Pokemon] = []


    override public func existePokemon(nombre:String) -> Int{
        for i in 0..<misPokemon.count{
            if(misPokemon[i].apodo == nombre){
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
     public func agregarPokemon(pokemon:Pokemon) {
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
        return self.miPokedex.buscarPokemon(i: posicion)
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
    





