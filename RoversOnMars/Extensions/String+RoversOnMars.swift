//
//  String+RoversOnMars.swift
//  RoversOnMars
//
//  Created by Giuseppe Bottiglieri on 02/02/18.
//  Copyright © 2018 gbtt. All rights reserved.
//

import Foundation

extension String {
    static func readInputFile(fileName: String) -> String? {
        let cwd = FileManager.default.currentDirectoryPath
        let script = CommandLine.arguments[0];
        
        var path: String = ""
        if script.hasPrefix("/") { //absolute
            path = (script as NSString).deletingLastPathComponent
        } else {
            let urlCwd = URL(fileURLWithPath: cwd)
            if let p = URL(string: script, relativeTo: urlCwd)?.path {
                path = (p as NSString).deletingLastPathComponent
            }
        }
        let location = path + "/" + fileName
        
        return try? String(contentsOfFile: location, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
    }
}
