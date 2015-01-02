//
//  ViewController.swift
//  BattleShip
//
//  Created by Ruben van den Engel on 02-01-15.
//  Copyright (c) 2015 Ruben van den Engel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let host = "http://localhost:3700/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        connectToHost()
        
    }

    private func connectToHost() {
        SIOSocket.socketWithHost(host, reconnectAutomatically: true, attemptLimit: 0, withDelay: 1, maximumDelay: 5, timeout: 20, response: {socket in
            socket.onConnect = {
                println("Connected to \(self.host)")
                //socket.emit("add user", args: [self.username])
            }
            socket.on("getSchepen", callback: {(AnyObject data) -> Void in
                let json = JSON(data)
                
                println(json)
                println(json[0][1]["width"])
                
                //socket.emit("new message", args: [self.message])
            })
            socket.onDisconnect = {
                println("Disconnected from \(self.host)")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

