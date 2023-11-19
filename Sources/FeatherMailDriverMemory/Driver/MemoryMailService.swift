//
//  MemoryMailService.swift
//  FeatherMailDriverMemory
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import Foundation
import FeatherService
import FeatherMail

@dynamicMemberLookup
public struct MemoryMailService {

    let memoryMail: MemoryMail
    public let config: ServiceConfig

    subscript<T>(
        dynamicMember keyPath: KeyPath<MemoryMailServiceContext, T>
    ) -> T {
        let context = config.context as! MemoryMailServiceContext
        return context[keyPath: keyPath]
    }

    init(config: ServiceConfig) {
        self.memoryMail = .init()
        self.config = config
    }
}

extension MemoryMailService {
    
    public func getMailbox() async -> [Mail] {
        await memoryMail.getMailbox()
    }
}

extension MemoryMailService: MailService {

    public func send(_ email: FeatherMail.Mail) async throws {
        await memoryMail.add(email)
    }
}
