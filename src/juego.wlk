import nivelDeJuego.*
import finDeJuego.*
import enemigos.*
import wollok.game.* 
import jugador.*

object juego {
	
	method comenzar() {
		game.clear()
		game.addVisualCharacter(jugador)
		
		//nivel.cargarEnemigos()
		//self.validarFinal()
		//self.validarDificultad()

		//nivel.cargarReglas()		
		game.onTick(0, "validar",{ jugador.validarMovimientoHorizontal() }) 
		//game.onTick(0, "impactar",{ player.impactar() })
 
		game.onTick(0, "moverDisparo",{ jugador.moverDisparo() })
		game.onTick(0, "validarDisparo",{ jugador.validarDisparo()})
	
		keyboard.space().onPressDo { 
			jugador.disparar()
		}
	
		/*game.whenCollideDo(jugador, { enemigo => 
			game.sound("explosion.wav")
			gameover.cargar()
		})	*/

	}

}