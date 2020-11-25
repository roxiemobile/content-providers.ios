// ----------------------------------------------------------------------------
//
//  DatabaseOpenDelegate.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import GRDB

// ----------------------------------------------------------------------------

@available(*, deprecated, message: "\n• Write a description.")
public protocol DatabaseOpenDelegate
{
// MARK: - Methods

    /**
     * Called when the database will create for the first time.
     *
     * @param   name  Name of the database file.
     *
     * @return  Path of the database template file to use to copy the database
     *          or NIL to create the empty database file.
     */
    func databaseWillCreate(name: String?) -> (assetPath: URL?, encryptionKey: Data?)
    
    /**
     * Called when the database will be opened.
     *
     * @param name Name of the database.
     *
     * @return Database encryption key required for opening database.
     */
    func databaseWillOpen(name: String?) -> Data?

    /**
     * Called when the database connection is being configured, to enable features
     * such as write-ahead logging or foreign key support.
     *
     * @param  name      The name of the database.
     * @param  database  The database.
     */
    func configureDatabase(name: String?, dbQueue: DatabaseQueue)

    /**
     * Called when the database is created for the first time.
     *
     * @param  name      The name of the database.
     * @param  database  The database.
     */
    func databaseDidCreate(name: String?, dbQueue: DatabaseQueue)

    /**
     * Called when the database needs to be upgraded.
     *
     * @param  name        The name of the database.
     * @param  database    The database.
     * @param  oldVersion  The old database version.
     * @param  newVersion  The new database version.
     */
    func upgradeDatabase(name: String?, dbQueue: DatabaseQueue, oldVersion: Int, newVersion: Int)

    /**
     * Called when the database needs to be downgraded.
     *
     * @param  name        The name of the database.
     * @param  database    The database.
     * @param  oldVersion  The old database version.
     * @param  newVersion  The new database version.
     */
    func downgradeDatabase(name: String?, dbQueue: DatabaseQueue, oldVersion: Int, newVersion: Int)

    /**
     * Called when the database has been opened.
     *
     * @param  name      The name of the database.
     * @param  database  The database.
     */
    func databaseDidOpen(name: String?, dbQueue: DatabaseQueue)

    /**
     * Called when the database has been opened.
     *
     * @param  name   The name of the database.
     * @param  error  The error description.
     */
    func databaseDidOpenWithError(name: String?, error: NSError)
}

// ----------------------------------------------------------------------------
