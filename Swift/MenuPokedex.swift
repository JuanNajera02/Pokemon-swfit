import Swift

public class MenuPokedex {

    public static func mostrarPokedex(Entrenador: ent1) -> Int {

        var opcion: Int = 0

        while(opcion != 4){

            print("\n  MENU CATALOGO")
            print("1. Buscar Pokemon por nombre")
            print("2. Buscar Pokemon por tipo")
            print("3. Ver todos los Pokemon disponibles en el juego")
            print("4. Volver al menu principalr")
            print("Ingrese una opcion: ")
            opcion = Int(readLine()!)! 

            switch opcion {
                
                case 1:  

                        print("Ingrese el apodo del pokemon: ")
                        let apodo: String = readLine()!
                        let posicion: Int = Entrenador.miPokedex.existePokemon(apodo)
                            
                        if(posicion != -1){
                            print("El pokemon \(apodo) existe en el catalogo")
                            print(Entrenador.miPokedex.buscarPokemon(posicion).obtenerEstadisticas())
                                
                        }else{
                            print("El pokemon \(apodo) no posicion en el catalogo")
                        }
                            
                        break

                case 2:

                        print("Ingrese el tipo del pokemon: ")
                        let tipo: String = readLine()!
                        let pokemons: [Pokemon] = Entrenador.miPokedex.buscarPokemonTipo(tipo)

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

                        print(Entrenador.miPokedex.verPokemon())

                        break

                case 4:

                        return 0

                        break

                default:
                    
                        print("Opcion invalida")
                        break




            }

            return 0

        }

    }






}