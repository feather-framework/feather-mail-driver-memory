//
//  FeatherMailDriverMemoryTests.swift
//  FeatherMailDriverMemoryTests
//
//  Created by Tibor Bodecs on 2023. 01. 16..
//

import Logging
import Foundation
import XCTest
import FeatherService
import FeatherMail
import FeatherMailDriverMemory
import XCTFeatherMail

final class FeatherMailDriverMemoryTests: XCTestCase {

    func testMemoryDriverUsingTestSuite() async throws {
        do {
            let registry = ServiceRegistry()
            
            try await registry.add(.memoryMail(), as: .memoryMail)

            try await registry.run()
            let mail = try await registry.get(.memoryMail) as! MailService

            do {
                let suite = MailTestSuite(mail)
                try await suite.testAll(
                    from: "from@example.com",
                    to: "to@example.com"
                )
                
                let service = mail as! MemoryMailService
                let mailbox = await service.getMailbox()
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
