//
//  MemoryMailComponentContext.swift
//  FeatherMailDriverMemory
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import FeatherComponent

/// memory mail component context
public struct MemoryMailComponentContext: ComponentContext {

    /// memory mail component context init
    public init() {

    }

    /// make
    public func make() throws -> ComponentFactory {
        MemoryMailComponentFactory()
    }
}
