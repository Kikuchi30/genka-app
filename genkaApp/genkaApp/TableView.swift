//
//  TableView.swift
//  genkaApp
//
//  Created by Kikuchi Yuichi on 2021/07/25.
//
import UIKit
 
class TableView: UIViewController {
    
    //テーブルビューを定義し、Outlet接続する。
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        // テーブルビューのデータソースとしてViewControllerを指定。（storyboardで設定しても良い。）
        self.tableView.dataSource = self
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}
 
// - ViewControllerにUITableViewDataSourceを準拠させる。
// - 最低限必要なメソッドを実装する。
extension ViewController: UITableViewDataSource {
 
    // cellを返す。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "section:[\(indexPath.section)], row:[\(indexPath.row)]"
        return cell
    }
    
    //セルの数をいくつにするか。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
}
