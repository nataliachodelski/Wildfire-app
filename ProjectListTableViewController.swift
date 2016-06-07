//
//  ProjectListTableViewController.swift
//  Hackathon App
//
//  Created by Natalia on 14/05/2016.
//  Copyright © 2016 NataliaDeveloper. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProjectListTableViewController: UITableViewController {
    
    let dataModel = DataModel.sharedInstance

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 160
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.eventCount
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("projectListCell", forIndexPath: indexPath) as! ProjectListCell
        let row = indexPath.row
        
        let currentProj = dataModel.currentEvents[row]
        cell.projectOrgName.text = currentProj.orgName
        cell.projectEventType.text = currentProj.eventType
        cell.projectLocation.text = currentProj.eventLocation
        cell.projectImage.image = currentProj.image
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        dataModel.currentEvent = row
    }
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
