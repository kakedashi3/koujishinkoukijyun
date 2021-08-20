//
//  ViewController.swift
//  koujishinkoukijyun
//
//  Created by 立岡力 on 2021/07/27.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var kessanKoujiGenkaTextField: UITextField!
    @IBOutlet weak var sougakuKoujiGenkaTextField: UITextField!
    @IBOutlet weak var koujiShintyokudo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 入力欄にヒント文字を表示する
        kessanKoujiGenkaTextField.placeholder = "発生した工事原価"
        sougakuKoujiGenkaTextField.placeholder = "工事原価総額"
        // 数字入力用のキーボードに変換
        self.kessanKoujiGenkaTextField.keyboardType = UIKeyboardType.numberPad
        self.sougakuKoujiGenkaTextField.keyboardType = UIKeyboardType.numberPad
    }
    
    // 画面をタッチしてキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    // ボタンを押下して工事進捗度を算出する
    @IBAction func calculationButton(_ sender: Any) {
        let doubleK = Double(kessanKoujiGenkaTextField.text!)
        let doubleS = Double(sougakuKoujiGenkaTextField.text!)
        koujiShintyokudo.text = calculation(kessan: doubleK!, sougaku: doubleS!)
        // キーボードを閉じる。総額工事原価欄と接続
        sougakuKoujiGenkaTextField.endEditing(true)
    }
    
    
    // 計算式で結果を出して値を返す
    func calculation(kessan: Double, sougaku: Double) -> String {
        let k = kessan
        let s = sougaku
        var result = k / s
        result = floor(result * 100)
        return result.description + "%"  // 結果を％表記にする
    }
    
    
    // ボタンを丸くする
    @IBOutlet weak var curveButton: UIButton!
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            // 画面上の座標設定
            self.curveButton.frame = CGRect(x: (self.view.frame.size.width / 2) - 150,
                                            y: (self.view.frame.size.height / 2) + 40, width: 300, height: 100)
            //角丸の程度を指定
            self.curveButton.layer.cornerRadius = 40.0
        }
    
    
}

