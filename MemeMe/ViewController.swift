//
//  ViewController.swift
//  MemeMe
//
//  Created by Reem Saloom on 11/18/18.
//  Copyright © 2018 Reem AlSalloom. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    let memeTextAttributes:[NSAttributedString.Key: Any] = [
        NSAttributedString.Key(rawValue: NSAttributedString.Key.strokeColor.rawValue): UIColor.black,
        NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white,
        NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedString.Key(rawValue: NSAttributedString.Key.strokeWidth.rawValue): 2.0]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topTextField.textAlignment = NSTextAlignment.center
        bottomTextField.textAlignment = NSTextAlignment.center
        
        
        
        
        bottomTextField.defaultTextAttributes = memeTextAttributes
        topTextField.defaultTextAttributes = memeTextAttributes
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        subscribeToKeyboardNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        unsubscribeToKeyboardNotification()
    }
    
    func getKeyboardHeight(_ notification: Notification) ->CGFloat
    {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }
    
    @objc func keyboardWillShow(_ notification: Notification)
    {
        view.frame.origin.y = -getKeyboardHeight(notification)
    }
    
    func subscribeToKeyboardNotification()
    {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    func unsubscribeToKeyboardNotification()
    {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    //    override func textFieldDidBeginEditing()
    //    {
    //
    //    }
    //textFieldShouldReturn
    //    func textFieldShouldReturn()
    //    {}
    //    @IBAction func experiment(sender: UIButton){
    //
    //
    //        //Activity View Controller
    //       // let image = UIImage()
    //       //let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
    //
    //
    //        //Image Picker Controller
    //      //  let controller = UIImagePickerController()
    //
    //        //Alert View Controller
    //        let controller = UIAlertController()
    //        controller.title = "title"
    //        controller.message = "this is a message"
    //
    //        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    //
    //      //  alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
    //
    //
    //        controller.addAction(okAction)
    //        present(controller, animated: true, completion: nil)
    //
    //    }
    
    @IBAction func pickAnImage(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        present(controller, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    //  func imagePickerControllerDidCancel(_ UIImagePickerController)
    //{
    //     dismiss(animated: true, completion: nil)
    //}
}

