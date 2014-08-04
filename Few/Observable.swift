//
//  Observable.swift
//  Few
//
//  Created by Josh Abernathy on 8/2/14.
//  Copyright (c) 2014 Josh Abernathy. All rights reserved.
//

import Foundation

public protocol Setable {
	typealias ValueType

	var value: ValueType { get set }
}

public class Observable<T> {
	public typealias ObserveFunc = T -> ()

	public var value: T {
	didSet {
		notify();
	}
	}

	private var observers: [ObserveFunc] = Array()

	public init(initialValue: T) {
		value = initialValue
	}

	public func addObserver(fn: ObserveFunc) {
		observers.append(fn)
	}

	private func notify() {
		for o in observers {
			o(value)
		}
	}
}

extension Observable: Setable {

}