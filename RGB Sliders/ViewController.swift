//
//  ViewController.swift
//  RGB Sliders
//
//  Created by Wish Carr on 11/14/16.
//  Copyright © 2016 David Shapiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var redUISlider: UISlider!
    
    @IBOutlet weak var greenUISlider: UISlider!
    
    @IBOutlet weak var blueUISlider: UISlider!
    
    @IBOutlet weak var colorSquare: UIView!
    
    //MARK: Actions
    
    
    @IBAction func updateBackgroundColor() {
        let red = CGFloat(redUISlider.value)
        let green = CGFloat(greenUISlider.value)
        let blue = CGFloat(blueUISlider.value)
        
        colorSquare.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorSquare.layer.borderColor = UIColor.black.cgColor
        colorSquare.layer.borderWidth = 1
        
        //update background before visible to user
        updateBackgroundColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

