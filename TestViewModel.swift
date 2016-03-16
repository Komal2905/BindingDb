//
//  Test12ViewModel.swift
//  Test12
//
//  Created by Vidya Ramamurthy on 13/03/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

import ReactiveKit
import ReactiveUIKit
import ReactiveFoundation

//define structure for ContentviewModel
struct ContentViewModel
{
    var mContentTitle : Observable<String?>    // observalable lable

}


class TestViewModel
{
    let name = Observable("Komal")
    
    var name1 =  String()
    
    //create object of ContentViewModel
    var contentViewModel = ContentViewModel!()
    // controller's object
    var controllerVar = TestController()
    
    init()
    {
        
        name.observe{
            value in print( (value))
        }
        name1 = (controllerVar.getVar())
        
        //name.bindTo(ViewController().txt1!)
        print("name",name)
        name.value = "ABC"
        
        print("NAME1", Observable(name1))
        contentViewModel = ContentViewModel(mContentTitle: Observable(controllerVar.getVar()))
//        test()
      
    }
    
    func test()
    {
        print("Name from controller BEFORE : ",contentViewModel)
        name.value = "Jim Kirk" // Prints: Hi Jim Kirk!
        print("Name from controller AFTER : ",contentViewModel)
        
    }
}