import Foundation
import Vapor
import FluentPostgreSQL

final class User: Codable {
    var id: UUID?
    var name: String
    var username: String
    var email: String
    var phone: String?
    
    init(name: String, username: String, email: String, phone: String?) {
        self.name =  name
        self.username = username
        self.email = email
        self.phone = phone
    }
}

extension User {
    var acronyms: Children<User, Acronym> {
        return children(\.userID)
    }
}

extension User: PostgreSQLUUIDModel {}
extension User: Content {}
extension User: Migration {}
extension User: Parameter {}



