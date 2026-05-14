#!/bin/sh
file="$1"
width="$2"
height="$3"
x="$4"
y="$5"

case "$file" in
    *.jpg|*.jpeg|*.png|*.gif|*.webp|*.bmp)
        # Limpieza previa de imágenes Kitty
        printf "\033_Gi=4095,a=d\033\\" > /dev/tty

        # Usamos chafa con el protocolo kitty
        # El '> /dev/tty' es obligatorio para saltarse el bloqueo de Wayland
        # Usamos --center=off para que respete la posición de lf
        kitten icat --stdin no --transfer-mode memory \ --place "${w}x${h}@${x}x${y}" "$1" </dev/null >/dev/tty $file
        # Salimos con 1 para que lf no intente dibujar texto encima
        exit 1
        ;;
    *.md)
        glow -s dark "$file"
        ;;
    *)
        batcat --color=always --style=plain "$file" 2>/dev/null || bat --color=always --style=plain "$file"
        ;;
esac
