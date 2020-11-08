// ----------------------------------------------------------------------------
//
//  Database+Crypto.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SQLCipher
import GRDB

// ----------------------------------------------------------------------------

public extension DatabaseQueue
{
// MARK: - Properties

    /**
     * Checks whether a database is readable.
     *
     * This will confirm whether:
     * - is database open
     * - if open, it will try a simple SELECT statement and confirm that it succeeds.
     *
     * @return  TRUE if everything succeeds, FALSE on failure.
     */
    final var isReadable: Bool
    {
        // FMDb/FMDatabase.m
        // @link https://github.com/ccgus/fmdb/blob/v2.7/src/fmdb/FMDatabase.m#L467

        let rowCount = self.read({ db -> Int in
            (try? Int.fetchOne(db, sql: "SELECT COUNT(*) FROM `sqlite_master` WHERE `type` = 'table';")) ?? 0
        })
        return rowCount > 0
    }
}

// ----------------------------------------------------------------------------
