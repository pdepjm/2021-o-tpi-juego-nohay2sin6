import nivelDeJuego.*
import finDeJuego.*
import enemigos.*
import wollok.game.* 
import jugador.*
import direcciones.*

object juego {
	var property puntuacion = 0
	var property nivel = nivelUno
	
	method comenzar() {
		game.clear()
		game.addVisual(jugador)
		
		nivel.cargarEnemigos()
		nivel.disparosEnemigos()		 
		
		game.onTick(0, "moverDisparo",{ jugador.moverDisparo() })
		game.onTick(5000, "combatir",{ nivel.combatir() })
	
		self.teclasJugador()
		self.impactoEnJugador()
	}
	
	method impactoEnJugador() {
		game.whenCollideDo(jugador, { enemigoODisparo => 
			game.sound("explosion.wav").play()
			finDeJuego.cargar()
		})	
	}
	
	method teclasJugador(){
		keyboard.space().onPressDo({ jugador.disparar() }) 
		keyboard.left().onPressDo({ jugador.moverPara(izquierda) })
		keyboard.right().onPressDo({ jugador.moverPara(derecha) })
	}
	
	method eliminarEnemigo(enemigo){
		if(nivel.enemigos().contains(enemigo)){
			game.sound("explosion.wav").play()
			puntuacion += enemigo.puntos()
			nivel.removerEnemigo(enemigo)
		}
		game.removeVisual(enemigo)
		self.validarVictoria()
		self.validarDificultad()
	}
	
	method validarVictoria() {	
		 if(nivel.enemigos().isEmpty()){
				nivel.completar()	
		}			
	}
	
	method restart() {
		puntuacion = 0
		nivel.restart()	
		nivel = nivelUno
		self.comenzar()
	}
	
	method validarDificultad() {
		 if(nivel.cantidadEnemigos() < 10){
				nivel.aumentarDificultad()
		}	
	}
}