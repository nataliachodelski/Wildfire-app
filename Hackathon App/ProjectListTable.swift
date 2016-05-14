////
////  ProjectListTable.swift
////  Hackathon App
////
////  Created by Natalia on 14/05/2016.
////  Copyright © 2016 NataliaDeveloper. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class ProjectListTable: UITableViewController {
//    
//    //@IBOutlet var ChapterTableView: UITableView!
//    //@IBOutlet weak var aboutRightBarButton: UIBarButtonItem!
//    
//    
//     func viewDidLoad()
//    {
//        super.viewDidLoad()
//        print("hello")
//        ChapterTableView.separatorStyle = UITableViewCellSeparatorStyle.None
//    }
//    
//    
//     func viewDidAppear(animated: Bool)
//    {
//        super.viewDidAppear(animated)
//        
//    }
//    
//    // Table view data source methods
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
//    {
//        return 1
//    }
//    
//    // Return the number of rows in the section.
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//        return 3
//        //return chapterData.chapters.count
//    }
//    
//    // I assign data to the table view cells in this section
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
//    {
//        let cell = self.tableView.dequeueReusableCellWithIdentifier("ChapterTableCell", forIndexPath: indexPath) as! ChapterTableViewCell
//        let row = indexPath.row
//        cell.chapterLabel.text = chapterData.chapters[row].heading.uppercaseString
//        cell.chapterSubtitle.text = chapterData.chapters[row].title
//        
//        
//        cell.chapterLabel.font = chapterData.tableHeadingFont
//        cell.chapterSubtitle.font =  chapterData.tableSubHeadingFont
//        cell.purchaseIcon.tag = indexPath.row //to note row for img clicked
//        
//        
//        return cell
//    }
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
//    {
//        let indexPath = tableView.indexPathForSelectedRow
//        chapterData.currentChapter = indexPath!.row
//        
//        
//        //performSegueWithIdentifier("showChapterScrollview", sender: nil)
//        
//    }
//    
//}
