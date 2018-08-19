//
//  WeakScopeTest.swift
//  SwinjectObjectScopeTestTests
//
//  Created by m3g0byt3 on 19/08/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//
// swiftlint:disable implicitly_unwrapped_optional force_unwrapping force_cast multiline_function_chains

import XCTest
import Swinject
@testable import SwinjectObjectScopeTest

class WeakScopeTest: XCTestCase {

    var container: Container!

    override func setUp() {
        super.setUp()

        container = Container()

        container.register(ClassProtocol.self) { _ in
            return SingletonClass()
        }.inObjectScope(.weak)

        container.register(NonClassProtocol.self) { _ in
            return SingletonClass()
        }.inObjectScope(.weak)
    }

    override func tearDown() {
        container = nil
        super.tearDown()
    }

    func testClassProtocol() {
        let dependencyType = ClassProtocol.self
        let firstInstance = container.resolve(dependencyType)
        let secondInstance = container.resolve(dependencyType)
        XCTAssert(firstInstance! === secondInstance!, "instances are not the same")
    }

    func testNonClassProtocol() {
        let dependencyType = NonClassProtocol.self
        let firstInstance = container.resolve(dependencyType)
        let secondInstance = container.resolve(dependencyType)
        // Force-cast to underlying type to allow using identity operator
        XCTAssert((firstInstance as! SingletonClass) === (secondInstance as! SingletonClass), "instances are not the same")
    }
}
