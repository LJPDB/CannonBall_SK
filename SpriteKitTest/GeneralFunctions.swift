//
//  GeneralFunctions.swift
//  SpriteKitTest
//
//  Created by Leonardo Puga-DeBiase on 5/29/16.
//  Copyright © 2016 Leonardo Puga-DeBiase. All rights reserved.
//

import SpriteKit

public class GeneralFunctions {
    class func setFramesMeassuerementsVisibility(sceneTest:SKScene, isVisible: Bool){
        sceneTest.view!.showsFPS = isVisible
        sceneTest.view!.showsNodeCount = isVisible
        sceneTest.view!.ignoresSiblingOrder = isVisible
    }
    
}
