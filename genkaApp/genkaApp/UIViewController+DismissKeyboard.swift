//
//  UIViewController+DismissKeyboard.swift
//  genkaApp
//
//  Created by Kikuchi Yuichi on 2021/07/12.
//

import UIKit

//最初ファイルを作った時にUIkitじゃなくてFoundationだった
extension UIViewController {
    
    func setDismissKeyboard() {
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
}

