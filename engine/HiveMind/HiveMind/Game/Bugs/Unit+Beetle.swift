//
//  Unit+Beetle.swift
//  HiveMind
//
//  Created by Joseph Roque on 2019-02-08.
//  Copyright © 2019 Joseph Roque. All rights reserved.
//

import Foundation

extension Unit {
	func movesAsBeetle(in state: GameState) -> Set<Movement> {
		guard self.canMove(as: .beetle, in: state) else { return [] }
		guard let position = state.units[self], position != .inHand, let height = self.stackPosition(in: state) else { return [] }

		let movesOntoStack = Set(
			position.adjacent()
				.filter {
					// Filter to positions which contain other units, since we want to move onto those stacks
					return state.stacks[$0] != nil
				}
				.filter {
					// Filter to positions that the piece can freely move to
					let endHeight = state.stacks[$0]?.endIndex ?? 1
					return position.freedomOfMovement(to: $0, startingHeight: height, endingHeight: endHeight, in: state)
				}.compactMap {
					movement(to: $0)
				})

		return self.movesAsQueen(in: state).union(movesOntoStack)
	}
}
