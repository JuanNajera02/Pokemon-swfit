import Swift



    public func main(){
        var nombre: String = ""
        print("Bienvenido al mejor juego de Pokemon")
        print("Ingrese su nombre: ")
        nombre = readLine()!
        var entrenador = Entrenador(nombre: nombre)
        elegirPokemon(entrenador)
        var opcion: Int = 0

        while opcion != 4 {
            print("   MENU PRINCIPAL")
            print("Que desea hacer?")
            print("1: Abrir menu Catalogo")
            print("2: Abrir menu Pokedex")
            print("3: Caminar")
            print("4: Salir del juego")
            opcion = readLine()!
            switch opcion {
            case 1:
                MenuCatalogo.mostrarCatalogo()
                break
            case 2:
                MenuPokedex.mostrarPokedex(entrenador)
                break
            case 3:
                caminar(entrenador)
                break
            case 4:
                print("Saliendo del juego...")
                break
            default:
                print("Opcion no valida")
                break
            }
        }
    }
    

    public func caminar(ent:Entrenador){
        print("Pulse una tecla para dar 1 paso: ")
        readLine()!
        if ent.caminar(){
            let cat = Catalogo()
            let posicion = Int(arc4random_uniform(UInt32(cat.obtenerTotalPokemones()))) + 1
            let pokemonSalvaje = cat.pokemon[posicion - 1]
            
            print("Te haz encontra con un \(pokemonSalvaje.nombre) salvaje")
            print("Ingrese el pokemon para pelear: ")
            print(ent.miPokedex.verPokemon())
            let posicion2 = Int(readLine()!)
            
            let pokelegido = ent.elegirPokemon(posicion2)
            
            let pelea = Pelea()
            var resMoneda = 0
            
            while pelea.obtenerGanador() == 0{
                print("Presiona una tecla para lanzar una moneda")
                readLine()!
                resMoneda = pelea.lanzarMoneda()
                if resMoneda == 1{
                    print("Tu pokemon atacara")
                    if pokelegido.fuerteContra.rawValue == pokemonSalvaje.tipo.rawValue{
                        print("ES UN ATAQUE SUPER EFICAZ")
                    }
                    if pokelegido.debilContra.rawValue == pokemonSalvaje.tipo.rawValue{
                        print("NO ES UN ATAQUE MUY EFECTIVO")
                    }
                    pelea.pelear(pokelegido, pokemonSalvaje, resMoneda)
                    print(pokelegido.apodo + " ha causado \(pelea.obtenerDanoHecho()) de dano")
                    print("El \(pokemonSalvaje.nombre) salvaje tiene \(pokemonSalvaje.vida) de vida")
                    continue
                }
                
                print("El pokemon salvaje te atacara")
                if pokemonSalvaje.fuerteContra.rawValue == pokelegido.tipo.rawValue{
                    print("ES UN ATAQUE SUPER EFICAZ")
                }
                if pokemonSalvaje.debilContra.rawValue == pokelegido.tipo.rawValue{
                    print("NO ES UN ATAQUE MUY EFECTIVO")
                }
                pelea.pelear(pokelegido, pokemonSalvaje, resMoneda)
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
                        intentarAtrapar(ent, pokemonSalvaje)
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
            let opcion: Int = readLine()!
            if entrenador.atrapar() {
                print("Felicidades haz atrapado un \(pokemonAtrapar.nombre)")
                print("¿Que mote deseas darle a tu nuevo \(pokemonAtrapar.nombre)?: ")
                pokemonAtrapar.apodo = readLine()!
                entrenador.curarPokemon(pokemonAtrapar)
                entrenador.miPokedex.agregarPokemon(pokemonAtrapar)
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
        var cat1 = Catalogo()
        
        print("Que Pokemon desea obtener:")
        print(cat1.verPokemon())
        var opcion = Int(readLine()!)

        var nomPokemon = cat1.pokemon[Int(opcion)! - 1].nombre
        var tipoPokemon = cat1.pokemon[Int(opcion)! - 1].tipo
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
        ent.miPokedex.agregarPokemon(pokeElegido)

    }