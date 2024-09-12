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

    static let memoryMail: MemoryMail = .init()
    /// component config
    public let config: ComponentConfig

    subscript<T>(
        dynamicMember keyPath: KeyPath<MemoryMailComponentContext, T>
    ) -> T {
        let context = config.context as! MemoryMailComponentContext
        return context[keyPath: keyPath]
    }

    init(config: ComponentConfig) {
        self.config = config
    }
}

extension MemoryMailComponent {

    /// get mail box object
    public func getMailbox() async -> [Mail] {
        await Self.memoryMail.getMailbox()
    }

    /// clear mail box
    public func clearMailbox() async {
        await Self.memoryMail.clear()
    }
}

extension MemoryMailComponent: MailComponent {

    /// send a new mail
    public func send(_ email: FeatherMail.Mail) async throws {
        await Self.memoryMail.add(email)
    }
}
