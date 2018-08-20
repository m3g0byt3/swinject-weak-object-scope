//
//  ContainerSpec.swift
//  SwinjectObjectScopeTestTests
//
//  Created by m3g0byt3 on 20/08/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//
// swiftlint:disable implicitly_unwrapped_optional force_unwrapping nimble_operator

import Foundation
import Quick
import Nimble
import Swinject
@testable import SwinjectObjectScopeTest

class ContainerSpec: QuickSpec {

    override func spec() {

        var container: Container!

        beforeEach {
            container = Container()
        }

        afterEach {
            container = nil
        }

        describe("Resolution of a service represented by a class Swift protocol") {

            context("using container object scope") {

                it("should resolve same object") {
                    container.register(ClassProtocol.self) { _ in SingletonClass() }
                        .inObjectScope(.container)

                    let firstInstance = container.resolve(ClassProtocol.self)!
                    let secondInstance = container.resolve(ClassProtocol.self)!

                    expect(firstInstance).to(beIdenticalTo(secondInstance))
                }
            }

            context("using weak object scope") {

                it("should resolve same object") {
                    container.register(ClassProtocol.self) { _ in SingletonClass() }
                        .inObjectScope(.weak)

                    let firstInstance = container.resolve(ClassProtocol.self)!
                    let secondInstance = container.resolve(ClassProtocol.self)!

                    expect(firstInstance).to(beIdenticalTo(secondInstance))
                }
            }
        }

        describe("Resolution of a service represented by a non-class Swift protocol") {

            context("using container object scope") {

                it("should resolve same object") {
                    container.register(NonClassProtocol.self) { _ in SingletonClass() }
                        .inObjectScope(.container)

                    let firstInstance = container.resolve(NonClassProtocol.self)!
                    let secondInstance = container.resolve(NonClassProtocol.self)!

                    expect(firstInstance).to(beIdenticalTo(secondInstance))
                }
            }

            context("using weak object scope") {

                it("should resolve same object") {

                    container.register(NonClassProtocol.self) { _ in SingletonClass() }
                        .inObjectScope(.weak)

                    let firstInstance = container.resolve(NonClassProtocol.self)!
                    let secondInstance = container.resolve(NonClassProtocol.self)!

                    expect(firstInstance).to(beIdenticalTo(secondInstance))
                }
            }
        }
    }
}
