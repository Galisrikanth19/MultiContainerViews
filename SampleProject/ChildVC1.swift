//
//  ChildVC1.swift
//  SampleProject
//
//  Created by ELORCE INDUSTRIES PRIVATE LIMITED on 05/11/21.
//

import UIKit

class ChildVC1: UIViewController {

    var openPop:((_ str:String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func dataPassedIs(str: String) {
        debugPrint(str)
    }

    @IBAction func sendCallBack(_ sender: Any) {
        openPop?("srikanth is calling back")
    }
}
