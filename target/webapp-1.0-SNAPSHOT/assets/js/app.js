/* ===================================== CÓDIGO DE EL SLIDER =============================== */
const slider = document.querySelectorAll('.slider');
const btns = document.querySelectorAll('.btn');
let currentSlider = 1;

const sliderManual = (index) => {

    slider.forEach(slides => {
        slides.classList.remove('active');

        btns.forEach(btn => {
            btn.classList.remove('active');
        });
    });

    slider[index].classList.add('active');
    btns[index].classList.add('active');
}

btns.forEach((btn, i) => {
    btn.addEventListener('click', () => {
        sliderManual(i);
        currentSlider = i;
    })
})

//slider automatico

const sliderAuto = () => {
    const classActive = document.getElementsByClassName('active');
    let i = 1;

    const repetir = () => {
        setTimeout(() => {
            [...classActive].forEach(activeSlider => {
                activeSlider.classList.remove('active');
            })

            slider[i].classList.add('active');
            btns[i].classList.add('active');
            i++;

            if (slider.length == i) {
                i = 0;
            }
            if (i >= slider.length) {
                return;
            }

            repetir();

        }, 10000)
    }
    repetir();
}
sliderAuto();

/*========================================= INDICADORES ============================================ */
//variables para acceder a los elementos
const btnIrArriba = document.getElementById('ir-arriba');
const scrollHorizontal = document.querySelector('.indicador-scroll');

//saber el desplazamiento desde la parte superior hasta donde vamos con el scroll
//document.documentElement.scrollTop    

const scroll = () => {
    let scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
    if (scrollTop > 0) {
        window.requestAnimationFrame(scroll);
        // btnIrArriba.classList.add('mostrar');
        // btnIrArriba.classList.remove('ocultar');
        scrollTo(0, scrollTop - (scrollTop / 20));
    } else {
        // btnIrArriba.classList.remover('mostrar');
        // btnIrArriba.classList.add('ocultar');
    }
}

btnIrArriba.addEventListener('click', scroll);

window.addEventListener('scroll', () => {
    let scroll = document.documentElement.scrollTop || document.body.scrollTop;
    if (scroll > 50) {
        btnIrArriba.classList.add('mostrar');
        btnIrArriba.classList.remove('ocultar');
    } else {
        btnIrArriba.classList.remove('mostrar');
        btnIrArriba.classList.add('ocultar');
    }

    //     //indicar el scroll con l barra horizontal
    //     //scrollHeight: scroll total
    //     //clientHeight: scroll que lleva el cliente

    let alto = document.documentElement.scrollHeight - document.documentElement.clientHeight;
    let avanceScroll = (scroll / alto) * 100;
    scrollHorizontal.style.width = `${avanceScroll}%`;
});
