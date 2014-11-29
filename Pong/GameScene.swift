//
//  GameScene.swift
//  Pong
//
//  Created by Carina Macia on 28/10/14.
//  Copyright (c) 2014 Our company. All rights reserved.
//

import SpriteKit

var ball : Ball = Ball()
var ballTexture = SKTexture(imageNamed: "Spaceship")


class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 65
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        self.addChild(myLabel)
        
        /* Adding the Ball to the Scene */
        ball = Ball(texture: ballTexture)
        ball.position =  CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        
        let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
        ball.runAction(SKAction.repeatActionForever(action))
        self.addChild(ball)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            var location = touch.locationInNode(self)
            var node = nodeAtPoint(location)
            
            if (node == ball) {
                ball.physicsBody = SKPhysicsBody(texture: ballTexture, size: CGSize(width: 15,height: 15))
                NSLog("Ha detectat!!")
            }
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
