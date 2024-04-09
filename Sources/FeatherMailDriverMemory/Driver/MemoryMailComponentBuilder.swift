//
//  MemoryMailComponentBuilder.swift
//  FeatherMailDriverMemory
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import FeatherComponent

struct MemoryMailComponentFactory: ComponentFactory {

    func build(using config: ComponentConfig) throws -> Component {
        MemoryMailComponent(config: config)
    }
}
