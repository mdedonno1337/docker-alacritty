Alacritty - Compiled without installing rust
============================================

This docker build allows you to compile the latest version of alacritty without having to install rust or any dependencies.
The outputted binary is placed in the current directory after build.

Building the binary this way has the avantages of building the alacritty terminal from source and remove more than 30Mo (from the original 40Mo) from the final binary.

Docker is only needed to build the binary, not to run the binary itself.

