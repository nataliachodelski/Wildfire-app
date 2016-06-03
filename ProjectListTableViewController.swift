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
    
    let dataModel = DataModel()
    
    var jsonFileName : String = "projects"
    var eventCount : Int = 0
    
    var demoImages : [UIImage] = []
    let demoImg1 = UIImage(named: "demoEcuador")
    let demoImg2 = UIImage(named: "demoJapan")
    let demoImg3 = UIImage(named: "demoSyria")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 160
        
        demoImages = [demoImg1!, demoImg2!, demoImg3!]
        
        parseJSON(jsonFileName)
    }
    
    func parseJSON(fileName: String) {
        print("running parseJSON)")
        
        if let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json")
        {
            do {
                let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: NSDataReadingOptions.DataReadingMappedIfSafe)
                json = JSON(data: data)
                if json != JSON.null {
                    print("got jsonData in SwiftyJson")
                } else {
                    print("could not get json from file, make sure that file contains valid json.")
                }
            }
            catch let error as NSError {
                print(error.localizedDescription)
            }
            
        } else {
            print("Invalid filename/path.")
        }
        
        // iterate through the root nodes
        for key in json
        {
            eventCount += 1
            print("[Outer] object key is \(key.0)")
            
            let projectObj = ProjectObject()
            
            // iterate through each root object and extract needed info via keys in the subjson
            for innerKey in key.1
            {
                switch (innerKey.0) {
                case "org":
                    projectObj.orgName = innerKey.1.stringValue
                    
                case "location":
                    projectObj.eventLocation = innerKey.1.stringValue
                    
                case "event":
                    projectObj.eventType = innerKey.1.stringValue
                    
                case "detail":
                    projectObj.eventDescription = innerKey.1.stringValue
                    
                case "impact":
                    projectObj.eventImpact = innerKey.1.stringValue
                    
                default:
                    break;
                }
            }
            
            projectObj.image = demoImages[eventCount - 1]
            
            dataModel.currentEvents.append(projectObj)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventCount
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
