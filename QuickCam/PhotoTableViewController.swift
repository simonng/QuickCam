//
//  PhotoTableViewController.swift
//  QuickCam
//
//  Created by Simon Ng on 27/1/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import ImagePicker

class PhotoTableViewController: UITableViewController, ImagePickerDelegate {
    
    @IBOutlet var emptyBackgroundView:UIView!

    private var photos = [UIImage]()
    let imagePickerController = ImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePickerController.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showCamera() {
        presentViewController(imagePickerController, animated: true, completion: nil)
    }

    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        dismissViewControllerAnimated(true, completion: nil)
        photos.insertContentsOf([info[UIImagePickerControllerOriginalImage] as! UIImage], at: 0)
        tableView.reloadData()
    }
    
    func doneButtonDidPress(images: [UIImage]) {
        imagePickerController.dismissViewControllerAnimated(true, completion: nil)
        photos.insertContentsOf(images, at: 0)
        tableView.reloadData()
    }
    
    func cancelButtonDidPress() {
        imagePickerController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func wrapperDidPress(images: [UIImage]) {
        
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        // Present empty background view if there is no photos
        if photos.count <= 0 {
            tableView.backgroundView = emptyBackgroundView
            tableView.separatorStyle = .None
            
            return 0
        }
        
        // Reset the background view and separator style
        tableView.backgroundView = nil
        tableView.separatorStyle = .SingleLine
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoTableViewCell

        // Configure the cell...
        cell.photoImageView.image = photos[indexPath.row]

        return cell
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
