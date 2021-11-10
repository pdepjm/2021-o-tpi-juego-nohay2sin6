import nivelDeJuego.*
import finDeJuego.*
import enemigos.*
import wollok.game.* 
import jugador.*
import direcciones.*
import sonido.*

object juego {
	var property puntuacion = 0
	var property nivel = nivelUno
	
	method comenzar() {
		game.clear()
		game.addVisual(jugador)
		
		nivel.cargarEnemigos()
		nivel.disparosEnemigos()		 
		
		game.onTick(0, "moverDisparoJugador",{ 
			if(jugador.disparo() != null){jugador.disparo().mover()}})
		game.onTick(5000, "enemigosCombatir",{ nivel.combatir() })
	
		self.teclasJugador()
		self.impactoEnJugador()
	}
	
	method impactoEnEnemigo() {
		if(jugador.disparo() != null && game.hasVisual(jugador.disparo())){
			game.onCollideDo(jugador.disparo(), { enemigo => 
				self.eliminarEnemigo(enemigo)
				jugador.disparo().salirDeEscena()			
				})		
		}	
	}
	
	
	method impactoEnJugador() {
		game.onCollideDo(jugador, { enemigoODisparo => 
			soundProducer.sound("explosion.wav").play()
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
			soundProducer.sound("explosion.wav").play()
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