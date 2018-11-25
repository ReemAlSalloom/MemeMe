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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func experiment(sender: UIButton){
       
        
        //Activity View Controller
       // let image = UIImage()
       //let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        
        //Image Picker Controller
      //  let controller = UIImagePickerController()
        
        //Alert View Controller
        let controller = UIAlertController()
        controller.title = "title"
        controller.message = "this is a message"
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
      //  alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))

        
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
        
    }

    @IBAction func pickAnImage(_ sender: Any) {
         let controller = UIImagePickerController()
        controller.delegate = self
        present(controller, animated: true, completion: nil)

    }
}

