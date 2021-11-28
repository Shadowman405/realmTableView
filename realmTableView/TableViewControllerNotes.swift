//
//  ViewController.swift
//  realmTableView
//
//  Created by Maxim Mitin on 28.11.21.
//

import UIKit
import RealmSwift

class TableViewControllerNotes: UITableViewController {
    
    var items: Results<Item>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do {
            let realm = try Realm()
            items = realm.objects(Item.self)
        } catch {
            print("eroor")
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellNotes")
        let name = items[indexPath.row].name
        cell?.textLabel?.text = name
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            do {
                let realm = try Realm()
                let item = items[indexPath.row]
                try realm.write{
                realm.delete(item)
                }
                tableView.reloadData()
            } catch {
                print("eroor")
            }
        }
    }

    
    @IBAction func addClicked(_ sender: Any) {
        let item = Item()
        item.name = "Item \(items.count + 1)"
        do {
            let realm = try Realm()
            try realm.write{
            realm.add(item)
            }
        } catch {
            print("eroor")
        }
        
        tableView.reloadData()
    }
    
    @IBAction func editClicked(_ sender: Any) {
        let edit = !self.tableView.isEditing
        self.tableView.setEditing(edit, animated: true)
    }
    
}

