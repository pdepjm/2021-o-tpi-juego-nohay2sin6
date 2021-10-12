import wollok.game.*
import jugador.*
import cartelNivel.*
import juego.*

object finDeJuego{
	var property position = game.at(4,6)
	var property image = "gameover.jpg"
	
	method cargar(){
		game.clear()
		game.addVisual(self)	
		game.addVisual(jugador)
	
		game.onTick(0, "puntuación",{
			game.say(jugador, "Tu puntuación es: " + juego.puntuacion())
		})
		
		keyboard.r().onPressDo {
			game.clear()
			game.addVisual(new CartelNivel(image = "level1.png"))
			game.onTick(500, "comenzar",{ juego.restart() })			
		}
		
	}
}