# NetworkTest
Network test lab.

## ViewController
![image](https://github.com/chiron-wang/NetworkTest/blob/master/blogImages/ViewController.png)
* 程式碼加入UIButton, StackView
* 使用程式碼設定constraint, widthAnchor, heightAnchor, centerXAnchor, centerYAnchor...

## PhotoViewController
![image](https://github.com/chiron-wang/NetworkTest/blob/master/blogImages/PhotoViewController.png)
* 使用URLSession下載圖片，並設定到畫面上的四個UIImageView
* 設定UI必須在主執行緒中執行
```swift=
DispatchQueue.main.async {
    configUI()
}
```

## MemeViewController
![image](https://github.com/chiron-wang/NetworkTest/blob/master/blogImages/MemeViewController.png)
* 練習呼叫MemeAPI
* 練習解析ISO8601的時間格式 (DateFormatter)

ref: https://some-random-api.ml/meme

## SongViewController
![image](https://github.com/chiron-wang/NetworkTest/blob/master/blogImages/SongViewController.png)
* 練習呼叫Api中帶有中文字的處理
* 使用JSONDecoder()解析呼叫Api結果
* 練習播放/停止 下載的音樂
* 結果陣列中亂數取出其中一個
* 練習參數completionHandler()來傳入func

ref: https://itunes.apple.com/search?term=戴佩妮&media=music

## SongTableViewController
![image](https://github.com/chiron-wang/NetworkTest/blob/master/blogImages/SongTableViewController.png)
* 練習使用Xib來建立UITableViewController & UITableViewCell
* 在viewDidLoad()中註冊Cell
* 使用propertyKeys來存放對應的key名稱
* 練習static let shared = XXX的風格程式碼
* 練習titleForHeaderInSection => 從JSON中取得
* 使用section分群，分群條件為作者名稱
* 使用IndexPath.row來取得作者的每一首歌曲
* 練習DateFormatter()指定時間格式 (yyyy/MM/dd)

## 其他練習
### 套件 netfox
* 在AppDelegate啟動
* 手機或模擬器搖晃，可以叫出call Api的資料(request, response...)
* Podfile修改，在iOS13遇到啟動閃退問題，加入以下兩行
```swift=
#use_frameworks!
use_modular_headers!
```
### Model建立練習，並遵從 Codable rotocol
* Mame
* Song => 遵從 Hashable，後面篩選資料用
* 加入func == (lhs:rhs:), func hash(into:inout:)

### Helpers 共用程式庫引入
* 搭配git submodule

### extension練習
* 加入 Array+removeDuplicates.swift
* 命名風格為『型別 + 方法』

ref: https://www.hackingwithswift.com/example-code/language/how-to-remove-duplicate-items-from-an-array
