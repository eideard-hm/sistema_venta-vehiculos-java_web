const formRegistro = document.querySelector('#form');
const formLogin = document.querySelector('#form-login');

if (formRegistro) {
    formRegistro.addEventListener('submit', e => {
        e.preventDefault();

        validateForm();
    })
}

if (formLogin) {
    formLogin.addEventListener('submit', e => {
        e.preventDefault();
        validateForm();
    })
}

const validateForm = () => {
    const usuId = document.querySelector('#txtUsuario');
    const usupassword = document.querySelector('#txtPass');

    if (usuId.value.trim() === '' || usupassword.value.trim() === '') {
        Swal.fire('Campos obligatorios', 'Todos los campos son obligatorios!!', 'warning');
    } else {
        if (formRegistro) {
            registrar();
        } else {
            signIn();
        }
    }
}

/**
 * Función para hacer la petición al servlet para el registro de un usuario.
 * @returns {Promise<void>}
 */
const registrar = async () => {
    const formData = new FormData(formRegistro);
    // formData.forEach(item => console.log(item));
    const url = `${base_url}Usuario`;
    try {
        const req = await fetch(url, {
            method: 'POST',
            body: formData
        })
        const {status, msg} = await req.json();
        if (status) {
            Swal.fire('Usuario', msg, 'success');
        } else {
            Swal.fire('Error', msg, 'error');
        }
        formRegistro.reset();
    } catch (e) {
        console.error(e)
    }
}

/**
 * Función para hacer la petición de login al servlet controlador
 */

const signIn = async () => {
    const formData = new FormData(formLogin);
    const url = `${base_url}Usuario`;
    try {
        const req = await fetch(url, {
            method: 'POST',
            body: formData
        });
        const {status, msg} = await req.json();
        if (status) {
            if (msg === 'Comprador') {
                window.location.href = `${base_url}Comprador`;
            } else {
                window.location.href = `${base_url}Vendedor`;
            }
        } else {
            Swal.fire("Credenciales incorrectas", msg, "error");
        }
    } catch (e) {
        console.error(e);
    }
}