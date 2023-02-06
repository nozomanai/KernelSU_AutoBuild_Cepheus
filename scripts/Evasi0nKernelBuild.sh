echo param test
KERNEL_SOURCE=$0
echo $KERNEL_SOURCE
KERNEL_SOURCE_BRANCH=$1
echo $KERNEL_SOURCE_BRANCH 分支


# echo download kernel source
# cd $GITHUB_WORKSPACE && mkdir kernel_workspace && cd kernel_workspace
# git clone ${{ github.event.inputs.KERNEL_SOURCE }} -b ${{ github.event.inputs.KERNEL_SOURCE_BRANCH }} android-kernel --depth=1

# echo delete yaml scrpit
# rm $GITHUB_WORKSPACE/kernel_workspace/android-kernel/scripts/dtc/yamltree.c
# cp $GITHUB_WORKSPACE/patch/scripts/dtc/* $GITHUB_WORKSPACE/kernel_workspace/android-kernel/scripts/dtc

# echo add kernelsu
# cd $GITHUB_WORKSPACE/kernel_workspace/android-kernel
# echo "CONFIG_KPROBES=y" >> arch/arm64/configs/${{ github.event.inputs.KERNEL_DEFCONFIG }}
# echo "CONFIG_HAVE_KPROBES=y" >> arch/arm64/configs/${{ github.event.inputs.KERNEL_DEFCONFIG }}
# echo "CONFIG_KPROBE_EVENTS=y" >> arch/arm64/configs/${{ github.event.inputs.KERNEL_DEFCONFIG }}
# curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -

# echo change build config
# cd $GITHUB_WORKSPACE/kernel_workspace/android-kernel
# sed -i '/supported.versions.*/d' anykernel.sh
# sed -i '/do.devicecheck.*/d' anykernel.sh
# sed -i 's/KERNEL_NAME=.*/KERNEL_NAME=${{ github.event.inputs.KERNEL_NAME}}-$DATE/g' build.sh

# echo build kernel
# cd $GITHUB_WORKSPACE/kernel_workspace/android-kernel
# rm .git -R
# sudo bash build.sh
