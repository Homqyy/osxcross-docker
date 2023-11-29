# osxcross-docker

1. 在后台运行交叉编译环境

    ```bash
    docker run -d homqyy/osxcross /sbin/init
    ```

2. 下载你需要的SDK，并放置到 `/osxcross-docker/osxcross/tarballs/` 目录中，下面是 SDKs 下载站点：

    - [XCode](https://developer.apple.com/download/all/?q=xcode)
    - [MacOSX SDKs](https://github.com/phracker/MacOSX-SDKs)：有问题，请用3步骤提取 `XCode_*.xip`
    - [ISO SDKs](https://github.com/growtopiajaw/iPhoneOS-SDK)：有问题，请用3步骤提取 `XCode_*.xip`

3. 提取SDK：SDK 需要从 XCode_*.xip 中提取，提取的命令为：

    ```bash
    ./osxcross/tools/gen_sdk_package_pbzx.sh ./xcode/Xcode_*.xip
    ```

    - 执行完上述命令后，会在`osxcross`目录中生成名为 `*MacOSX*` 的SDK，将其放置到 `/osxcross-docker/osxcross/tarballs` 目录中

4. 构建 交叉编译 环境

    ```bash
    SDK_VERSION=xx.xx ./build.sh
    ```

    - `xx.xx`是你的版本，假如你有名为`MacOSX10.15.sdk.tar.xz`的SDK，那么`xx.xx`的值为`10.15`

5. 更新 `PATH`

    ```bash
    export PATH="/osxcross-docker/osxcross/target/bin:$PATH"
    ```

