import wollok.game.*
import juego.*
import cartelNivel.*

object pantallaInicial {
	
	var property position = game.at(2,4)
	var property image = "PantallaPrincipal.png"	

	method cargar(){
		game.addVisual(self)	
	
		keyboard.enter().onPressDo {
			game.clear()
			game.addVisual(new CartelNivel(image = "level1.png"))
			game.onTick(500, "comenzar",{ juego.comenzar() })	
		}
	}
}
