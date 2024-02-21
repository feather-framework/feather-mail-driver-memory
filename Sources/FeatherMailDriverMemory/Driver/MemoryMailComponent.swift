//
//  MemoryMailComponent.swift
//  FeatherMailDriverMemory
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import Foundation
import FeatherComponent
import FeatherMail

@dynamicMemberLookup
public struct MemoryMailComponent {

    let memoryMail: MemoryMail
    public let config: ComponentConfig

    subscript<T>(
        dynamicMember keyPath: KeyPath<MemoryMailComponentContext, T>
    ) -> T {
        let context = config.context as! MemoryMailComponentContext
        return context[keyPath: keyPath]
    }

    init(config: ComponentConfig) {
        self.memoryMail = .init()
        self.config = config
    }
}

extension MemoryMailComponent {
    
    public func getMailbox() async -> [Mail] {
        await memoryMail.getMailbox()
    }
}

extension MemoryMailComponent: MailComponent {

    public func send(_ email: FeatherMail.Mail) async throws {
        await memoryMail.add(email)
    }
}
