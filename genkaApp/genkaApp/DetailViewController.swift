//
//  DetailViewController.swift
//  genkaApp
//
//  Created by Kikuchi Yuichi on 2021/07/25.
//
import UIKit
 
class DetailViewController: UIViewController {
    var selectProduct: String!
    var productCost: Int?
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var cost: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        productName.text = selectProduct
//        cost.text = "\(productCost!)"
    }
}
