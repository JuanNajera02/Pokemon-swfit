
public class Pokemon {
	public String apodo = "SALVAJE";
	public String nombre;
	public int vida;
	public int vidaTotal;
	public int nivel = 1;
	public String tipo;
	public int ataque;
	public int defensa;
 	public String fuerteContra;
	public String debilContra;
	
	public Pokemon(String nombre) {
		this.nombre = nombre;
	}
	
	public void atacar(Pokemon pokeAtacante, Pokemon pokeDa�ado, Boolean miPokeAtaca) {
		
		//FORMULA DEL DA�O
		int da�o = ((pokeAtacante.ataque +10) * pokeAtacante.nivel) - (pokeDa�ado.defensa * pokeDa�ado.nivel);
		
		//CALCULO DEL DA�O HECHO
			if(pokeAtacante.fuerteContra.equals(pokeDa�ado.tipo) ) {
				 da�o *= 2;				
			   }
			
			if(pokeAtacante.debilContra.equals(pokeDa�ado.tipo)) {
				da�o -= 5;
			   }
			
				pokeDa�ado.vida -= da�o;
			
				String mInicio = miPokeAtaca ? pokeAtacante.apodo + " ataco al " + pokeDa�ado.nombre + " salvaje": "el " + pokeAtacante.nombre + " salvaje ataco a " + pokeDa�ado.apodo;
				String mFin = miPokeAtaca ? "La vida del " + pokeDa�ado.nombre + " bajo a " + pokeDa�ado.vida:"La vida de " + pokeDa�ado.apodo + " bajo a " + pokeDa�ado.vida;
			

				System.out.println(mInicio);
				
				if(pokeAtacante.fuerteContra.equals(pokeDa�ado.tipo)) {
					System.out.println("ES UN ATAQUE SUPER EFICAZ");
						}
					
				if(pokeAtacante.debilContra.equals(pokeDa�ado.tipo)) {
					System.out.println("NO ES UN ATAQUE MUY EFECTIVO");
						}
				
				if(pokeDa�ado.vida > 0 ) {
					System.out.println(mFin);
						}
				
				
					} // llave cierre del metodo
	
	public void obtenerEstadisticas() {
		System.out.println("Nombre: " + this.nombre);
		System.out.println("Nivel: " + this.nivel);
		System.out.println("Tipo: " + this.tipo);
		System.out.println("Vida: " + this.vida);
		System.out.println("Ataque: " + this.ataque);
		System.out.println("Defensa: " + this.defensa);
		System.out.println("Fortalezas: " + this.fuerteContra);
		System.out.println("Debilidades: " + this.debilContra);

	}

}
