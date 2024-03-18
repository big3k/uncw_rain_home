
6/16/2023

=======================================================================================
X11 fowarding
=======================================================================================
  TO enable X11 forwarding:
  1. Need to change /etc/ssh/sshd_config file setting. 
  2.  yum install xorg-x11-xauth xorg-x11-fonts-* xorg-x11-utils -y


=======================================================================================
Install Grads
=======================================================================================
0. Download:
   http://cola.gmu.edu/grads/2.2/grads-2.2.1-src.tar.gz

   Unpack, and everything is under grads-2.2.1/

1. Compile
---------------------------------------------------------------------------------
  cd grads-2.2.1/
  mkdir lib
  cd lib
  wget http://cola.gmu.edu/grads/Supplibs/2.2/builds/supplibs-centos7.3-x86_64.tar.gz
  tar xvfz supplibs-centos7.3-x86_64.tar.gz
  cd ..

  ./configure

  In src/config.h, turn off HDF5 support.


  make
  make  install


2. Run setup
---------------------------------------------------------------------------------
set up in .bash_profile:

export GADDIR-/data/software/GrADS-2.2.1/source/grads-2.2.1/data
export GAUDPT-/data/software/GrADS-2.2.1/source/grads-2.2.1/data/udpt

[yudong@forest bin]$ cat /data/software/GrADS-2.2.1/source/grads-2.2.1/data/udpt

# Type     Name     Full path to shared object file
# ----     ----     -------------------------------
gxdisplay  X11      /data/software/GrADS-2.2.1/source/grads-2.2.1/lib/libgxdX11.so
gxdisplay  Cairo    /data/software/GrADS-2.2.1/source/grads-2.2.1/lib/libgxdCairo.so
*
gxprint    GD       /data/software/GrADS-2.2.1/source/grads-2.2.1/lib/libgxpGD.so
gxprint    Cairo    /data/software/GrADS-2.2.1/source/grads-2.2.1/lib/libgxpCairo.so


3. Run
---------------------------------------------------------------------------------

Start with:

grads

# or

grads -d X11 -h GD


