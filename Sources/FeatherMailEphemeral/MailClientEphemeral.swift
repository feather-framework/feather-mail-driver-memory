//
//  MailClientEphemeral.swift
//  feather-mail-ephemeral
//
//  Created by Tibor Bödecs on 2020. 04. 28..
//

import FeatherMail

/// An in-memory mail client implementation.
///
/// `MailClientEphemeral` conforms to `MailClient` and delivers mails to an
/// actor-isolated `EphemeralMailbox` instance. Incoming mails are validated
/// before being stored, mirroring the behavior of real mail transports.
///
/// This client is intended for testing, previews, and local development.
/// It does not perform network operations and does not persist data.
public struct MailClientEphemeral: Sendable {

    /// The underlying in-memory mailbox used for validated storage.
    private let mailbox: EphemeralMailbox

    /// Creates a new in-memory mail client.
    ///
    /// - Parameter mailbox: The mailbox instance used for storage.
    ///   Defaults to a new `EphemeralMailbox` instance.
    public init(mailbox: EphemeralMailbox = EphemeralMailbox()) {
        self.mailbox = mailbox
    }
}

extension MailClientEphemeral: MailClient {

    /// Sends a mail by storing it in memory.
    ///
    /// - Parameter mail: The mail to validate and store.
    /// - Throws: `MailError` if validation fails.
    public func send(_ mail: Mail) async throws(MailError) {
        do {
            try await mailbox.add(mail)
        }
        catch {
            throw .validation(error)
        }
    }

    /// Validates a mail using the in-memory validator.
    ///
    /// - Parameter mail: The mail to validate.
    /// - Throws: `MailValidationError` when validation fails.
    public func validate(_ mail: Mail) async throws(MailValidationError) {
        try await mailbox.validate(mail)
    }
}

extension MailClientEphemeral {

    /// Returns all mails currently stored in the mailbox.
    ///
    /// - Returns: A snapshot of delivered mails in insertion order.
    public func getMailbox() async -> [Mail] {
        await mailbox.getMailbox()
    }

    /// Removes all mails from the mailbox.
    public func clearMailbox() async {
        await mailbox.clear()
    }
}
