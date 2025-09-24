# PointPub iOS

## 요구사항
- iOS 15.0 이상
- Xcode 16.0 이상

## SDK 설치
PointPub iOS SDK는 [CocoaPods](https://cocoapods.org/) 또는 [Swift Package Manager](https://docs.swift.org/swiftpm/documentation/packagemanagerdocs/)를 통해 설치할 수 있습니다.

### CocoaPods

아래와 같이 Podfile 파일에 pod 'pointpub-ios' 를 추가하여 주십시오.

```
pod 'pointpub-ios'
```

CocoaPods CLI 명령어를 이용하여 SDK 설치를 완료하여 주십시오.

```
$ pod install --repo-update
```

### Swift Package Manager
1. Xcode에서 아래 메뉴를 클릭합니다. Xcode - File -> Add Package Dependencies...
2. 우측 상단 패키지 URL에 아래 저장소 URL를 입력합니다. https://github.com/adxcorp/pointpub-ios-release
3. 사용하려는 버전을 선택하고 "Add Package" 버튼을 클릭하여 SDK 설치를 완료합니다.

## SDK 연동
SDK 연동은 [연동가이드](https://app.gitbook.com/o/XncdJBqneLE1piJ2GEvq/s/0tO0eyG5jX6pAANtcDq7/ios/sdk-integration)에서 확인할 수 있습니다.
