import wollok.game.*
import jugador.*

class Disparo{
	var property position
	var property image
	
	method position(posicion) {
		position = posicion
	}
	
	method posicion(){
		return position
	}
	
	method validar() {
		if (self.fueraDeEscena())
			game.removeVisual(self)
	}
	
	method salirDeEscena() {
		if(game.hasVisual(self))
			position = position.up(14)
	}
	
	method fueraDeEscena()
	method mover()
	
}

class DisparoJugador inherits Disparo{
	
	override method mover() { 
		if(jugador.disparo() != null && game.hasVisual(self)){
			position = position.up(1)
			if (image.equals("shot1.gif")){
				image = "shot2.gif"
			} else {
				image = "shot1.gif"
				}
		}
		self.validar()
	}
	
	override method validar() {
		if(jugador.disparo() != null && game.hasVisual(self)){
			super()
		}
	}
	
	override method fueraDeEscena() = position.y() > 13

}

class DisparoEnemigo inherits Disparo{ 
	
	override method mover() {
		if(game.hasVisual(self)){
			position = position.down(1)
			self.validar()
		}
	}
	
	override method validar() {
		if(game.hasVisual(self)){
			super()
		}
	}
	
	override method fueraDeEscena() = position.y() < 0

}
