//
//  FBLoginApISwift.swift
//  Hackathon App
//
//  Created by Natalia on 16/05/2016.
//  Copyright © 2016 NataliaDeveloper. All rights reserved.
//

import Foundation
import FBSDKLoginKit

class FBLoginApISwift: UIViewController {
    func buttonClicked(sender:UIButton!) {
        print("button clicked")
        //performSegueWithIdentifier("showLoginView", sender: self)
        
        let login: FBSDKLoginManager = FBSDKLoginManager()
        login.logInWithReadPermissions(["public_profile", "others"], fromViewController: self, handler: { (result:FBSDKLoginManagerLoginResult!, error:NSError!) -> Void in
            if error != nil {
                // Process error
                NSLog("error %@", error)
                if result.grantedPermissions.contains("email") {
                    // Do work
                    NSLog("%@", result)
                    NSLog("Correct")
                    dispatch_async(dispatch_get_main_queue(), {
                        // call function that segues to next view if login sucessful. on main theread b/c this is from inside a callback closure
                        // self.segueToNext()
                    })
                }
            }
            else if result.isCancelled {
                // Handle cancellations
                NSLog("Cancelled")
                if result.grantedPermissions.contains("email") {
                    // Do work
                    NSLog("%@", result)
                    NSLog("Correct")
                }
            }
            else {
                if result.grantedPermissions.contains("email") {
                    // Do work
                    NSLog("%@", result)
                    NSLog("Correct")
                }
            }
        })
    }
}