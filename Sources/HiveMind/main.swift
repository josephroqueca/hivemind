//
//  main.swift
//  HiveMind
//
//  Created by Joseph Roque on 2019-02-11.
//  Copyright © 2019 Joseph Roque. All rights reserved.
//

import HiveMindCore

let tool = CommandLineTool()
do {
	try tool.run()
} catch {
	print("An error occurred: \(error)")
}