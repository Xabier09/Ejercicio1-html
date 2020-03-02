const cvs = document.getElementById("serpiente");
const ctx = cvs.getContext("2d");

// Crear la unidad
// Const es para crear una variable que no se pueda cambiar con la reasignación

const caja = 32

//Cargar las imágenes

const zonaimg = new Image();
zonaimg.src = "Imágenes/zona.png";

const bolaimg = new Image();
bolaimg.src = "Imágenes/Bola.png";

// Cargar los sonidos

let fin = new Audio();
let comer = new Audio();
let up = new Audio();
let right = new Audio();
let left = new Audio();
let down = new Audio();

fin.src = "Sonidos/fin.mp3";
comer.src = "Sonidos/comer.mp3";
up.src = "Sonidos/arriba.mp3";
right.src = "Sonidos/derecha.mp3";
left.src = "Sonidos/izquierda.mp3";
down.src = "Sonidos/abajo.mp3";

//Crear la serpiente

let serpiente = [];
serpiente[0] = {
    x : 9 * caja,
    y : 10 * caja
}

//Crear la bola

let Bola = {
    x : Math.floor(Math.random()*17+1) * caja,
    y : Math.floor(Math.random()*15+3) * caja
}

// Crear la puntuación

let puntuación = 0;

//Controles serpiente

let d;

document.addEventListener("keydown",direction);

function direction(event){
    let key = event.keyCode;
    if( key == 37 && d != "DERECHA"){
        left.play();
        d = "IZQUIERDA";
    }else if(key == 38 && d != "ABAJO"){
        d = "ARRIBA";
        up.play();
    }else if(key == 39 && d != "IZQUIERDA"){
        d = "DERECHA";
        right.play();
    }else if(key == 40 && d != "ARRIBA"){
        d = "ABAJO";
        down.play();
    }
}

// Comprobar las colisiones

function collision(head,array){
    for(let i = 0; i < array.length; i++){
        if(head.x == array[i].x && head.y == array[i].y){
            return true;
        }
    }
    return false;
}


//Ponerlo todo en el canvas

function draw(){

    ctx.drawImage(zonaimg,0,0)

    for( let i = 0; i < serpiente.length ; i++){
        ctx.fillStyle = ( i == 0 )? "green" : "white";
        ctx.fillRect(serpiente[i].x,serpiente[i].y,caja,caja);
        
        ctx.strokeStyle = "red";
        ctx.strokeRect(serpiente[i].x,serpiente[i].y,caja,caja);
    }
    
    ctx.drawImage(bolaimg, Bola.x, Bola.y);
    
    // Antigua posición de la cabeza
    let serpienteX = serpiente[0].x;
    let serpienteY = serpiente[0].y;
    
    // Hacia qué dirección
    if( d == "IZQUIERDA") serpienteX -= caja;
    if( d == "ARRIBA") serpienteY -= caja;
    if( d == "DERECHA") serpienteX += caja;
    if( d == "ABAJO") serpienteY += caja;
    
    // En caso de que la serpiente coma
    // Si la cabeza de la serpiente está en la misma posición que la bola -->
    if(serpienteX == Bola.x && serpienteY == Bola.y){//Posición X de la serpiente = posición x de la bola y lo mismo con la posición y
        puntuación++;
        comer.play();
        Bola = {
            x : Math.floor(Math.random()*17+1) * caja,
            y : Math.floor(Math.random()*15+3) * caja
        }
        // No le quitamos la cola
    }else{
        // Le quitamos la cola (El código pop elimina la última entrada del array) para que no siga creciendo
        serpiente.pop();
    }
    
    // Añadir otra cabeza
    
    let nuevacabeza = {
        x : serpienteX,
        y : serpienteY
    }
    
    // Fin del juego
    
    if(serpienteX < caja || serpienteX > 17 * caja || serpienteY < 3*caja || serpienteY > 17*caja || collision(nuevacabeza,serpiente)){
        clearInterval(juego);
        fin.play();
    }
    
    serpiente.unshift(nuevacabeza);//unshift sirve para añadir la entrada definida al principio del array
    
    ctx.fillStyle = "white";
    ctx.font = "45px Changa one";
    ctx.fillText(puntuación,2*caja,1.6*caja);
}

// Llamar a la función "draw" cada 100 ms

let juego = setInterval(draw,100);
