import Swift

public class MenuCatalogo {
    // public static int mostrarCatalogo

    public static func mostrarCatalogo() -> Int {

        let catalogo: Catalogo = Catalogo()
        var opcion: Int = 0

        while(opcion !=4 ){
            
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
                let posicion: Int = catalogo.existePokemon(nombre)

                if(posicion != -1){
                    print("El pokemon \(nombre) posicion en el catalogo")
                    print(catalogo.buscarPokemon(posicion).obtenerEstadisticas())

                }else{
                    print("El pokemon \(nombre) no posicion en el catalogo")
                }

                break

            case 2:

                print("Ingrese el tipo del pokemon: ")
                let tipo: String = readLine()!
                let pokemons: [Pokemon] = catalogo.buscarPokemonTipo(tipo)

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

                return 0                

            default:

                print("Opcion invalida")
      
                break
            }
        }
        



return 0







}