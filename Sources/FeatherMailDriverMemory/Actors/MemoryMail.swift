//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 19/11/2023.
//

import Foundation
import FeatherMail

final actor MemoryMail {
    
    var delivered: [Mail]
    
    init() {
        self.delivered = []
    }
    
    func getMailbox() -> [Mail] {
        delivered
    }

    func add(_ mail: Mail) {
        delivered.append(mail)
    }
}
