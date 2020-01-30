import XCTest
@testable import SwiftCoreMLTools

final class ModelTests: XCTestCase {
    func testSingleInputs() {
        let model = Model {
            Input(name: "dense_input1", shape: [1], featureType: .Double)
        }

        XCTAssertEqual(model.descriptions?.count, 1)
    }

    func testMultipleInputs() {
        let model = Model {
            Input(name: "dense_input1", shape: [1], featureType: .Double)
            Input(name: "dense_input2", shape: [1], featureType: .Double)
            Output(name: "output", shape: [1], featureType: .Double)
            TrainingInput(name: "dense_input", shape: [1], featureType: .Double)
            TrainingInput(name: "output_true", shape: [1], featureType: .Double)
        }

        XCTAssertEqual(model.descriptions?.count, 5)
    }

    func testWithMetadata() {
        let model = Model(version: 4,
                          shortDescription: "Trivial linear classifier",
                          author: "Jacopo Mangiavacchi",
                          license: "MIT",
                          userDefined: ["SwiftCoremltoolsVersion" : "0.1"]) {
                            Input(name: "dense_input", shape: [1], featureType: .Double)
                            Output(name: "output", shape: [1], featureType: .Double)
                            TrainingInput(name: "dense_input", shape: [1], featureType: .Double)
                            TrainingInput(name: "output_true", shape: [1], featureType: .Double)
        }

        XCTAssertEqual(model.descriptions?.count, 4)
    }

    static var allTests = [
        ("testSingleInputs", testSingleInputs),
        ("testMultipleInputs", testMultipleInputs),
        ("testWithMetadata", testWithMetadata),
    ]
}
