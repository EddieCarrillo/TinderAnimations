//
//  CardsViewController.swift
//  TinderAnimations
//
//  Created by Eduardo Carrillo on 4/13/18.
//  Copyright © 2018 Eduardo Carrillo. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var ryanImageView: UIImageView!
    
    var cardInitialCenter: CGPoint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ryanImageView.isUserInteractionEnabled = true

        // Do any additional setup after loading the view.
    }

  
    @IBAction func didPan(_ sender: Any) {
        
        
        
    }
    
}
