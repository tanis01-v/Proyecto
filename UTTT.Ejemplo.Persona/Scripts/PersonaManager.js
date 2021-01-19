function SoloLetras(e)
{
	key = e.KeyCode || e.which;
	tecla = String.fromCharCode(key).toString();
	letras = "QWERTYUIOPASDFGHJKLÑZXCVBNMqwertyuiopasdfghjklñzxcvbnm";
	especiales = [8,13];
	tecla_especial = false;
	for (var i in especiales) {
	if (key == especiales[i]) {
	tecla_especial = true
	break;
	}
		
	}
	if (letras.indexOf(tecla) == -1 && !tecla_especial) {
		alert(¨solo letras¨);
		return false;
	}
}