## 仓库合并

### 合并原仓库的 Pull requests



### 合并提交到原仓库的 Pull requests

（最后合并，#67 [Updates](https://github.com/ibireme/YYCategories/pull/67)) 2021-02-03，手动合并）

一般不需要这么操作，由原仓库管理人员去检查代码逻辑，然后合并到原仓库。但由于 YYKit 仓库目前不再维护，提交的 Pull requests 也无法处理，所以要 Fork 后自己处理。

1. 点击原仓库 Pull requests，然后点击某个提交进入详情，检查是否需要合并；
2. 点击这个请求作者的仓库，即 from `someOne:master` 进入别人的 Fork 仓库；
3. 点击 `Compare`进入比较代码，修改 `base repository`为自己的仓库，即想要把别人的Pull requests拉取到自己的Fork仓库。
4. 检查无误后点击右侧 `Create pull request` 然后填写说明提交。
5. 到自己仓库后，点击 `Merge pull request` 合并请求。


## 版本更新
修改仓库代码后，适当的时候要更新版本，并提交到 pod 仓库中以供项目中更新使用。
1. 添加 git commit tag，修改 `.podspec` 文件中版本号同 tag 一致，并保存提交；
2. 终端终端定位到项目，输入命令 `pod lib lint` 验证；（出现 `YYCategories passed validation.` 验证通过）
3. 提交到Spec Repo，命令 `pod repo push FRPrivateRepo YYCategories.podspec --verbose --allow-warnings` 显示好多警告，最后提交成功，查看仓库中有新的版本号(命令 -- 之后的可不写，避免显示太多的警告)；

==============

YYCategories
==============

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/ibireme/YYCategories/master/LICENSE)&nbsp;
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/YYCategories.svg?style=flat)](http://cocoapods.org/pods/YYCategories)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/p/YYCategories.svg?style=flat)](http://cocoadocs.org/docsets/YYCategories)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;
[![Build Status](https://travis-ci.org/ibireme/YYCategories.svg?branch=master)](https://travis-ci.org/ibireme/YYCategories)

A set of useful categories for Foundation and UIKit.<br/>
(It's a component of [YYKit](https://github.com/ibireme/YYKit))

Documentation
==============

You can build and install docset use `Docset` scheme in Xcode, `appledoc` need to be pre-installed. 
Or your can read the [Documentation](http://github.ibireme.com/doc/YYCategories/index.html) online.


Installation
==============

### CocoaPods

1. Add `pod 'YYCategories'` to your Podfile.
2. Run `pod install` or `pod update`.
3. Import \<YYCategories/YYCategories.h\>.


### Carthage

1. Add `github "ibireme/YYCategories"` to your Cartfile.
2. Run `carthage update --platform ios` and add the framework to your project.
3. Import \<YYCategories/YYCategories.h\>.


### Manually

1. Download all the files in the YYCategories subdirectory.
2. Add the source files to your Xcode project.
3. Add `-fno-objc-arc` compiler flag to `NSObject+YYAddForARC.m` and `NSThread+YYAdd.m`.
4. Link with required frameworks:
	* UIKit
	* CoreGraphics
	* QuartzCore
	* Accelerate
	* ImageIO
	* CoreText
	* CoreFoundation
	* libz
5. Import `YYCategories.h`.


Documentation
==============
Full API documentation is available on [CocoaDocs](http://cocoadocs.org/docsets/YYCategories/).<br/>
You can also install documentation locally using [appledoc](https://github.com/tomaz/appledoc).


Requirements
==============
This library requires `iOS 6.0+` and `Xcode 8.0+`.


Notice
==============
I want to use the APIs as if it was provided by system, so I don't add prefix in
these categories. This may cause some potential problems（such as conflict with other libraries), so if you just need some pieces of code
in this project, pick them out and don't import the whole library.


License
==============
YYCategories is provided under the MIT license. See LICENSE file for details.




<br/><br/>
---
中文介绍
==============
功能丰富的 Category 类型工具库。<br/>
(该项目是 [YYKit](https://github.com/ibireme/YYKit) 组件之一)

文档
==============

你可以用 `Docset` scheme 来生成文档 (需要预先安装 appledoc)，或者[在线查看](http://github.ibireme.com/doc/YYCategories/index.html)。


安装
==============

### CocoaPods

1. 在 Podfile 中添加  `pod 'YYCategories'`。
2. 执行 `pod install` 或 `pod update`。
3. 导入 \<YYCategories/YYCategories.h\>。


### Carthage

1. 在 Cartfile 中添加 `github "ibireme/YYCategories"`。
2. 执行 `carthage update --platform ios` 并将生成的 framework 添加到你的工程。
3. 导入 \<YYCategories/YYCategories.h\>。


### 手动安装

1. 下载 YYCategories 文件夹内的所有内容。
2. 将 YYCategories 内的源文件添加(拖放)到你的工程。
3. 为 `NSObject+YYAddForARC.m` 和 `NSThread+YYAdd.m` 添加编译参数 `-fno-objc-arc`。
4. 链接以下 frameworks:
	* UIKit
	* CoreGraphics
	* QuartzCore
	* Accelerate
	* ImageIO
	* CoreText
	* CoreFoundation
	* libz
5. 导入 `YYCategories.h`。


文档
==============
你可以在 [CocoaDocs](http://cocoadocs.org/docsets/YYCategories/) 查看在线 API 文档，也可以用 [appledoc](https://github.com/tomaz/appledoc) 本地生成文档。

系统要求
==============
该项目最低支持 `iOS 6.0` 和 `Xcode 8.0`。


注意
==============
我希望调用 API 时，有着和调用系统自带 API 一样的体验，所以我并没有为 Category 方法添加前缀。我已经用工具扫描过这个项目中的 API，确保没有对系统 API 产生影响。我知道没有前缀的 Category 可能会带来麻烦（比如可能和其他某些类库产生冲突），所以如果你只需要其中少量代码，那最好将那段代码取出来，而不是导入整个库。


许可证
==============
YYCategories 使用 MIT 许可证，详情见 LICENSE 文件。


