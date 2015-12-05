//: Playground - noun: a place where people can play

import UIKit


func getReceiptPicture(sender: UIButton){
    imagePicker.delegate = self
    imagePicker.sourceType = .Camera
    
    presentViewController(imagePicker, animate: true, completion: nil)
}


func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]){
    imagePicker.dismissViewControllerAnimated(true, completion: nil)
    imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
}


func saveReceipt(sender: UIButton){
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {()->() in
        var image = UIImage
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let destinationPath = documentsPath.stringByAppendingPathComponent("filename.jpg")
        UIImageJPEGRepresentation(image,1.0).writeToFile(destinationPath, atomically: true)
        
        
        dispatch_async(dispatch_get_main_queue()) {
            // reset UIImageView
            imageView.image = nil
            
        }
    }
}


takeReceiptPicture{
    
    
    
    
    
}


CreateBackgroundthread

exceuteThread{
    
}