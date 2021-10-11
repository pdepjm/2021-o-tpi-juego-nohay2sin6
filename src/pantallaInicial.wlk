import wollok.game.*
import juego.*
import interfaz.*

object pantallaInicial {
	
	var property position = game.at(2,4)
	var property image = "PantallaPrincipal.png"	

	method cargar(){
		game.addVisual(self)	
	
	}
}
