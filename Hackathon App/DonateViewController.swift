//
//  DonateViewController.swift
//  Wildfire App
//
//  Created by Natalia on 7/06/2016.
//  Copyright © 2016 NataliaDeveloper. All rights reserved.
//

import UIKit

class DonateViewController: UIViewController {

    
    let dataModel = DataModel.sharedInstance
    
    var currentEvent : Int  = -1
    //let detailImages = DataModel.
    @IBOutlet weak var fullImage: UIImageView!
    
    @IBOutlet weak var giveToOrgName: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentEvent = dataModel.currentEvent
       
        navigationItem.title = "Donate"
        
        
        let introText = String("Give to: \((dataModel.getProjectObject(currentEvent)?.orgName)!)")
        
        giveToOrgName.text = introText as String
        
        
        fullImage.image = dataModel.getProjectObject(currentEvent)?.fullImage
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
