//
//  ViewController.swift
//  VLOImageDemo
//
//  Created by Prowadzący on 04/01/17.
//  Copyright © 2017 KIS. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {
    
    var image: UIImage!
    
    @IBOutlet weak var URLTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func goButtonPressed(_ sender: Any) {
        image = UIImage(ciImage: CIImage(contentsOf: URL(string: URLTextField.text!)!)!)
        displayImage(image: image)
    }
    
    @IBAction func detectFaces(_ sender: Any) {
        let detector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
        let faces = detector!.features(in: image.ciImage!)
        debugPrint(faces[0].bounds)
    }
    
    
    func displayImage(image myImage: UIImage) {
        imageView.image = myImage
        print(myImage.size.width)
        print(myImage.size.height)
        print(imageView.frame.size.width)
        print(imageView.frame.size.height)
        
        let t = (myImage.size.width)/(myImage.size.height)
        print(t)
        let r = (imageView.frame.size.width)/(imageView.frame.size.height)
        print(r)
        
        var szer=0
        var wys=0
        var marg=0
        var marg2=0
        
        if t<r {
            let b = (myImage.size.height)/(imageView.frame.size.height)
            print((myImage.size.width)/b)
           
            marg2 = Int(((imageView.frame.size.width)-((myImage.size.width)/b))/2)
            print(marg2)
            marg = 0
            szer = Int((myImage.size.width)/b)
            print (szer)
            wys = Int(imageView.frame.size.height)
            print (wys)
        }
        
        else {
            let a = (myImage.size.width)/(imageView.frame.size.width)
            print((myImage.size.height)/a)
           
            marg = Int(((imageView.frame.size.height)-((myImage.size.height)/a))/2)
            print(marg)
            marg2 = 0
            szer = Int(imageView.frame.size.width)
            print (szer)
            wys = Int((myImage.size.height)/a)
            print (wys)
        }
        
        UIGraphicsBeginImageContext(CGSize(width: imageView.frame.size.width, height: imageView.frame.size.height))
        
        myImage.draw(in: CGRect(x: marg2, y: marg, width: szer, height: wys))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        imageView.image = newImage
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

