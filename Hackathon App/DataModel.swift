//
//  DataModel.swift
//  Hackathon App
//
//  Created by Natalia on 14/05/2016.
//  Copyright © 2016 NataliaDeveloper. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class DataModel : NSObject {
    
    //var demoData = NSData(contentsOfURL: NSURL(fileURLWithPath: "projects.json"))
    
    var currentEvents : [ProjectObject] = []
    
}



class ProjectObject : NSObject {
    internal var orgName : String!
    internal var eventType : String!
    var eventLocation : String!
    var eventDescription : String!
    var eventImpact : String!// optionall dictonary with associated GPS coordinates or something
    var image : UIImage!

}
