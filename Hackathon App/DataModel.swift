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
    
    class var sharedInstance: DataModel {
        struct Singleton {
            static let instance = DataModel()
        }
        return Singleton.instance
    }
    
    var currentEvents : [ProjectObject] = []
    var smallImages : [UIImage] = []
    var introImages : [UIImage] = []
    var fullImages  : [UIImage] = []
    
    var eventCount : Int
    var currentEvent : Int
    
    
    //var demoData = NSData(contentsOfURL: NSURL(fileURLWithPath: "projects.json"))

    var jsonFileName : String
    
    override init() {
        self.jsonFileName = "projects"
        eventCount = 0
        currentEvent = -1
        
        super.init()
        
        let smallImg1 = UIImage(named: "demoJapan")
        let smallImg2 = UIImage(named: "demoEcuador")
        let smallImg3 = UIImage(named: "demoSyria")
        
        let fullImg1 = UIImage(named: "fullJapan")
        let fullImg2 = UIImage(named: "fullEcuador")
        let fullImg3 = UIImage(named: "fullSyria")

        let introImg1 = UIImage(named: "Intro1")
        let introImg2 = UIImage(named: "Intro2")
        let introImg3 = UIImage(named: "Intro3")
        let introImg4 = UIImage(named: "Intro4")
        
        smallImages = [smallImg1!, smallImg2!, smallImg3!]
        fullImages = [fullImg1!, fullImg2!, fullImg3!]

        introImages = [introImg1!, introImg2!, introImg3!, introImg4!]
        
        parseJSON(jsonFileName)
    }
    
    
    func getProjectObject(index: Int) -> ProjectObject? {
        //if currentEvent != -1 {
         return currentEvents[index]
//        } else {
//            print("no current event, ie is -1")
//            return nil
//        }
    }
 
    func parseJSON(fileName: String) {
        print("running parseJSON)")
        
        if let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json")
        {
            do {
                let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: NSDataReadingOptions.DataReadingMappedIfSafe)
                let json = JSON(data: data)
                if json != JSON.null {
                    print("[Data model] got jsonData in SwiftyJson")
                } else {
                    print("could not get json from file, make sure that file contains valid json.")
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
                    
                    projectObj.smallImage = smallImages[eventCount - 1]
                    projectObj.fullImage = fullImages[eventCount - 1]
                    
                    self.currentEvents.append(projectObj)
                }
            }
            catch let error as NSError {
                print(error.localizedDescription)
            }
            
        } else {
            print("[Data model] While parsing Json - found Invalid filename/path")
        }
    }
}

// object that stores info for each project/cause listd
class ProjectObject : NSObject {
    internal var orgName : String = ""
    internal var eventType : String = ""
    var eventLocation : String = ""
    var eventDescription : String = ""
    var eventImpact : String = ""// optionall dictonary with associated GPS coordinates or something
    var smallImage : UIImage!
    var fullImage : UIImage!
    
}
