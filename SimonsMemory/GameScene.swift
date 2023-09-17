//
//  GameScene.swift
//  SimonsMemory
//
//  Created by Bruno Thuma on 16/09/23.
//

import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let size = CGSize(width: 10, height: 10)
        let square = SKSpriteNode(color: .red,
                                  size: size)
        square.position = location
        square.physicsBody = SKPhysicsBody(rectangleOf: size)
        addChild(square)
    }
    
}
