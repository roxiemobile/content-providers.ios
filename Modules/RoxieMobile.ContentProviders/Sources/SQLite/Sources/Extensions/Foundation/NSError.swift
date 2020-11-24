// ----------------------------------------------------------------------------
//
//  NSError.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension NSError
{
// MARK: - Construction

    convenience init(code: NSError.DatabaseError.Code, description: String? = nil) {
        self.init(domain: DatabaseError.Domain, code: code.rawValue, userInfo: (description != nil) ? [NSLocalizedDescriptionKey: description!] : nil)
    }

    convenience init(code: NSError.FileError.Code, description: String? = nil) {
        self.init(domain: FileError.Domain, code: code.rawValue, userInfo: (description != nil) ? [NSLocalizedDescriptionKey: description!] : nil)
    }

    convenience init(code: NSError.SerializationError.Code, description: String? = nil) {
        self.init(domain: SerializationError.Domain, code: code.rawValue, userInfo: (description != nil) ? [NSLocalizedDescriptionKey: description!] : nil)
    }

// MARK: - Properties

    class var databaseIsInvalid: NSError
    {
        struct Singleton {
            static let error = NSError(code: DatabaseError.Code.databaseIsInvalid,
                    description: "Database is not valid.")
        }
        return Singleton.error
    }

    class var inputIsInvalid: NSError
    {
        struct Singleton {
            static let error = NSError(code: DatabaseError.Code.inputIsInvalid,
                    description: "Input parameter(s) is not valid.")
        }
        return Singleton.error
    }

    class var modelIsInvalid: NSError
    {
        struct Singleton {
            static let error = NSError(code: DatabaseError.Code.modelIsInvalid,
                    description: "Model is not valid. The custom validation for the input data failed.")
        }
        return Singleton.error
    }

// MARK: - Constants

    struct DatabaseError
    {
        // Error domain
        public static let Domain = "DatabaseErrorDomain"

        // Error code
        public enum Code: Int {
            case databaseIsInvalid = 1
            case inputIsInvalid = 2
            case modelIsInvalid = 3
        }
    }

    struct FileError
    {
        // Error domain
        static let Domain = "FileErrorDomain"

        // Error code
        public enum Code: Int {
            case fileNotFound = 1
        }
    }

    struct SerializationError
    {
        // Error domain
        static let Domain = "SerializationErrorDomain"

        // Error code
        public enum Code: Int {
            case couldNotDecodeRawData = 1
            case objectIsInvalid = 2
        }
    }

}

// ----------------------------------------------------------------------------
