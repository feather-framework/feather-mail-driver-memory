//
//  MemoryMailComponentContext.swift
//  FeatherMailDriverMemory
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import FeatherComponent

public struct MemoryMailComponentContext: ComponentContext {

    public init(){
        
    }

    public func make() throws -> ComponentBuilder {
        MemoryMailComponentBuilder()
    }
}
