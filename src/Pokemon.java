
public class Pokemon {
	public String apodo = "SALVAJE";
	public String nombre;
	public int vida;
	public int nivel = 1;
	public String tipo;
	public int ataque;
	public int defensa;
 	public String fuerteContra;
	public String debilContra;
	
	public Pokemon(String nombre) {
		this.nombre = nombre;
	}
	
	public void atacar(Pokemon pokeAtacante, Pokemon pokeDa�ado, Boolean flag) {
		int da�o = pokeAtacante.ataque;
		pokeDa�ado.vida = pokeDa�ado.vida - da�o;
		if(flag == true) {
			System.out.println(pokeAtacante.apodo + " ataco al " + pokeDa�ado.nombre + " salvaje");
			System.out.println("La vida del " + pokeDa�ado.nombre + " salvaje bajo a " + pokeDa�ado.vida);
		}else {
			System.out.println("el " + pokeAtacante.nombre + " salvaje ataco a " + pokeDa�ado.apodo);
			System.out.println("La vida de " + pokeDa�ado.apodo + " bajo a " + pokeDa�ado.vida);
		}
		
		


	}
	
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
