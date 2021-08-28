//
//  TableViewController.swift
//  genkaApp
//
//  Created by Kikuchi Yuichi on 2021/07/25.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var tableView: UITableView!
    
    var foodName: [String] = []
   // var costs: [Int] = [100, 200, 150]
    
    //データ保存ローカルの設定
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // データ読み込み
        UserDefaults.standard.string(forKey: "foodName")
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed(_ :)))
        navigationItem.rightBarButtonItems = [editButtonItem, addBarButtonItem]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showdetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                guard let destination = segue.destination as? DetailViewController else {
                    fatalError("Failed to prepare DetailViewController.")
                }

                destination.selectProduct = foodName[indexPath.row]
//                destination.productCost = costs[indexPath.row]
            }
        }
    }
    
    @objc func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "新しいアイテムを追加", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "追加", style: .default) { (action) in
            self.foodName.append(textField.text!)
            self.tableView.reloadData()
            print(self.foodName)
        
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "アイテムを入力"
            textField = alertTextField
            
            // 追加した内容を保存
            self.userDefaults.set(self.foodName, forKey: "foodName")
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
        tableView.isEditing = editing
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = foodName[indexPath.row]
        return cell
    }
    //削除した時
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            foodName.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print(foodName)
    // 追加：削除した内容を保存
        userDefaults.set(foodName, forKey: "foodName")
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let language = foodName[fromIndexPath.row]
        foodName.remove(at: fromIndexPath.row)
        foodName.insert(language, at: to.row)
        print(foodName)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

