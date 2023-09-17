//
//  ContentView.swift
//  SimonsMemory
//
//  Created by Bruno Thuma on 16/09/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
            let scene = GameScene()
            scene.size = CGSize(width: 300,
                                height: 300)
            scene.scaleMode = .aspectFill
            return scene
        }
    
    var body: some View {
        SpriteView(scene: scene)
            .statusBarHidden(true)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
