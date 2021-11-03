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
	
	method moverDisparo() {
		if(game.hasVisual(disparo))
			disparo.mover(disparo)
			self.validarDisparo() 
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
	}
	
	method alCombate()
}

class Enemigo1 inherits Enemigo{
	
	const mensajes = ["¡A LA CARGA!", "¡MORIRAS!", "¡RINDETE!"]
	
	override method alCombate(){
		game.say(self, mensajes.anyOne())
	}
	
	
}

class Enemigo2 inherits Enemigo{
	
	const comunicaciones = ["voz1.wav", "voz2.wav", "voz3.wav", "voz4.wav"]
	
	override method alCombate(){
		game.sound(comunicaciones.anyOne()).play()
		game.say(self, "?#%)?!3#@:=?$")
	}

}

class Enemigo3 inherits Enemigo{
	
	override method alCombate() {
		if (image.equals("ufo1.gif")) 
			image = "ufo2.png"			
		else{		
			image = "ufo1.gif"			
		}
		//game.sound("transformacion.wav").play()
	} 

}