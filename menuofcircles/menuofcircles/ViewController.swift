//
//  ViewController.swift
//  menuofcircles
//
//  Created by Landon Vago-Hughes on 07/11/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.
//

import UIKit
import CircleMenu

class ViewController: UIViewController, CircleMenuDelegate {
    
    
    let items: [(icon: String, color: UIColor)] = [
        ("search", UIColor(red:146/255, green:0, blue:254/255, alpha:1)),
        ("notification", UIColor(red:0, green:189/255, blue:35/255, alpha:1)),
        ("location", UIColor(red:47/255, green:117/255, blue:245/255, alpha:1)),
        ("settings", UIColor(red:244/255, green:168/255, blue:35/255, alpha:1)),
        ("home", UIColor(red:244/255, green:47/255, blue:35/255, alpha:1)),
        ]

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(red: 0, green: 35/255, blue: 68/255, alpha: 1)
        super.viewDidLoad()
        
        let button = CircleMenu(
            frame: CGRect.zero,
            normalIcon:"menu",
            selectedIcon:"close",
            buttonsCount: 5,
            duration: 0.8,
            distance: 150)
        button.delegate = self
        view.addSubview(button)
        button.backgroundColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.widthAnchor.constraint(equalToConstant: view.layer.frame.width*0.2).isActive = true
        button.layer.cornerRadius = view.layer.frame.width*0.1
        button.heightAnchor.constraint(equalToConstant: view.layer.frame.width*0.2).isActive = true
        button.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor, constant: 0).isActive = true
        button.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor, constant: 0).isActive = true
        
        view.addSubview(button)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func circleMenu(_ circleMenu: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        button.backgroundColor = items[atIndex].color
        button.setImage(UIImage(named: items[atIndex].icon), for: .normal)
        let highlightedImage  = UIImage(named: items[atIndex].icon)?.withRenderingMode(.alwaysTemplate)
        button.setImage(highlightedImage, for: .highlighted)
        button.tintColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
}

