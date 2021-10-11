import disparo.*
import wollok.game.*
import juego.*

object jugador{
	var property position = game.at(6,0)
	var property image = "player.gif"
	var disparo = null
	
	method disparar() {
		if(disparo == null || !game.hasVisual(disparo)){
			game.sound("photon.wav")
			disparo = new DisparoJugador(position = position.up(1), image = "shot1.gif")			
			game.addVisual(disparo)		
		}	  
	}
	
	method moverDisparo() {
		if(disparo != null && game.hasVisual(disparo))
			disparo.mover(disparo) 
	}
	
	method impactarDisparo() {
		if(disparo != null && game.hasVisual(disparo)){
			game.whenCollideDo(disparo, { enemigo => 
				juego.eliminarEnemigo(enemigo)
				disparo.salirDeEscena()			
				})		
		}	
	}
	
	method validarMovimientoHorizontal(){
		if (position.y() > 0) 
			position = game.at(position.x(),0)  
	}
	
	method validarDisparo() {
		if(disparo != null && game.hasVisual(disparo))
		 	disparo.validar()
	}
		
}
