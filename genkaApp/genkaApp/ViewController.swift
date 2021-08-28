//
//  ViewController.swift
//  genkaApp
//
//  Created by Kikuchi Yuichi on 2021/07/12.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var bot: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //バックグラウンドのカラー
            view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        //四角に表示する文字
            bot.placeholder = "入力してください"
        //文字のフォント
            bot.font = UIFont(name: "HiraMaruProN-W4", size: 20)
        //文字の位置
            bot.textAlignment = NSTextAlignment.center
        //線の境界線（UITextBorderStyle.~と入れたかったがエラーになった）
            bot.borderStyle = .line
        //クリアボタンの設定
            bot.clearButtonMode = .always //つねに
        //表示するキーボードタイプ（数字だけ使いたかったが、戻るボタンがなかった）
            bot.keyboardType = UIKeyboardType.default
        //キーボード右下のリターンボタンを何にするか設定
            bot.returnKeyType = UIReturnKeyType.done //完了
        //デリゲートをTextFieldに適用(デリゲートって何）
            bot.delegate = self
        //エクステンションに書いたコードを読み込み
            setDismissKeyboard()
//        //バックグラウンドのカラー
//            view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
}
    //テキストフィールドでリターンが押されたときに通知され起動するメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

}

    
}

