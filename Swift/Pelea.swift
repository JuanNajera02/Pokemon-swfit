import Swift
public class Pelea {

    private var ganador: Int = 0
    private var danoHecho: Int = 0

    // funcion pelear
    public func pelear(miPoke: Pokemon, pokeSalvaje: Pokemon, moneda: Int) {

        if(moneda == 1) {
            danoHecho = miPoke.atacar(pokeSalvaje)
            pokeSalvaje.vida -= danoHecho
        } else {
            danoHecho = pokeSalvaje.atacar(miPoke)
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