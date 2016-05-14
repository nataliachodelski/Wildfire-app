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

class PagingIntroViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView : UIScrollView!
    var images:[UIImage] = []
    var frame: CGRect = CGRectMake(0, 0, 0, 0)
    var pageControl = UIPageControl()
    
    let image1 = UIImage(named: "Intro1")
    let image2 =  UIImage(named: "Intro2")
    let image3 = UIImage(named: "Intro3")
    let image4 = UIImage(named: "Intro4")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = UIScrollView(frame: CGRectMake(0, 0, self.view.size.width, self.view.size.height))

        images = [image1!, image2!, image3!, image4!]
        
        
        // Do any additional setup after loading the view, typically from a nib.
        configurePageControl()
        
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        for index in 0..<4 {
            
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            frame.size = self.scrollView.frame.size
            self.scrollView.pagingEnabled = true
            
            var subView = UIImageView(frame: frame)
            subView.image = images[index]
            self.scrollView .addSubview(subView)
        }
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 4, self.scrollView.frame.size.height)
        pageControl.addTarget(self, action: #selector(PagingIntroViewController.changePage(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        
    }
    
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        
        self.pageControl.numberOfPages = images.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.redColor()
        self.pageControl.pageIndicatorTintColor = UIColor.blackColor()
        self.pageControl.currentPageIndicatorTintColor = UIColor.greenColor()
        self.pageControl.frame = CGRectMake(self.view.size.width * 1/3, self.view.size.height * 0.9, self.view.size.width * 1/3, 10)

        self.view.addSubview(pageControl)
        
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//        imgOne.image = UIImage(named: "Intro1")
//        imgTwo.image =  UIImage(named: "Intro2")
//        imgThree.image = UIImage(named: "Intro3")
//        
//        imgOne.scaleImageFrameToHeight(height: scrollViewHeight)
//        imgTwo.scaleImageFrameToHeight(height: scrollViewHeight)
//        imgThree.scaleImageFrameToHeight(height: scrollViewHeight)
//
//         button.setTitle("Login", forState: UIControlState.Normal)
//        button.backgroundColor = UIColor.yellowColor()
//        
//        button.frame = CGRectMake(view.size.width * 1/3, 0.9 * view.size.height, view.size.width * 1/3, 10)
    
    
//        pageControl.frame = CGRect(x: view.size.width * 0.1, y: view.size.height - 10, width: view.size.width * 0.8, height: 10)

          // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}