import enemigos.*
import finDeJuego.*
import wollok.game.*
import juego.*
import cartelNivel.*

class Nivel {
	var property dificultad = 0
	var property enemigos1 = []
	var property enemigos2 = []
	var property enemigos3 = []
	
	method todosLosEnemigos() = enemigos1 + enemigos2 + enemigos3
	
	method cargarEnemigos() {
		self.todosLosEnemigos().forEach { 
			enemigo => game.addVisual(enemigo) 
			game.onTick(dificultad, "mover",{ enemigo.mover() })
			game.onTick(500, "moverDisparo",{ enemigo.moverDisparo() })
			game.onTick(500, "validarDisparo",{ enemigo.validarDisparo() })
		}	
	}
	
	method removerEnemigo(enemigo) {
			enemigos1.remove(enemigo)
			enemigos2.remove(enemigo)
			enemigos3.remove(enemigo)
	}
	
	method cargarTiemposDeDisparo() {
		game.onTick(7000, "disparar",{ 
			if(!enemigos1.isEmpty()){
				enemigos1.anyOne().disparar()
			}
		})
		game.onTick(5000, "disparar",{ 
			if(!enemigos2.isEmpty()){
				enemigos2.anyOne().disparar()
			}
		})
		game.onTick(2500, "disparar",{ 
			if(!enemigos3.isEmpty()){
				enemigos3.anyOne().disparar()
			}
		})		
	}
	
	method restart(){
		enemigos1 = []
		enemigos2 = []
		enemigos3 = []		
	}
	
	method aumentarDificultad()
	
	method completar()
}

object nivelUno inherits Nivel{

	
	override method cargarEnemigos() {
		dificultad = 8000
		
		11.times({i => 
			enemigos1.add(new Enemigo1 (position = game.at(i+1,9), image = "invader1.gif", posicionDerecha = i+2, posicionIzquierda = i))
			enemigos2.add(new Enemigo2 (position = game.at(i+1,10), image = "invader3.gif", posicionDerecha = i+2, posicionIzquierda = i))
			enemigos3.add(new Enemigo3 (position = game.at(i+1,11), image = "ufo0.gif", posicionDerecha = i+2, posicionIzquierda = i))
		})
		super()

	}
	
	override method aumentarDificultad() {
		dificultad = 1000
	}
	
	override method completar(){
		finDeJuego.cargar()
	}	
	
	method unEnemigo(){
		return enemigos1.anyOne()
	}
	

}

// object nivelDos inherits Nivel
// object nivelTres inherits Nivel
