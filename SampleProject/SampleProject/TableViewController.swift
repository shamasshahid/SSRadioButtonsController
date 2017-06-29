//
//  TableViewController.swift
//  SampleProject
//
//  Created by Abdussamet Özay on 29/06/2017.
//  Copyright © 2017 Al Shamas Tufail. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, SSRadioButtonControllerDelegate {
    
    var radioButtonController: SSRadioButtonsController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false;
        tableView.register(UINib(nibName: "TableViewCell", bundle: Bundle(for: TableViewController.self)), forCellReuseIdentifier: "tableViewCell")
        
        radioButtonController = SSRadioButtonsController()
        radioButtonController?.delegate = self;
        radioButtonController?.respectTableView = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    
    func didSelectButton(selectedButton: UIButton?, index: Int) {
        NSLog(" \(String(describing: selectedButton))" )
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        cell.selectionStyle = .none
        cell.btnLabel.tag = indexPath.row
        radioButtonController?.addButton(cell.btnLabel)
        
        cell.btnLabel.isSelected = (radioButtonController?.isSelected(index: indexPath.row))!
        cell.btnLabel.toggleButon()
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
