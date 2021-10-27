import wollok.game.*
import jugador.*
import cartelNivel.*
import juego.*

object finDeJuego{
	var property position = game.at(2,6)
	var property image = "gameoverphrase.png"
	
	method cargar(){
		game.clear()
		game.addVisual(self)	
		game.addVisual(jugador)
	
		game.say(jugador, "Tu puntuación es: " + juego.puntuacion())
		
		keyboard.r().onPressDo {
			game.clear()
			game.addVisual(new CartelNivel(image = "level1.png"))
			game.schedule(500,{ juego.restart() })
			
		}
		
		
		
		
	}
}