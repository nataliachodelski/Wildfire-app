//
//  DetailViewController.swift
//  Wildfire App
//
//  Created by Natalia on 3/06/2016.
//  Copyright © 2016 NataliaDeveloper. All rights reserved.
//

// If erin wants to re-impliment er apple pay & parse thing - https://swifting.io/blog/2016/05/30/16-parse-server-100-days-later/

import UIKit

class DetailViewController: UIViewController {

    let dataModel = DataModel.sharedInstance

    var currentEvent : Int  = -1
    //let detailImages = DataModel.
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var amountRaisedLabel: UILabel!
    
    @IBOutlet weak var moneyIcon: UIImageView!
    
    @IBOutlet weak var spreadWordButton: UIButton!
    @IBOutlet weak var donateButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentEvent = dataModel.currentEvent
        let string1 : String = (dataModel.getProjectObject(currentEvent)?.eventDescription)!
        let string2 : String = (dataModel.getProjectObject(currentEvent)?.eventImpact)!
        
        navigationItem.title = dataModel.getProjectObject(currentEvent)?.orgName
        
        if dataModel.getProjectObject(currentEvent)?.orgName.characters.count > 22 {
            navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(14), NSForegroundColorAttributeName: UIColor.whiteColor()]
        } else {
            navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(19), NSForegroundColorAttributeName: UIColor.whiteColor()]
        }
        
        let introText = "\(string1) \n\nImpact: \(string2)"
        
        detailText.text = introText as String
        

        detailImageView.image = dataModel.getProjectObject(currentEvent)?.fullImage
        }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.AllButUpsideDown
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
