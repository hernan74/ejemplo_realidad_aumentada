import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String texto;
  final Function onPressed;
  final IconData icono;
  final double iconoSize;
  final bool botonLadoDerecho;
  final EdgeInsetsGeometry padding;
  final double altoMaximo;
  final double anchoMaximo;
  const ButtonWidget(
      {@required this.texto,
      this.onPressed,
      this.icono,
      this.botonLadoDerecho = false,
      EdgeInsetsGeometry padding,
      this.iconoSize,
      this.altoMaximo,
      this.anchoMaximo})
      : this.padding = padding ?? const EdgeInsets.symmetric(horizontal: 45);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: this.anchoMaximo,
      height: this.altoMaximo,
      child: RawMaterialButton(
          splashColor: Colors.blueAccent,
          padding: this.padding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///Agrega el icono si no es null y si [botonLadoIzquierdo] es true
              if (this.icono != null && !this.botonLadoDerecho) ...[
                Icon(
                  this.icono,
                  color: this.onPressed != null ? Colors.blue : Colors.grey,
                  size: this.iconoSize,
                ),
                SizedBox(width: this.icono != null ? size.width * 0.01 : 0)
              ],
              Text(
                this.texto,
                style: TextStyle(
                    fontSize: size.height * 0.02,
                    color: this.onPressed != null ? Colors.blue : Colors.grey),
              ),

              ///Agrega el icono si no es null y si [botonLadoIzquierdo] es false
              if (this.icono != null && this.botonLadoDerecho) ...[
                SizedBox(
                  width: this.icono != null ? size.width * 0.01 : 0,
                ),
                Icon(this.icono,
                    color: this.onPressed != null ? Colors.blue : Colors.grey,
                    size: this.iconoSize)
              ],
            ],
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
                  color: this.onPressed != null
                      ? Colors.blueAccent.withOpacity(0.5)
                      : Colors.grey)),
          onPressed: this.onPressed),
    );
  }
}
