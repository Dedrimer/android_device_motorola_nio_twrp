#
# Copyright (C) 2021 The Android Open Source Project
# Copyright (C) 2021 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

    add_lunch_combo omni_nio-user
    add_lunch_combo omni_nio-userdebug
    add_lunch_combo omni_nio-eng

    export LC_ALL="C"
    export ALLOW_MISSING_DEPENDENCIES=true

    echo -e "\x1b[96mbomb: 开始添加OrangeFox Vars...\x1b[m"
    ## 构建信息
    # 设置显示在关于页面里的维护人员名称
    export OF_MAINTAINER=Dedrimer
    # 设置版本号为日期
    export FOX_VERSION=$(date +%y.%m.%d)

    ## 添加功能
    # 使用完整版ps命令
    export FOX_REPLACE_BUSYBOX_PS=1
    # 使用完整版getprop命令
    export FOX_REPLACE_TOOLBOX_GETPROP=1
    # 支持tar命令
    export FOX_USE_TAR_BINARY=1
    # 支持sed命令
    export FOX_USE_SED_BINARY=1
    # 使用bash代替sh和ash
    export FOX_USE_BASH_SHELL=1
    export FOX_ASH_IS_BASH=1
    # 使用完整版grep命令
    export FOX_USE_GREP_BINARY=1
    # 支持lzma, xz命令
    export FOX_USE_XZ_UTILS=1
    # 使用橙狐编译的NANO编辑器
    export FOX_USE_NANO_EDITOR=1
    # 添加phhusson's lptools工具
    export OF_ENABLE_LPTOOLS=1

    ## 添加橙狐特殊处理
    # 当安装MIUI或者在MIUI上安装橙狐zip，使用magisk处理所有boot和recovery镜像，防止橙狐被MIUI官方recovery替换
    # export OF_FORCE_MAGISKBOOT_BOOT_PATCH_MIUI=1
    # 防止用户在不使用metadata加密的ROM中重复被metadata装载错误提示刷屏
    export OF_FBE_METADATA_MOUNT_IGNORE=1
    # 尝试处理AVB2.0，防止橙狐被官方recovery替换，实测此机型无效
    # export OF_PATCH_AVB20=1
    # 当修补recovery/boot镜像时，始终指示magiskboot v24+修补vbmeta标头（自动禁用avb验证？）
    # export OF_PATCH_VBMETA_FLAG=1

    ## 硬件功能设定
    # 没有绿色led
    export OF_USE_GREEN_LED=0
    # 关闭闪光灯功能
    # export OF_FLASHLIGHT_ENABLE=0
    # 自定义闪光灯路径，修复闪光灯
    # export OF_FL_PATH1=/sys/class/leds/torch-light0
    # export OF_FL_PATH2=/sys/class/leds/torch-light1
    # 橙狐只支持两个闪光灯路径变量，但是这个手机有3个,其实有一个就行了，这个无实际用途
    # export OF_FL_PATH3=/sys/class/leds/torch-light2

    ## 界面显示设定
    # 设置屏幕高度，状态栏高度，状态栏左右边距
    # 由于橙狐默认屏幕比例是16：9,所以应设置屏幕高度为屏幕比例换算成n：9之后，n*120
    # export OF_SCREEN_H=2400
    # export OF_STATUS_H=59
    # export OF_STATUS_INDENT_LEFT=90
    # export OF_STATUS_INDENT_RIGHT=90
    # 添加黑色状态栏（隐藏刘海）选项
    export OF_HIDE_NOTCH=1
    # 由于有刘海遮挡，设置时钟位置为只能显示在左侧或右侧
    # export OF_CLOCK_POS=1
    # 禁止禁用导航栏
    export OF_ALLOW_DISABLE_NAVBAR=0

    ## 技术性调整
    # 使刷机包兼容红米10X 5G和红米10X Pro
    # 使红米10X 5G和红米10X Pro都能刷入橙狐zip卡刷包
    export TARGET_DEVICE_ALT="nio, nio_reten"
    # 使橙狐可以刷入具有机型检测限制为红米10X 5G或者红米10X Pro的zip卡刷包，与TARGET_OTA_ASSERT_DEVICE冲突
    # export OF_TARGET_DEVICES="atom,bomb"

    # 设定recovery、system、vendor、boot分区路径
    # export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/by-name/recovery"
    export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
    export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
    export FOX_RECOVERY_PRODUCT_PARTITION="/dev/block/mapper/product"
    export FOX_RECOVERY_SYSTEM_EXT_PARTITION="/dev/block/mapper/system_ext"
    export FOX_RECOVERY_BOOT_PARTITION="/dev/block/by-name/boot"

    # 避免在已加密设备上应用强制加密补丁
    export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
    # 跳过FBE解密流程（防止卡在橙狐LOGO或Redmi/Mi LOGO界面）
    # export OF_SKIP_FBE_DECRYPTION=1
    # 当ROM大于等于指定安卓SDK等级时，跳过FBE解密流程
    export OF_SKIP_FBE_DECRYPTION_SDKVERSION=31
    # 在MIUI OTA还原期间尝试解密内部存储（而不是错误退出）
    export OF_OTA_RES_DECRYPT=1
    # 防止橙狐在解密后重新运行自启动进程
    export OF_NO_RELOAD_AFTER_DECRYPTION=1
    # 使用指定的magisk
    export FOX_USE_SPECIFIC_MAGISK_ZIP="$HOME/Magisk.zip"
    # 使用指定的magisk版本号，由于magisk 23+使用了新的包装形式，文件路径改变了，橙狐无法获取正确的版本
    export MAGISK_VER=24.3

    echo -e "\x1b[96mbomb: 当你看到这个消息的时候，所有的OrangeFox Var已经添加完毕！\x1b[m"