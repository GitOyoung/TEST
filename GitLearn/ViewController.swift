//
//  ViewController.swift
//  GitLearn
//
//  Created by Qingke on 16/4/1.
//  Copyright © 2016年 Qingke. All rights reserved.
//

import UIKit

class BeautyViewController: UIViewController{

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var texField: UITextField!
    @IBOutlet weak var imageOutlet: UIImageView!

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var ratingControl: RatingView!
    var beauty: Beauty?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        texField.delegate = self
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    @IBAction func changNameButton(sender: UIButton) {
        texField.text = ""
        //nameLabel.text = "默认美女芳名"
    }
    
    @IBAction func selectImage(sender: UITapGestureRecognizer) {
        print("手势识别器启用")
        texField.resignFirstResponder()
        let imagePick = UIImagePickerController()
        imagePick.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        imagePick.delegate = self
        presentViewController(imagePick, animated: true, completion: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = texField.text ?? ""
            let photo = imageOutlet.image
            let rating = ratingControl.rating
            
            beauty = Beauty(name: name, photo: photo, rating: rating)
        }
    }
    

    
}
extension BeautyViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        texField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        nameLabel.text = texField.text
        
    }
    
}
extension BeautyViewController: UIImagePickerControllerDelegate{
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let SelectImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageOutlet.image = SelectImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
extension BeautyViewController: UINavigationControllerDelegate {
    
}


