## Build Linux 5.10.120-zynqmp-fpga-trial

CURRENT_DIR=`pwd`
KERNEL_REPO=ZynqMP-FPGA-Linux-5.10-Trial
KERNEL_VERSION=5.10.120
LOCAL_VERSION=zynqmp-fpga-trial
BUILD_VERSION=16
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

cp "${KERNEL_SOURCE}/linux-image-${KERNEL_RELEASE}_${KERNEL_RELEASE}-${BUILD_VERSION}_arm64.deb"   ./files/
cp "${KERNEL_SOURCE}/linux-headers-${KERNEL_RELEASE}_${KERNEL_RELEASE}-${BUILD_VERSION}_arm64.deb" ./files/

### Copy devicetree for KV260

TARGET_PATH="target/Kv260/boot"
TARGET_DTB="${TARGET_PATH}/devicetree-${KERNEL_RELEASE}-kv260-revB.dtb"
TARGET_DTS="${TARGET_PATH}/devicetree-${KERNEL_RELEASE}-kv260-revB.dts"
SOURCE_DTB="${KERNEL_SOURCE}/devicetrees/${KERNEL_RELEASE}-${BUILD_VERSION}/zynqmp-kv260-revB.dtb"

install -d $TARGET_PATH
cp $SOURCE_DTB $TARGET_DTB
dtc -I dtb -O dts -@ -o $TARGET_DTS $TARGET_DTB

### Copy devicetree for Ultra96

TARGET_PATH="target/Ultra96/boot"
TARGET_DTB="${TARGET_PATH}/devicetree-${KERNEL_RELEASE}-ultra96.dtb"
TARGET_DTS="${TARGET_PATH}/devicetree-${KERNEL_RELEASE}-ultra96.dts"
SOURCE_DTB="${KERNEL_SOURCE}/devicetrees/${KERNEL_RELEASE}-${BUILD_VERSION}/avnet-ultra96-rev1.dtb"

install -d $TARGET_PATH
cp $SOURCE_DTB $TARGET_DTB
dtc -I dtb -O dts -@ -o $TARGET_DTS $TARGET_DTB

### Copy devicetree for Ultra96-V2

TARGET_PATH="target/Ultra96-V2/boot"
TARGET_DTB="${TARGET_PATH}/devicetree-${KERNEL_RELEASE}-ultra96v2.dtb"
TARGET_DTS="${TARGET_PATH}/devicetree-${KERNEL_RELEASE}-ultra96v2.dts"
SOURCE_DTB="${KERNEL_SOURCE}/devicetrees/${KERNEL_RELEASE}-${BUILD_VERSION}/avnet-ultra96v2-rev1.dtb"

install -d $TARGET_PATH
cp $SOURCE_DTB $TARGET_DTB
dtc -I dtb -O dts -@ -o $TARGET_DTS $TARGET_DTB

