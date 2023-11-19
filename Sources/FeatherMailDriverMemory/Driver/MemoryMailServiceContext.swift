//
//  MemoryMailServiceContext.swift
//  FeatherMailDriverMemory
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import FeatherService

struct MemoryMailServiceContext: ServiceContext {

    func createDriver() throws -> ServiceDriver {
        MemoryMailServiceDriver()
    }
}
