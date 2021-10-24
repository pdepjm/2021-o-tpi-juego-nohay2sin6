import disparo.*
import wollok.game.*
import juego.*

object jugador{
	var property position = game.at(6,0)
	var property image = "player.gif"
	var disparo = null
	
	method disparar() {
		if(disparo == null || !game.hasVisual(disparo)){
			game.sound("disparo.wav").play()
			disparo = new DisparoJugador(position = position.up(1), image = "shot1.gif")			
			game.addVisual(disparo)		
		}	  
	}
	
	method disparo(){
		return disparo
	}
	
	method posicion(){
		return position
	}
	
	method moverPara(direccion) {
		position = direccion.proximaPosicion(position)
		self.validarMovimientoLateral() 
	}
	
	method validarMovimientoLateral() {
		if(position.x() < 0 ){
			position = game.at(0,position.y())
		}else if(position.x() > 13 ){
			position = game.at(13,position.y())
		}
	}
	
	method moverDisparo() {
		if(disparo != null && game.hasVisual(disparo))
			disparo.mover(disparo)
			self.impactarDisparo()
			self.validarDisparo() 
	}
	
	method impactarDisparo() {
		if(disparo != null && game.hasVisual(disparo)){
			game.whenCollideDo(disparo, { enemigo => 
				juego.eliminarEnemigo(enemigo)
				disparo.salirDeEscena()			
				})		
		}	
	}
	
	method validarDisparo() {
		if(disparo != null && game.hasVisual(disparo))
		 	disparo.validar()
	}
		
}
