DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )";
USER=$(whoami);
if [ $USER == "root" ]
    then
	echo "Do not run as root"
	exit 1
fi

FIND=$(find /usr/bin -mindepth 1 ! -type l | grep 'doas\|sudo')
if [ $FIND == "/usr/bin/doas" ] 
    then
        PERM="doas"
    else
        PERM="sudo"
fi

echo "Installing Deps (Ensure yay is installed)";
$PERM pacman -S feh flameshot xorg-server libx11 libxinerama libxft webkit2gtk xorg-xinit pamixer fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-mozc ttf-roboto-mono alacritty --needed --noconfirm;
$PERM yay -S ttf-meslo ttf-symbola --noconfirm --needed;
echo "Installing Icon Font";
$PERM cp $DIR/baricons/fonts/icomoon.ttf /usr/share/fonts/TTF;
$PERM fc-cache -fv;
echo "Compiling DWM";
$PERM make clean install -C $DIR/dwm-6.2;
echo "Compiling DMenu";
$PERM make clean install -C $DIR/dmenu-5.0;
echo "Compiling st";
$PERM make clean install -C $DIR/st-0.8.4;
echo "Compiling Bar";
$PERM make install -C $DIR/dwm-bar;
echo "Cping alacritty config";
$PERM mkdir -p /home/$USER/.config/alacritty;
$PERM cp $DIR/alacritty.yml /home/$USER/.config/alacritty/alacritty.yml;
echo "Cping .xinitrc";
cp $DIR/.xinitrc /home/$USER/.xinitrc;
echo "Done";
echo $DIR;
