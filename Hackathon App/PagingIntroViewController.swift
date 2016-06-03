//
//  PagingIntroViewController.swift
//  Hackathon App
//
//  Created by Natalia on 14/05/2016.
//  Copyright © 2016 NataliaDeveloper. All rights reserved.
//

import UIKit
import EZSwiftExtensions
import UIKit
import FBSDKLoginKit

var pinkColor = UIColor(hexString: "#DE6262")

class PagingIntroViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView : UIScrollView!
    var images:[UIImage] = []
    var frame: CGRect = CGRectMake(0, 0, 0, 0)
    var pageControl = UIPageControl()
    var viewSize: CGSize!
    
    var facebookButton = UIButton()
    
    
    let image1 = UIImage(named: "Intro1")
    let image2 = UIImage(named: "Intro2")
    let image3 = UIImage(named: "Intro3")
    let image4 = UIImage(named: "Intro4")

    override func shouldAutorotate() -> Bool {
        return false
    }
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Rotate to portrait
        let value = UIInterfaceOrientation.Portrait.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
        
        images = [image1!, image2!, image3!, image4!]

        viewSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
        print("view size is \(viewSize)")
        
//        navigationItem.title = "Wildfire"
//        navigationController!.navigationBar.backgroundColor = UIColor(hexString: "#DE6262")
        
//        invisibleButton.addTarget(self, action: #selector(PagingIntroViewController.buttonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        invisibleButton.enabled = false

        setupScrollView()
        configurePageControl()
        setupFBButton()
        
        pageControl.addTarget(self, action: #selector(PagingIntroViewController.changePage(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func setupScrollView() {
        scrollView = UIScrollView(frame: CGRectMake(0, 0,viewSize.width, viewSize.height))
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        for index in 0..<4 {
            
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            frame.size = self.scrollView.frame.size
            self.scrollView.pagingEnabled = true
            
            let subView = UIImageView(frame: frame)
            subView.image = images[index]
            
            if index == 3 {
//                invisibleButton.enabled = true
//                self.scrollView.addSubview(invisibleButton)
                
            } else {
                facebookButton.hidden = true
                facebookButton.enabled = false
            }
            self.scrollView.addSubview(subView)
        }
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 4, self.scrollView.frame.size.height)
    }
    
    func setupFBButton()
    {
        let buttonImg = UIImage(named: "LoginButton")
        
        let calculatedWidth = self.view.size.width * 3/5
        let calculatedHeight = buttonImg!.aspectHeightForWidth(calculatedWidth)
        
        facebookButton = UIButton(frame: CGRect(x: self.view.size.width * 1/5, y: self.view.size.height * 0.75, w: calculatedWidth, h: calculatedHeight))
        
        facebookButton.setImage(buttonImg, forState: UIControlState.Normal)
        facebookButton.addTarget(self, action: #selector(PagingIntroViewController.buttonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        //facebookButton.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        
        //facebookButton.autoresizingMask = UIViewAutoresizing.FlexibleBottomMargin

        //facebookButton.sizeToFit()

        self.view.addSubview(facebookButton)
        view.bringSubviewToFront(facebookButton)
        
        facebookButton.hidden = true
        facebookButton.enabled = false
    }

    
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageControl.numberOfPages = images.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.redColor()
        self.pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        self.pageControl.currentPageIndicatorTintColor = pinkColor
        self.pageControl.frame = CGRectMake(self.view.size.width * 1/3, self.view.size.height * 0.85, self.view.size.width * 1/3, 10)
        self.view.addSubview(pageControl)
        view.bringSubviewToFront(pageControl)
    }
    
    
    func buttonClicked(sender:UIButton!) {
        print("button clicked")
        //performSegueWithIdentifier("showLoginView", sender: self)
        
        let login: FBSDKLoginManager = FBSDKLoginManager()
        
        // below line is where i chose what i want to ask the user for / collect, 
        // ie to get email, i would have "email" as a permission and i would possibly get an email back, and could check for nil and store if found
        
        
        //was:
        //         login.logInWithReadPermissions(["public_profile", "others"], fromViewController: self, handler: { (result:FBSDKLoginManagerLoginResult!, error: NSError!) -> Void in

        login.logInWithReadPermissions(["public_profile"], fromViewController: self, handler: { (result:FBSDKLoginManagerLoginResult!, error: NSError!) -> Void in
            if error != nil {
                // Process error
                NSLog("error %@", error)
//                if result.grantedPermissions.contains("email") {
//                    // Do work
//                    NSLog("%@", result)
//                    NSLog("Correct")
//                    dispatch_async(dispatch_get_main_queue(), {
//                        self.segueToNext()
//                    })
//                }
            }
            else if result.isCancelled {
                // Handle cancellations
                NSLog("Cancelled")
                dispatch_async(dispatch_get_main_queue(), {
                    self.segueToNext()
                })

//                if result.grantedPermissions.contains("email") {
//                    // Do work
//                    NSLog("%@", result)
//                    NSLog("Correct")
//                    }
            }
            else {
                if result.grantedPermissions.contains("email") {
                    // Do work
                    NSLog("%@", result)
                    NSLog("Correct")
                    dispatch_async(dispatch_get_main_queue(), {
                        self.segueToNext()
                    })
                }
            }
        })
    }
    

    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> ()
    {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView)
    {
        print("scroll view did end decelrating")
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
        
        if pageNumber == 3 {
            facebookButton.hidden = false
            facebookButton.enabled = true
        } else {
            facebookButton.hidden = true
            facebookButton.enabled = false
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    func segueToNext() {
        performSegueWithIdentifier("showTable", sender: self)
    }
    
}