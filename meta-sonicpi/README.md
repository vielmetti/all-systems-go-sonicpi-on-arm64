# meta-sonicpi

Yocto layer sonicpi 

## Description

This layer aims to run sonicpi on an 64 bit arm system.
It was done as part of the hackfest on All Systems Go! 2019.

## Dependencies

This layer depends on:

* URI: git://git.yoctoproject.org/poky
  * branch: master
  * revision: HEAD

* URI: git://git.openembedded.org/meta-openembedded
  * layers: meta-oe, meta-multimedia, meta-networking, meta-python,
    meta-gnome, meta-xfce
  * branch: master
  * revision: HEAD

* URI: git://git.yoctoproject.org/meta-raspberrypi
  * layers: meta-raspberrypi
  * branch: master
  * revision: HEAD

* URI: git://github.com:joaohf/meta-erlang.git
 * layers: meta-erlang
 * branch: master
 * revision: HEAD

* URI: git://github.com/meta-qt5/meta-qt5.git
 * layers: meta-qt5
 * branch: master
 * revision: HEAD

* URI: git://github.com/schnitzeltony/meta-musicians
 * layers: meta-musicians
 * branch: master
 * revision: HEAD

* URI: git://git.openembedded.org/meta-opie
 * layers: meta-opie
 * branch: master
 * revision: master

## Quick Start

In a clean directory:

```
git clone git://git.yoctoproject.org/poky
git clone git://git.openembedded.org/meta-openembedded
git clone git://git.yoctoproject.org/meta-raspberrypi
git clone git://github.com/meta-qt5/meta-qt5.git
git clone git://github.com/joaohf/meta-erlang.git
git clone git://github.com/schnitzeltony/meta-musicians
git clone git://git.openembedded.org/meta-opie
git clone git@github.com:vielmetti/all-systems-go-sonicpi-on-arm64
. poky/oe-init-build-env
```

At this point, the current directory will be `..../build`

Edit conf/bblayers.conf to hold these layers:

```
BBLAYERS ?= " \
  .../poky/meta \
  .../poky/meta-poky \
  .../poky/meta-yocto-bsp \
  .../meta-openembedded/meta-oe \
  .../meta-openembedded/meta-multimedia \
  .../meta-openembedded/meta-networking \
  .../meta-openembedded/meta-python \
  .../meta-openembedded/meta-gnome \
  .../meta-openembedded/meta-xcfe \
  .../meta-raspberrypi \
  .../meta-erlang \
  .../meta-qt5 \
  .../meta-musicians \
  .../meta-opie \
  .../all-systems-go-sonicpi-on-arm64/meta-sonicpi \
  "
```

Set the `MACHINE` in `conf/local.conf` by adding this as the last line:

```
MACHINE = "raspberrypi3-64"
```

4. bitbake core-image-base
5. dd to a SD card the generated sdimg file (use xzcat if rpi-sdimg.xz is used)
6. Boot your RPI.

## Maintainers

* @snogge Ola Nilsson <ola.nilsson@gmail.com> 

## Contributors

* @g-scott-murray Scott Murray
