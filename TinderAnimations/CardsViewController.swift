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
    var originalSpin: CGAffineTransform!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ryanImageView.isUserInteractionEnabled = true
        originalSpin = ryanImageView.transform

        // Do any additional setup after loading the view.
    }

  
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        //Don't like refering to sender
    let drag = sender
       let location = drag.location(in: view)
        let velocity = drag.velocity(in: view)
        let translation = drag.translation(in: view)
        
        let thresholdX = CGFloat(50)
        let thresholdSpin = CGFloat(100) // in degrees
        
        
        let xVelocity = CGFloat(velocity.x)
        let xTranslation = CGFloat(translation.x)
        let spinRateScale = CGFloat(1.5)
        
        let spinRate = spinRateScale*(thresholdSpin / thresholdX) //with rate degrees/per x
        //In other words how much we should spin given having moved to the rite
        
        if drag.state == .began{

        }else if drag.state == .changed{
            if xVelocity > 0 && xTranslation < thresholdX   {
                
                
                ryanImageView.transform = ryanImageView.transform.rotated(by: CGFloat(spinRate * CGFloat(M_PI) / 180))
            }else if xVelocity < 0 && abs(xTranslation) < thresholdX   {
                
                
                ryanImageView.transform = ryanImageView.transform.rotated(by: CGFloat(-spinRate * CGFloat(M_PI) / 180))
            }
            
            
        }else if drag.state == .ended{
            print("ended dragging")
            
            if xTranslation > 50 {
                print("moved more than 50 units to the right")
                UIView.animate(withDuration: 0.5, animations: {
                    let transform: CGAffineTransform = CGAffineTransform(translationX: self.ryanImageView.frame.width, y: 500)
                    self.ryanImageView.transform = transform
                }) { (success) in
                    self.ryanImageView.isHidden = true
                }
            }else if xTranslation < -50 {
                print("moved more than 50 units to the left")
                UIView.animate(withDuration: 0.5, animations: {
                    let transform: CGAffineTransform = CGAffineTransform(translationX: -self.ryanImageView.frame.width, y: 700)
                    self.ryanImageView.transform = transform
                }) { (success) in
                    self.ryanImageView.isHidden = true
                }
            }else {
                ryanImageView.transform = CGAffineTransform.identity
                
            }
        }
        
        
        print("x translation: \(xTranslation)")
        
//        if xVelocity > 0 && xTranslation < thresholdX {
//
//
//            ryanImageView.transform = ryanImageView.transform.rotated(by: CGFloat(spinRate * CGFloat(M_PI) / 180))
//        }
        
        
        
        
    }
    
}
