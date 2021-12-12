DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
get_perm () {
    FIND=$(find . / -mindepth 1 ! -type l)
    if [ $FIND == "/usr/bin/doas" ] 
        then
            PERM="doas"
        else
            PERM="sudo"
    fi
}  
echo "Installing Deps (Ensure yay is installed)";
pacman -S feh flameshot xorg xorg-xinit pamixer fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-mozc ttf-roboto-mono --needed --noconfirm;
yay -S ttf-meslo ttf-symbola --noconfirm --needed;
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
echo "Cping .xinitrc";
cp $DIR/.xinitrc ~/.xinitrc;
echo "Done";
echo $DIR;
