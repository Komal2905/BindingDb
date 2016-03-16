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
import ReactiveFoundation

// Class For changing String
class DynamicString
{
   // property observers
    //typealias command  introduce new type, Listener, which is a closure that accepts
    //one String argument and returns nothing
    // listener closure
    typealias Listener = String -> Void
    
    
    var listener: Listener?
    
    func bind(listener: Listener?)
    {
        self.listener = listener
        print("listener 1", listener)
        listener?(value)
    }
    
    var value: String
        {
            didSet
            {
                listener?(value)
                print("listener 2", listener)
            }
        }
    
    //wrapping or boxing of an object
    init(_ v: String)
    {
        value = v
    }
}


//define class for ContentviewModel
class ContentViewModel1
{
    
    // property observers
    //typealias command  introduce new type, Listener, which is a closure that accepts
    //one String argument and returns nothing
    // listener closure

    typealias ListenerModel = String -> Void
    var listenerModel: ListenerModel?
    
    func bindModel(listenerModel: ListenerModel?)
    {
        self.listenerModel = listenerModel
    }
    
    var mContentTitle: String
        {
        didSet
        {
            listenerModel?(mContentTitle)
        }
    }
    
    var mContentInfo : String
        {
        didSet
        {
            listenerModel?(mContentInfo)
        }

        }
    
    //wrapping or boxing of an object
    init(_ v: String, _ x : String)
    {
        mContentTitle = v
        mContentInfo = x
    }

    
}


class ViewController: UIViewController
{
    
    // intialze with
    var string1 = Observable("A")
    
    var string2 = Observable("B")
    

    @IBOutlet weak var txt1: UITextField!
    
    @IBOutlet weak var txt2: UITextField!

    @IBOutlet weak var txtLable: UILabel!
    
    @IBOutlet weak var contentTitle: UILabel!
    @IBOutlet weak var contentiInfo: UILabel!
    
    
    //button2
    @IBAction func b2(sender: AnyObject)
    {
        string2.value = "Z"
    }
    
    //button1
    @IBAction func b1(sender: AnyObject)
    {
        
        // change value of observer 
        // whenever value of string1 changes string1.observe executes
        string1.value = "x"
        
        dynamicStringGenerate()
    }

    
    
    func dynamicStringGenerate()
    {
        
        let name = DynamicString("Steve")
        var i = 1
        name.bind({
            value in
            
            print("-0-",value, i)
            i++
        })
        
        //
        name.value = "Tim"  // prints: Tim
        name.value = "Groot"
        print("TextLable",txtLable.text)
        
        //bind object of DynamicString 
        //pass argument $0
        name.bind {
            print("--",$0)
        }
        name.bind{ self.txtLable.text = $0
        }
        
        print(txtLable.text)
        name.value = "Komal"
        print(txtLable.text)
        name.value = "kamble"
        print(txtLable.text)
    }
    
    
    @IBAction func ContentModelChanges(sender: AnyObject)
    {
        
        //ConetntModel
       
        let conetntModel1 = ContentViewModel1("Test1", "Test2")
        
        conetntModel1.bindModel
            {
            print("Here",$0) // $0 is argument
            self.contentTitle.text = $0
            self.contentiInfo.text = $0
            }
        
      
        //set value to listener
        conetntModel1.mContentTitle = "MyTitle"
        conetntModel1.mContentInfo = "My Info"
        
        print("printing Before changing")
        
        print("conetntModel1.mContentTitle",conetntModel1.mContentTitle)
        
        print("conetntModel1.mContentInfo",conetntModel1.mContentInfo)
        
        print("Changing VAlue")
        
        //change values
        conetntModel1.mContentTitle = "MyTitleChange"
        conetntModel1.mContentInfo = "My InfoChange"
        

    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        

        print("STring1",string1.value)
        string1.observe { Value in
                        print("hi", (Value))
                        }
        
        // add observer
        string2.observe { Value in
                        print("hi", (Value))
                        }
        // bind String to TextField
        string1.bindTo(txt1)
        string2.bindTo(txt2)
       
       

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

