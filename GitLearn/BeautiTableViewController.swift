//
//  BeautiTableViewController.swift
//  GitLearn
//
//  Created by Qingke on 16/4/6.
//  Copyright © 2016年 Qingke. All rights reserved.
//

import UIKit

class BeautiTableViewController: UITableViewController {
    var mms = [Beauty]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let mm1 = Beauty(name: "美女1", photo: UIImage(named: "mm1"), rating: 4)!
        let mm2 = Beauty(name: "美女2", photo: UIImage(named: "mm2"), rating: 5)!
        let mm3 = Beauty(name: "美女3", photo: UIImage(named: "mm3"), rating: 3)!
        let mm4 = Beauty(name: "美女3", photo: UIImage(named: "mm3"), rating: 3)!

        mms += [mm1,mm2,mm3,mm4]
    }
    @IBAction func unWindToBeautyList(segue: UIStoryboardSegue){                    //1  ibaction 2 storyBoard Segue
    
        if let sourceViewController = segue.sourceViewController as? BeautyViewController,
            let beauty = sourceViewController.beauty {
            let newIndexPath = NSIndexPath(forRow: mms.count, inSection: 0)
            mms.append(beauty)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #return the number of rows
        return mms.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BeautyCell", forIndexPath: indexPath) as!BeautyTableViewCell
        let mm = mms[indexPath.row]
        
        cell.nameLabel.text = mm.name
        cell.photo.image = mm.photo
        cell.ratingView.rating = mm.rating
        
        


        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "edit" {
            print("准备进入编辑模式")
            //找到美女
            let selectCell = sender as! BeautyTableViewCell
            let indexPath = tableView.indexPathForCell(selectCell)
            let selectBeauty = mms[indexPath!.row]
            
            let beautyViewController = segue.destinationViewController as! BeautyViewController
            beautyViewController.beauty = selectBeauty
            
        } else {
            print("准备进入增加模式")
        }
        
        
    }
    

}




















