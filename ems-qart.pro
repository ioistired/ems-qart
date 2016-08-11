QT += quick widgets svg concurrent

CONFIG += c++11 windows release link_pkgconfig
PKGCONFIG += libusb-1.0

TARGET = ems-qart

DEFINES += QT_NO_CAST_FROM_ASCII

HEADERS = src/CartController.h src/EmsCart.h src/RomInfo.h
SOURCES = src/main.cpp src/CartController.cpp src/EmsCart.cpp src/RomInfo.cpp
RESOURCES = resources.qrc

isEmpty(PREFIX) {
    UDEV_PREFIX = /etc
    PREFIX = /usr/local
} else {
    UDEV_PREFIX = /lib
}

unix:udevrules.path = $$UDEV_PREFIX/udev/rules.d/
unix:udevrules.files = 50_ems_gb_flash.rules

unix:target.path = $$PREFIX/bin/
INSTALLS += target udevrules
