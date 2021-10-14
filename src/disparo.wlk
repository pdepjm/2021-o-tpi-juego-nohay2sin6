import wollok.game.*

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
	method mover(disparo)
	
}

class DisparoJugador inherits Disparo{
	
	override method mover(disparo) { 
		if(game.hasVisual(disparo)){
			position = position.up(1)
			if (image.equals("shot1.gif"))
				image = "shot2.gif"
					else
						image = "shot1.gif"
		}
	}
	
	override method fueraDeEscena() = position.y() > 13

}

class DisparoEnemigo inherits Disparo{ 
	
	override method mover(disparo) {
		position = position.down(1)	
	}
	
	override method fueraDeEscena() = position.y() < 0

}
