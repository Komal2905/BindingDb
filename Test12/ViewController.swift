//
//  ViewController.swift
//  Test12
//
//  Created by Vidya Ramamurthy on 09/03/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import ReactiveKit
import ReactiveUIKit

class ViewController: UIViewController
{
    
    
    var string1 = Observable("A")
    
    var string2 = Observable("B")
    
    @IBOutlet weak var txt1: UITextField!
    
    @IBOutlet weak var txt2: UITextField!
    
    
    @IBAction func b2(sender: AnyObject)
    {
        string1.value = "Z"
    }
    
    @IBAction func b1(sender: AnyObject)
    {
        
    }


    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        string1.bindTo(txt1)
        string1.bindTo(txt2)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

