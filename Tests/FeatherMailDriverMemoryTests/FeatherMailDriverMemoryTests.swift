//
//  FeatherMailDriverMemoryTests.swift
//  FeatherMailDriverMemoryTests
//
//  Created by Tibor Bodecs on 2023. 01. 16..
//

import Logging
import Foundation
import XCTest
import FeatherComponent
import FeatherMail
import FeatherMailDriverMemory
import XCTFeatherMail

final class FeatherMailDriverMemoryTests: XCTestCase {

    func testMemoryDriverUsingTestSuite() async throws {
        do {
            let registry = ComponentRegistry()
            
            try await registry.addMail(MemoryMailComponentContext())

            try await registry.run()
            let mail = try await registry.mail()

            do {
                let suite = MailTestSuite(mail)
                try await suite.testAll(
                    from: "from@example.com",
                    to: "to@example.com"
                )
                
                let component = mail as! MemoryMailComponent
                let mailbox = await component.getMailbox()
                XCTAssertFalse(mailbox.isEmpty)

                try await registry.shutdown()
            }
            catch {
                try await registry.shutdown()
                
                throw error
            }
        }
        catch {
            XCTFail("\(error)")
        }
    }

}
