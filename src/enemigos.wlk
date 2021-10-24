import disparo.*
import wollok.game.*
import juego.*

class Enemigo{
	var property position
	var property image
	const posicionDerecha
	const posicionIzquierda
	var property disparo = new DisparoEnemigo(position = null, image = "bomb.png")
	const property puntos = 0
	
	method disparar(){
		if(!game.hasVisual(disparo) && game.hasVisual(self)){
			disparo.position(self.position().down(1))
			game.addVisual(disparo)
		}	
	}
	
	method disparo(){
		return disparo
	}
	method moverDisparo() {
		if(game.hasVisual(disparo))
			disparo.mover(disparo) 
	}
	
	method validarDisparo() {
		if(game.hasVisual(disparo))
			disparo.validar() 
	}
	
	method mover() {
		if (position.y().even() && position.x() > posicionIzquierda)
			position = position.left(1)
		else if (position.y().odd() && position.x() < posicionDerecha) 
				position = position.right(1)			
			else{		
				position = position.down(1)
			}
		self.cambiarImagen()
	}
	
	method cambiarImagen()
	
	method victoria() = position.y() == 0
}

class Enemigo1 inherits Enemigo{
	
	override method cambiarImagen() {
		if (image.equals("invader1.gif")) 
			image = "invader2.gif"			
		else{		
			image = "invader1.gif"			
		} 
	} 
}

class Enemigo2 inherits Enemigo{
	
	override method cambiarImagen() {
		if (image.equals("invader3.gif")) 
			image = "invader4.gif"			
		else{		
			image = "invader3.gif"			
		} 
	} 
}

class Enemigo3 inherits Enemigo{
	
	override method cambiarImagen() {
		if (image.equals("ufo1.gif")) 
			image = "ufo2.gif"			
		else{		
			image = "ufo1.gif"			
		} 
	} 
}