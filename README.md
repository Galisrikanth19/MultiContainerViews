# MultiContainerViews//
//  ViewController.swift
//  SampleProject
//
//  Created by ELORCE INDUSTRIES PRIVATE LIMITED on 22/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var masterView: UIView!
    var childVC1:ChildVC1?
    var childVC2:ChildVC2?
    var childVC3:ChildVC3?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyB = UIStoryboard(name: "Main", bundle: nil)
        childVC1 = storyB.instantiateViewController(withIdentifier: "ChildVC1") as? ChildVC1
        childVC2 = storyB.instantiateViewController(withIdentifier: "ChildVC2") as? ChildVC2
        childVC3 = storyB.instantiateViewController(withIdentifier: "ChildVC3") as? ChildVC3
        
        allClosures()
    }
    
    private func allClosures() {
    }

    @IBAction func passDataClicked(_ sender: Any) {
        childVC1?.dataPassedIs(str: "Srikanth")
    }
    
    @IBAction func segmentControlChanged(_ sender: UISegmentedControl) {
        var childVC:UIViewController?
        
        switch sender.selectedSegmentIndex {
            case 0:
                childVC = childVC1
                addChildVC(childVC: childVC)
                childVC1 = childVC as? ChildVC1
                childVC1?.openPop = { str in
                print("content transfered from child")
                }
            
            case 1:
                childVC = childVC2
            case 2:
                childVC = childVC3
            default:
                break;
            }
        

    }
    
    func addChildVC(childVC: UIViewController?) {
        if let childVC = childVC, let childView = childVC.view {
            masterView.subviews.forEach({ $0.removeFromSuperview() })
            childView.frame = masterView.bounds
            
            masterView.addSubview(childView)
            
            childView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                childView.topAnchor.constraint(equalTo: masterView.topAnchor),
                childView.bottomAnchor.constraint(equalTo: masterView.bottomAnchor),
                childView.leadingAnchor.constraint(equalTo: masterView.leadingAnchor),
                childView.trailingAnchor.constraint(equalTo: masterView.trailingAnchor)
            ])
            
            addChild(childVC)
        }
    }
    
}
