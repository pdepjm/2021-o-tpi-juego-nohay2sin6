import disparo.*
import wollok.game.*
import juego.*

class Enemigo{
	var property position
	var property image
	var property posicionDerecha
	var property posicionIzquierda
	var property disparo = new DisparoEnemigo(position = null, image = "bomb.png")
	
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
		if (position.y().even() && position.x() > self.posicionIzquierda())
			position = position.left(1)
		else if (position.y().odd() && position.x() < self.posicionDerecha() ) 
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
	const property puntos = 50
	
	override method cambiarImagen() {
		if (image.equals("invader1.gif")) 
			image = "invader2.gif"			
		else{		
			image = "invader1.gif"			
		} 
	} 
	
}

class Enemigo2 inherits Enemigo{
	const property puntos = 100
	
	override method cambiarImagen() {
		if (image.equals("invader3.gif")) 
			image = "invader4.gif"			
		else{		
			image = "invader3.gif"			
		} 
	} 
	
}

class Enemigo3 inherits Enemigo{
	const property puntos = 150
	var anterior = "ufo0.gif"
	
	override method cambiarImagen() {
		
		if (image.equals("ufo0.gif")){
			image = "ufo1.gif"
			anterior = "ufo0.gif"			
		}else{		
		if (image.equals("ufo4.gif")){ 
			image = "ufo3.gif"
			anterior = "ufo4.gif"								
		}else{		
		if (image.equals("ufo1.gif") && anterior.equals("ufo0.gif")){ 
			image = "ufo2.gif"
			anterior = "ufo1.gif"									
		}else{		
		if (image.equals("ufo1.gif") && anterior.equals("ufo2.gif")){ 
			image = "ufo0.gif"
			anterior = "ufo1.gif"			
		}else{		
		if (image.equals("ufo2.gif") && anterior.equals("ufo1.gif")){ 
			image = "ufo3.gif"
			anterior = "ufo2.gif"			
		}else{		
		if (image.equals("ufo2.gif") && anterior.equals("ufo3.gif")){ 
			image = "ufo1.gif"
			anterior = "ufo2.gif"			
		}else{		
		if (image.equals("ufo3.gif") && anterior.equals("ufo2.gif")){ 
			image = "ufo4.gif"
			anterior = "ufo3.gif"			
		}else{		
			image = "ufo2.gif"			
		} 
		} 
		} 
		} 				
		} 				
		} 		
		} 
	} 
	
}