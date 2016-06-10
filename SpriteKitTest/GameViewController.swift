//
//  GameViewController.swift
//  SpriteKitTest
//
//  Created by Leonardo Puga-DeBiase on 3/25/16.
//  Copyright © 2016 Leonardo Puga-DeBiase. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    override func didReceiveMemoryWarning() {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        if let mainmenu = MainMenu(fileNamed:"MainMenu"){ //! as CannonGame
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.ignoresSiblingOrder = true
            skView.presentScene(mainmenu)
        }

    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    
}
