## Build Linux 5.15.108-zynqmp-fpga-trial

CURRENT_DIR=`pwd`
KERNEL_REPO=ZynqMP-FPGA-Linux-Kernel-5.15
KERNEL_VERSION=5.15.108
LOCAL_VERSION=zynqmp-fpga-trial
BUILD_VERSION=2
KERNEL_RELEASE=$KERNEL_VERSION-$LOCAL_VERSION
KERNEL_SOURCE=$KERNEL_REPO-$KERNEL_RELEASE-$BUILD_VERSION

echo "KERNEL_REPO     =" $KERNEL_REPO
echo "KERNEL_RELEASE  =" $KERNEL_RELEASE
echo "BUILD_VERSION   =" $BUILD_VERSION
echo "KERNEL_SOURCE   =" $KERNEL_SOURCE

### Download Kernel Source

wget https://github.com/ikwzm/$KERNEL_REPO/archive/refs/tags/$KERNEL_RELEASE-$BUILD_VERSION.tar.gz
tar xfz $KERNEL_RELEASE-$BUILD_VERSION.tar.gz

### Copy Linux Kernel Image to this repository

cp "${KERNEL_SOURCE}/vmlinuz-${KERNEL_RELEASE}-${BUILD_VERSION}"      ./files/
cp "${KERNEL_SOURCE}/files/config-${KERNEL_RELEASE}-${BUILD_VERSION}" ./files/

### Copy Linux Image and Header Debian Packages to this repository

cp "${KERNEL_SOURCE}/linux-image-${KERNEL_RELEASE}_${KERNEL_RELEASE}-${BUILD_VERSION}_arm64.deb"   ./debian/
cp "${KERNEL_SOURCE}/linux-headers-${KERNEL_RELEASE}_${KERNEL_RELEASE}-${BUILD_VERSION}_arm64.deb" ./debian/

### Copy devicetree for KV260

sh "${KERNEL_SOURCE}/scripts/install-linux-${KERNEL_RELEASE}.sh" Kv260 -T -d target/Kv260/boot -v

### Copy devicetree for KR260

sh "${KERNEL_SOURCE}/scripts/install-linux-${KERNEL_RELEASE}.sh" Kr260 -T -d target/Kr260/boot -v

### Copy devicetree for Ultra96

sh "${KERNEL_SOURCE}/scripts/install-linux-${KERNEL_RELEASE}.sh" Ultra96 -T -d target/Ultra96/boot -v

### Copy devicetree for Ultra96-V2

sh "${KERNEL_SOURCE}/scripts/install-linux-${KERNEL_RELEASE}.sh" Ultra96-V2 -T -d target/Ultra96-V2/boot -v
