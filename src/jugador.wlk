import disparo.*
import wollok.game.*
import juego.*
import sonido.*

object jugador{
	var property position = game.at(6,0)
	var property image = "player.gif"
	var property disparo = null
	
	method disparar() {
		if(disparo == null || !game.hasVisual(disparo)){
			soundProducer.sound("disparo.wav").play()
			disparo = new DisparoJugador(position = position.up(1), image = "shot1.gif")			
			game.addVisual(disparo)
			juego.impactoEnEnemigo()		
		}	  
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
}
