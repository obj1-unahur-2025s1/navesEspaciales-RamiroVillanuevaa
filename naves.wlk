class Naves{
  var direccion
  var velocidad

  method acelerar(cuanto) {
    velocidad = 10000.min(velocidad + cuanto) 
  }

  method desacelerar(cuanto) {
    velocidad = 0.max(velocidad - cuanto) 
  }
  
  method irHaciaElSol() {
    direccion = 10
  }

  method escaparDelSol() {
    direccion = -10
  }

  method ponerseParaleloAlSol() {
    direccion = 0
  }

  method acercarseUnPocoAlSol() {
    direccion = 10.min(direccion + 1)
  }

  method alejarseUnPocoDelSol() {
    direccion = (-10).max(direccion - 1)
  }

  method prepararViaje() //abstracto porque cada subclase lo implementa de forma diferente

  
}

//const nave1 = new Nave(velocidad=1000, direccion=0)
//const nave2 = new NaveBaliza(velocidad=1000, direccion=10, color="rojo")

class NavesBaliza inherits Naves{
  var color

  method cambiarColorDeBaliza(colorNuevo) {
    color = colorNuevo
  }

  override method prepararViaje() { //sobreescribiendo el metodo abstracto de la clase padre "NAVE" solo para NAVE BALIZA
    self.cambiarColorDeBaliza("verde")
    self.ponerseParaleloAlSol()
  }
}



class NavesPasajeros inherits Naves{
  var pasajeros
  var racionesComida = 0
  var racionesBebida = 0

  method haySuficienteComida(cantidad) = racionesComida >= cantidad
  method haySuficienteBebida(cantidad) = racionesBebida >= cantidad 

  method cargarRacionesComida(cantidad) {racionesComida += cantidad}
  method descargarRacionesComida(cantidad) {racionesComida = 0.max(racionesComida - cantidad)}

  method cargarRacionesBebida(cantidad) {racionesBebida += cantidad}
  method descargarRacionesBebida(cantidad) {racionesBebida = 0.max(racionesBebida - cantidad)}

  override method prepararViaje() { //sobreescribiendo el metodo abstracto de la clase padre "NAVE" solo para NAVE PASAJEROS
    self.cargarRacionesComida(4 * pasajeros)
    self.cargarRacionesBebida(6 * pasajeros)
    self.acercarseUnPocoAlSol()
  }
}

class NavesCombate inherits Naves{
  var estaInvisible = true
  var misilesDesplegados = true
  const mensajes = []

  method ponerseVisible() {estaInvisible = false}
  method ponerseInvisible() {estaInvisible = true}
  method estaInvisible() = estaInvisible
 
  method desplegarMisiles() {misilesDesplegados = true}
  method replegarMisiles() {misilesDesplegados = false}
  method misilesDesplegados() = misilesDesplegados  

  method emitirMensaje(mensaje) {
    mensajes.add(mensaje)
  }
  method mensajeEmitido() = mensajes

  method primerMensajeEmitido() {   
    if(mensajes.isEmpty()){
      self.error("lista de mensajes vacia")
    }
    return mensajes.first()
  } 

  method ultimoMensajeEmitido() {
    if(mensajes.isEmpty()){
      self.error("lista de mensajes vacia")
    }
    return mensajes.last()
    }
    
  method esEscueta() = mensajes.length({m => m.size() >= 30}) //mensajes.all tambien es valido.}

  method emitioMnesaje(mensaje) = mensajes.contains(mensaje)
  

  override method prepararViaje() { //sobreescribiendo el metodo abstracto de la clase padre "NAVE" solo para NAVE COMBATE
    self.ponerseVisible()
    self.replegarMisiles()
    self.acelerar(15000)
    self.emitirMensaje("Saliendo en misión")
  }
}