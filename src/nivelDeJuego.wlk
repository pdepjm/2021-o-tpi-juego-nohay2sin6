import enemigos.*
import finDeJuego.*
import wollok.game.*
import juego.*
import cartelNivel.*

class Nivel {
	var property dificultad = 0
	var property enemigos = []
	
	
	method cargarEnemigos() {
		enemigos.forEach { 
			enemigo => game.addVisual(enemigo) 
			game.onTick(dificultad, "mover",{ enemigo.mover() })
			game.onTick(500, "moverDisparo",{ enemigo.moverDisparo() })
		}	
	}
	
	method combatir(){
		enemigos.anyOne().alCombate()
	}
	
	method removerEnemigo(enemigo) {
			enemigos.remove(enemigo)
	}
	
	method disparosEnemigos() {
		self.dispararEnemigo(1000)
		self.dispararEnemigo(2500)
		self.dispararEnemigo(7500)
	}
	
	method dispararEnemigo(tiempo) {
		game.onTick(tiempo, "disparar",{ 
			if(!enemigos.isEmpty()){
				enemigos.anyOne().disparar()
			}
		})
	}
	
	method restart(){
		enemigos = []	
	}
	
	method aumentarDificultad()
	
	method completar()
}

object nivelUno inherits Nivel{

	
	override method cargarEnemigos() {
		dificultad = 8000
		
		11.times({i => 
			enemigos.add(new Enemigo1 (position = game.at(i+1,9), image = "invader1.gif", posicionDerecha = i+2, posicionIzquierda = i, puntos = 50))
			enemigos.add(new Enemigo2 (position = game.at(i+1,10), image = "invader3.gif", posicionDerecha = i+2, posicionIzquierda = i, puntos = 100))
			enemigos.add(new Enemigo3 (position = game.at(i+1,11), image = "ufo1.gif", posicionDerecha = i+2, posicionIzquierda = i, puntos = 150))
		})
		super()

	}
	
	override method aumentarDificultad() {
		dificultad = 1000
	}
	
	override method completar(){
		game.clear()
		game.addVisual(new CartelNivel(image = "level2.png"))
		game.schedule(500,{ 
			juego.nivel(nivelDos)			
			juego.comenzar()
		})	
	}	

}

object nivelDos inherits Nivel{

	
	override method cargarEnemigos() {
		dificultad = 2000
		
		7.times({i => 
			enemigos.add(new Enemigo1 (position = game.at(i+3,6), image = "invader1.gif", posicionDerecha = i+4, posicionIzquierda = i+2, puntos = 50))
			enemigos.add(new Enemigo2 (position = game.at(i+3,7), image = "invader3.gif", posicionDerecha = i+4, posicionIzquierda = i+2, puntos = 100))
			enemigos.add(new Enemigo3 (position = game.at(i+3,8), image = "ufo1.gif", posicionDerecha = i+4, posicionIzquierda = i+2, puntos = 150))
		})
		super()

	}
	
	override method aumentarDificultad() {
		dificultad = 1000
	}
		
	override method completar(){
		game.clear()
		game.addVisual(new CartelNivel(image = "level3.png"))
		game.schedule(500,{ 
			juego.nivel(nivelTres)			
			juego.comenzar()
		})	
	}	
}

object nivelTres inherits Nivel{

	
	override method cargarEnemigos() {
		dificultad = 10000
		
		4.times({i =>
			enemigos.add(new Enemigo1 (position = game.at(2,14-i), image = "invader1.gif", posicionDerecha = 3, posicionIzquierda = 1, puntos = 50))
			enemigos.add(new Enemigo3 (position = game.at(6,14-i), image = "ufo1.gif", posicionDerecha = 7, posicionIzquierda = 5, puntos = 150))
			enemigos.add(new Enemigo2 (position = game.at(10,14-i), image = "invader3.gif", posicionDerecha = 11, posicionIzquierda = 9, puntos = 100))
			enemigos.add(new Enemigo3 (position = game.at(5,9-i), image = "ufo1.gif", posicionDerecha = 6, posicionIzquierda = 4, puntos = 150))
			enemigos.add(new Enemigo3 (position = game.at(7,9-i), image = "ufo1.gif", posicionDerecha = 8, posicionIzquierda = 6, puntos = 150))
			enemigos.add(new Enemigo3 (position = game.at(13,9-i), image = "ufo1.gif", posicionDerecha = 14, posicionIzquierda = 12, puntos = 150))
		})
		3.times({i =>
			enemigos.add(new Enemigo1 (position = game.at(4,14-i), image = "invader1.gif", posicionDerecha = 5, posicionIzquierda = 3, puntos = 50))
			enemigos.add(new Enemigo2 (position = game.at(12,14-i), image = "invader3.gif", posicionDerecha = 13, posicionIzquierda = 11, puntos = 100))
		})
		2.times({i =>
			enemigos.add(new Enemigo1 (position = game.at(3,15-2*i), image = "invader1.gif", posicionDerecha = 4, posicionIzquierda = 2, puntos = 50))
			enemigos.add(new Enemigo3 (position = game.at(7,16-3*i), image = "ufo1.gif", posicionDerecha = 8, posicionIzquierda = 6, puntos = 150))
			enemigos.add(new Enemigo2 (position = game.at(11,15-2*i), image = "invader3.gif", posicionDerecha = 12, posicionIzquierda = 10, puntos = 100))
			enemigos.add(new Enemigo3 (position = game.at(8,13-i), image = "ufo1.gif", posicionDerecha = 9, posicionIzquierda = 7, puntos = 150))
			enemigos.add(new Enemigo1 (position = game.at(1,7-i), image = "invader1.gif", posicionDerecha = 2, posicionIzquierda = 0, puntos = 50))
			enemigos.add(new Enemigo1 (position = game.at(2,9-i), image = "invader1.gif", posicionDerecha = 3, posicionIzquierda = 1, puntos = 50))
			enemigos.add(new Enemigo1 (position = game.at(3,11-3*i), image = "invader1.gif", posicionDerecha = 4, posicionIzquierda = 2, puntos = 50))
			enemigos.add(new Enemigo3 (position = game.at(6,11-3*i), image = "ufo1.gif", posicionDerecha = 7, posicionIzquierda = 5, puntos = 150))
			enemigos.add(new Enemigo2 (position = game.at(9,7-i), image = "invader3.gif", posicionDerecha = 10, posicionIzquierda = 8, puntos = 100))
			enemigos.add(new Enemigo2 (position = game.at(10,9-i), image = "invader3.gif", posicionDerecha = 11, posicionIzquierda = 9, puntos = 100))
			enemigos.add(new Enemigo2 (position = game.at(11,11-3*i), image = "invader3.gif", posicionDerecha = 12, posicionIzquierda = 10, puntos = 100))
		})
		enemigos.add(new Enemigo1 (position = game.at(1,8), image = "invader1.gif", posicionDerecha = 2, posicionIzquierda = 0, puntos = 50))
		enemigos.add(new Enemigo1 (position = game.at(2,5), image = "invader1.gif", posicionDerecha = 3, posicionIzquierda = 1, puntos = 50))
		enemigos.add(new Enemigo2 (position = game.at(9,8), image = "invader3.gif", posicionDerecha = 10, posicionIzquierda = 8, puntos = 100))
		enemigos.add(new Enemigo2 (position = game.at(10,5), image = "invader3.gif", posicionDerecha = 11, posicionIzquierda = 9, puntos = 100))
		
		super()

	}
	
	override method aumentarDificultad() {
		dificultad = 500
	}
	
	override method completar(){
		finDeJuego.cargar()
	}	

}