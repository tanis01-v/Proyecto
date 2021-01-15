function validar() {
    var nombre, claveUnica, aPaterno, aMaterno;
    let fechaNacimiento;
    nombre = document.getElementById("txtNombre").value;
    claveUnica = document.getElementById("txtClaveUnica").value;
    aPaterno = document.getElementById("txtAPaterno").value;
    aMaterno = document.getElementById("txtAMaterno").value;
    fechaNacimiento = document.getElementById("dteCalendar").value;

    if (nombre === "" || claveUnica === "" || aPaterno === "" || aMaterno === "" || fechaNacimiento === "") {
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
    else if (nombre.length < 3 || nombre.length > 30) {
        alert("El nombre solo acepta un rango de 3 a 30 caracteres");
        return false;
    }
    else if (aPaterno.length < 3 || aPaterno.length > 30) {
        alert("El Apellido Paterno solo acepta un rango de 3 a 30 caracteres");
        return false;
    }
    else if (aMaterno.length < 3 || aMaterno.length > 30) {
        alert("El Apellido Materno solo acepta un rango de 3 a 30 caracteres");
        return false;
    }

}

function validateYear(date) {
    if (date) {
        var date = new Date(date);
        if (date.getFullYear() > 2003)

            alert("No puedes registrarte ya que eres menor de edad");
    }
}