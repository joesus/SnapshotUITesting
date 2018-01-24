//
//  SnapshotTestCase.swift
//  SnapshotUITestingUITests
//
//  Created by Joe Susnick on 1/23/18.
//  Copyright © 2018 Joe Susnick. All rights reserved.
//

import XCTest
import FBSnapshotTestCase

class SnapshotTestCase: FBSnapshotTestCase {

    func verifyView(file: StaticString = #file, line: UInt = #line) {
        guard let croppedImage = app.screenshot().image.removingStatusBar else {
            return XCTFail("An error occurred while cropping the screenshot", file: file, line: line)
        }

        FBSnapshotVerifyView(UIImageView(image: croppedImage))
    }

    override func recordFailure(
        withDescription description: String,
        inFile filePath: String,
        atLine lineNumber: Int,
        expected: Bool
        ) {

        let imageData = UIImagePNGRepresentation(app.screenshot().image)
        if let path = failureImageDirectoryPath?
            .appendingPathComponent("/")
            .appendingPathComponent("\(self)_\(lineNumber)") {

            try? imageData?.write(to: path)
        }

        super.recordFailure(withDescription: description, inFile: filePath, atLine: lineNumber, expected: expected)
    }

    private var failureImageDirectoryPath: URL? {
        let fileManager = FileManager.default
        guard let pathString = ProcessInfo.processInfo.environment["FAILED_UI_TEST_DIR"] else {
            return nil
        }

        let path = URL(fileURLWithPath: pathString)
        if !fileManager.fileExists(atPath: path.absoluteString) {
            try? fileManager.createDirectory(
                at: path,
                withIntermediateDirectories: true,
                attributes: nil
            )
        }
        return path
    }

}
