//
//  GameViewController.swift
//  SpriteKitTest
//
//  Created by Leonardo Puga-DeBiase on 3/21/16.
//  Copyright (c) 2016 Leonardo Puga-DeBiase. All rights reserved.
//

import SpriteKit

class CannonGame: SKScene, SKPhysicsContactDelegate {

    var cannon:SKSpriteNode!
    var cannonBase:SKSpriteNode!
    var touchLocation:CGPoint = CGPointZero
    
    let wallMask:UInt32 = 0x1 << 0 //1
    let ballMask:UInt32 = 0x1 << 1 //2
    let pegMask:UInt32 = 0x1 << 2 //4
    let squareMask:UInt32 = 0x1 << 3 //8
    
    
    override func didMoveToView(view: SKView) {
        GeneralFunctions.setFramesMeassuerementsVisibility(self, isVisible: false)
        self.physicsWorld.contactDelegate = self
        
        cannon = self.childNodeWithName("cannon") as! SKSpriteNode
        cannon.position.x = size.width / 2
        cannon.position.y = size.height - 82
        
        cannonBase = self.childNodeWithName("cannonBase") as! SKSpriteNode
        cannonBase.position.x = size.width / 2
        cannonBase.position.y = size.height - 82
        
        
        let leftWall:SKSpriteNode = SKSpriteNode.init(color: UIColor.redColor(), size: CGSize(width: 54, height: size.height*2))
        leftWall.position = CGPointMake(-26, 0)
        leftWall.name = "leftWall"
        leftWall.physicsBody = SKPhysicsBody.init(rectangleOfSize: leftWall.size)
        
        leftWall.physicsBody?.dynamic = false
        leftWall.physicsBody?.allowsRotation = false
        leftWall.physicsBody?.affectedByGravity = false
        leftWall.physicsBody?.contactTestBitMask = 0
        leftWall.physicsBody?.categoryBitMask = 1
        self.addChild(leftWall)
        
        
        let rightWall:SKSpriteNode = SKSpriteNode.init(color: UIColor.redColor(), size: CGSize(width: 54, height: size.height*2))
        rightWall.position = CGPointMake(size.width+27, 0)
        rightWall.name = "rightWall"
        rightWall.physicsBody = SKPhysicsBody.init(rectangleOfSize: rightWall.size)
        
        rightWall.physicsBody?.dynamic = false
        rightWall.physicsBody?.allowsRotation = false
        rightWall.physicsBody?.affectedByGravity = false
        rightWall.physicsBody?.contactTestBitMask = 0
        rightWall.physicsBody?.categoryBitMask = 1
        self.addChild(rightWall)
        
        
        let downWall:SKSpriteNode = SKSpriteNode.init(color: UIColor.redColor(), size: CGSize(width: size.width*2, height: 54))
        downWall.position = CGPointMake(0, -26)
        downWall.name = "downWall"
        downWall.physicsBody = SKPhysicsBody.init(rectangleOfSize: downWall.size)
        
        downWall.physicsBody?.dynamic = false
        downWall.physicsBody?.allowsRotation = false
        downWall.physicsBody?.affectedByGravity = false
        downWall.physicsBody?.contactTestBitMask = 0
        downWall.physicsBody?.categoryBitMask = 1
        self.addChild(downWall)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        touchLocation = touches.first!.locationInNode(self)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        touchLocation = touches.first!.locationInNode(self)
    }
    
    override func update(currentTime: NSTimeInterval) {
        let percent = touchLocation.x / size.width
        let newAngle = percent * 180 - 180
        cannon.zRotation = CGFloat(newAngle) * CGFloat(M_PI) / 180.0
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let ball:SKSpriteNode = SKScene(fileNamed:"Ball")!.childNodeWithName("ball")! as! SKSpriteNode
        ball.removeFromParent()
        self.addChild(ball)
        ball.zPosition = 0
        ball.position = cannon.position
        
        //Get angle in radians
        let angleInRadians = Float(cannon.zRotation)
        // set speed
        let speed = CGFloat(95.0)
        //set the velocity
        let vx:CGFloat = CGFloat(cosf(angleInRadians)) * speed
        let vy:CGFloat = CGFloat(sinf(angleInRadians)) * speed
        
        ball.physicsBody?.applyImpulse(CGVectorMake(vx, vy))
        ball.physicsBody?.collisionBitMask = wallMask | ballMask | pegMask
    }
    
    func handleTap(gestureRecognize: UIGestureRecognizer) {
    
    }

    func didBeginContact(contact: SKPhysicsContact) {
        print("contact!")
    }
}
