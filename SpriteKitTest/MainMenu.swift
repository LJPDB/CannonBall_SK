//
//  MainMenu.swift
//  SpriteKitTest
//
//  Created by Leonardo Puga-DeBiase on 4/19/16.
//  Copyright © 2016 Leonardo Puga-DeBiase. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {

    var gameTitle:SKSpriteNode!
    var tapstart:SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        let title = self.childNodeWithName("GameNameTitle")
        title?.position.x = size.width / 2
        title?.position.y = size.height - 92
        
        let tapStart = self.childNodeWithName("TapStart")
        tapStart?.position.x = size.width / 2
        tapStart?.position.y = size.height / 2 - 40
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let gameScene:CannonGame = CannonGame(fileNamed: "CannonGame"){
            GeneralFunctions.setFramesMeassuerementsVisibility(self, isVisible: true)
            // set the scene to the view
            gameScene.size.width = self.view!.frame.size.width * 2
            gameScene.size.height = self.view!.frame.size.height * 2
            print("self.view.bounds.width: \(self.view!.frame.size.width)")
            // scene.size.height = self.view.bounds.height
            gameScene.scaleMode = .AspectFit
            
            let transition:SKTransition = SKTransition.flipVerticalWithDuration(1.0)
            self.view?.presentScene(gameScene, transition: transition)
        }
    }
    
}
