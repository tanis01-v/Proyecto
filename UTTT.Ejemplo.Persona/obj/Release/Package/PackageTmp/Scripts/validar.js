function validar() {
    var nombre, claveUnica, aPaterno, aMaterno;
    let fechaNacimiento;
    nombre = document.getElementById("txtNombre").value;
    claveUnica = document.getElementById("txtClaveUnica").value;
    aPaterno = document.getElementById("txtAPaterno").value;
    aMaterno = document.getElementById("txtAMaterno").value;
    correo = document.getElementById("txtCorreo").value;
    codigo = document.getElementById("txtCodigoPostal").value;
    rfc = document.getElementById("txtRFC").value;
    //fechaNacimiento = document.getElementById("dteCalendar").value;

    if (nombre === "" || claveUnica === "" || aPaterno === ""
        || aMaterno === "" || fechaNacimiento === ""
        || correo === "" || codigo === "" || rfc === "") {
        alert("Ingresa todos los campos de favor");
        return false;
    }
    else if (isNaN(claveUnica)) {
        alert("La clave unica solo acepta valores numericos");
        return false;
    }
    else if (claveUnica.length !== 3) {
        alert("La clave unica es unicamente de 3 valores");
        return false;
    }

    else if (isNaN(claveUnica)) {
        alert("La clave unica solo acepta valores numericos");
        return false;
    }
    else if (nombre.length < 3 || nombre.length > 15) {
        alert("El nombre solo acepta un rango de 3 a 15 caracteres");
        return false;
    }
    else if (aPaterno.length < 3 || aPaterno.length > 15) {
        alert("El Apellido Paterno solo acepta un rango de 3 a 15 caracteres");
        return false;
    }
    else if (aMaterno.length < 3 || aMaterno.length > 15) {
        alert("El Apellido Materno solo acepta un rango de 3 a 15 caracteres");
        return false;
    } 
}

