//
//  ServiceContextFactory+MemoryMailService.swift
//  FeatherMailDriverMemory
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import FeatherService

public extension ServiceContextFactory {

    static func memoryMail() -> Self {
        .init {
            MemoryMailServiceContext()
        }
    }
}
