//
//  MemoryMailComponent.swift
//  FeatherMailDriverMemory
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import Foundation
import FeatherComponent
import FeatherMail

/// memory mail component
@dynamicMemberLookup
public struct MemoryMailComponent {

    let memoryMail: MemoryMail
    /// component config
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

    /// get mail box object
    public func getMailbox() async -> [Mail] {
        await memoryMail.getMailbox()
    }
}

extension MemoryMailComponent: MailComponent {

    /// send a new mail
    public func send(_ email: FeatherMail.Mail) async throws {
        await memoryMail.add(email)
    }
}
