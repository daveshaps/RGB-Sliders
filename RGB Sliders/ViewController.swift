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
        
        //setting user defaults 
        
        let defaults = UserDefaults.standard
        defaults.set(redUISlider.value, forKey: "red")
        defaults.set(greenUISlider.value, forKey: "green")
        defaults.set(blueUISlider.value, forKey: "blue")
        defaults.synchronize() //stores the data immediately
        
    }
    
    //MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openColor" {
            let newViewController = segue.destination
            newViewController.view.backgroundColor = colorSquare.backgroundColor
        }
    }
    //So you name the segue (which is linked to a specific button) and set data in the new ViewController based some data in the old ViewController.
    
    //MARK: Other
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorSquare.layer.borderColor = UIColor.black.cgColor
        colorSquare.layer.borderWidth = 1
        
        //set slider values in view to stored user defaults
        let defaults = UserDefaults.standard
        redUISlider.value = defaults.float(forKey: "red")
        greenUISlider.value = defaults.float(forKey: "green")
        blueUISlider.value = defaults.float(forKey: "blue")
        
        //update background before visible to user
        updateBackgroundColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

