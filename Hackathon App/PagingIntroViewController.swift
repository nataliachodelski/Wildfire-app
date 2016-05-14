//
//  PagingIntroViewController.swift
//  Hackathon App
//
//  Created by Natalia on 14/05/2016.
//  Copyright © 2016 NataliaDeveloper. All rights reserved.
//

import UIKit
import EZSwiftExtensions

class PagingIntroViewController: UIViewController, UIScrollViewDelegate {

    var images : [UIImage] = []
    var frame: CGRect = CGRectMake(0, 0, 0, 0)
    //var scrollview = UIScrollView!

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.frame = CGRectMake(0, 0, self.view.size.width, self.view.size.height)
        
        let scrollViewWidth: CGFloat = self.scrollView.frame.width
        let scrollViewHeight: CGFloat = self.scrollView.frame.height
        
        let imgOne = UIImageView(frame: CGRectMake(0, 0, scrollViewWidth, scrollViewHeight))
        let imgTwo = UIImageView(frame: CGRectMake(scrollViewWidth, 0,scrollViewWidth, scrollViewHeight))
        let imgThree = UIImageView(frame: CGRectMake(scrollViewWidth * 2, 0,scrollViewWidth, scrollViewHeight))
        
        imgOne.image = UIImage(named: "Intro1")
        imgTwo.image =  UIImage(named: "Intro2")
        imgThree.image = UIImage(named: "Intro3")
        
        imgOne.scaleImageFrameToHeight(height: scrollViewHeight)
        imgTwo.scaleImageFrameToHeight(height: scrollViewHeight)
        imgThree.scaleImageFrameToHeight(height: scrollViewHeight)

        scrollView.addSubview(imgOne)
        scrollView.addSubview(imgTwo)
        scrollView.addSubview(imgThree)
        
        imgOne.userInteractionEnabled = true
        
        
        scrollView.contentSize = CGSize(width: self.scrollView.frame.width * 3, height: self.scrollView.frame.height)
        
        scrollView.pagingEnabled = true
        scrollView.userInteractionEnabled = true

        scrollView.delegate = self
        pageControl.currentPage = 0
        
        print("view size is \(view.size), imageview size is \(imgTwo.size), scrollview size is \(scrollView.size), contenst size is \(scrollView.contentSize)")
        
        }
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()


    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {

        
            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            pageControl.currentPage = Int(pageNumber)
        
//            let pageWidth:CGFloat = CGRectGetWidth(scrollView.frame)
//            let currentPage:CGFloat = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1
//            self.pageControl.currentPage = Int(currentPage);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
