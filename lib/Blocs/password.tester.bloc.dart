validarDados(textFieldController) {
  String senha = textFieldController.text;
  int forca = 0;

  if ((senha.length >= 4) && (senha.length <= 7)) {
    forca += 10;
  } else if (senha.length > 7) {
    forca += 25;
  }
  if ((senha.length >= 5) && (senha.contains(new RegExp(r'[a-z]')))) {
    forca += 10;
  }
  if ((senha.length >= 6) && (senha.contains(new RegExp(r'[A-Z]')))) {
    forca += 20;
  }
  if ((senha.length >= 5) && (senha.contains(new RegExp(r'[@#$%^&*_]')))) {
    forca += 25;
  }

  mostrarFoorca(forca);
}

mostrarFoorca(forca) {
  if (forca < 30) {
    print('Senha Fraca, Força: $forca');
  } else if ((forca >= 30) && (forca < 50)) {
    print('Senha Media, Força: $forca');
  } else if ((forca >= 50) && (forca < 70)) {
    print('Senha Forte, Força: $forca');
  } else if ((forca >= 70) && (forca < 100)) {
    print('Senha Exelente, Força: $forca');
  }
}
