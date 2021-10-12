import nivelDeJuego.*
import finDeJuego.*
import enemigos.*
import wollok.game.* 
import jugador.*

object juego {
	var property puntuacion = 0
	var property nivel = nivelUno
	
	method comenzar() {
		game.clear()
		game.addVisualCharacter(jugador)
		
		nivel.cargarEnemigos()
		self.validarFinal()
		self.validarDificultad()

		nivel.cargarTiemposDeDisparo()		
		game.onTick(0, "validar",{ jugador.validarMovimientoHorizontal() }) 
		game.onTick(0, "impactar",{ jugador.impactarDisparo() })
  
		game.onTick(0, "moverDisparo",{ jugador.moverDisparo() })
		game.onTick(0, "validarDisparo",{ jugador.validarDisparo()})
	    
		keyboard.space().onPressDo { 
			jugador.disparar()
		}
	   
		game.whenCollideDo(jugador, { enemigoODisparoEnemigo => 
			game.sound("explosion.wav").play()
			finDeJuego.cargar()
		})	

	}
	
	method eliminarEnemigo(enemigo){
		if(nivel.todosLosEnemigos().contains(enemigo)){
			game.sound("explosion.wav").play()
			puntuacion += enemigo.puntos()
			nivel.removerEnemigo(enemigo)
		}
		game.removeVisual(enemigo)
	}
	
	method validarFinal() {	
		game.onTick(0, "ganar",{ 
			if(nivel.todosLosEnemigos().isEmpty()){
				nivel.completar()			
			}
		})	
		game.onTick(0, "perder",{ 
			if(nivel.todosLosEnemigos().any({enemigo => enemigo.victoria()})){
				finDeJuego.cargar()
			}
		})	
	}
	
	method restart() {
		puntuacion = 0
		nivel.restart()	
		nivel = nivelUno
		self.comenzar()
	}
	
	method validarDificultad() {
		game.onTick(500, "dificultad",{ 
			if(nivel.todosLosEnemigos().size() < 10){
				nivel.aumentarDificultad()
			}
		})	
	}
}