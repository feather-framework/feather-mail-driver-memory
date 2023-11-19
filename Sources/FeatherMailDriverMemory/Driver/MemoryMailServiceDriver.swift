//
//  MemoryMailServiceDriver.swift
//  FeatherMailDriverMemory
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import FeatherService

struct MemoryMailServiceDriver: ServiceDriver {

    func run(using config: ServiceConfig) throws -> Service {
        MemoryMailService(config: config)
    }
}
