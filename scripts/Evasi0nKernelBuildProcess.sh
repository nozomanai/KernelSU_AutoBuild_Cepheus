KERNEL_SOURCE=$1
KERNEL_SOURCE_BRANCH=$2
KERNEL_DEFCONFIG=$3
KERNEL_NAME=$4

echo kernel source : $KERNEL_SOURCE
echo kernel source bach : $KERNEL_SOURCE_BRANCH
echo kernel defconfig : $KERNEL_DEFCONFIG
echo kernel name : $KERNEL_NAME

echo download kernel source
cd $GITHUB_WORKSPACE && mkdir kernel_workspace && cd kernel_workspace
git clone $KERNEL_SOURCE -b $KERNEL_SOURCE_BRANCH android-kernel --depth=1

echo delete yaml scrpit
rm $GITHUB_WORKSPACE/kernel_workspace/android-kernel/scripts/dtc/yamltree.c
cp $GITHUB_WORKSPACE/patch/EcrosoftXiao_kernel/scripts/dtc/* $GITHUB_WORKSPACE/kernel_workspace/android-kernel/scripts/dtc


echo add kernelsu
cd $GITHUB_WORKSPACE/kernel_workspace/android-kernel
echo "CONFIG_KPROBES=y" >> arch/arm64/configs/$KERNEL_DEFCONFIG
echo "CONFIG_HAVE_KPROBES=y" >> arch/arm64/configs/$KERNEL_DEFCONFIG
echo "CONFIG_KPROBE_EVENTS=y" >> arch/arm64/configs/$KERNEL_DEFCONFIG

#curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -
git clone https://github.com/nozomanai/KernelSU.git
bash KernelSU/kernel/setup.sh

echo change build config
cd $GITHUB_WORKSPACE/kernel_workspace/android-kernel
rm .git -R
sed -i '/supported.versions.*/d' anykernel.sh
sed -i '/do.devicecheck.*/d' anykernel.sh

sed -i "s/KERNEL_NAME=.*/KERNEL_NAME=${KERNEL_NAME}-"$(date "+%Y%m%d%H%M%S")"/g" build.sh


# echo build kernel
# cd $GITHUB_WORKSPACE/kernel_workspace/android-kernel
# sudo bash build.sh
# pwd
