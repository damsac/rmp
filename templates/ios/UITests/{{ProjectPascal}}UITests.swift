import XCTest

class {{ProjectPascal}}UITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testScrollThroughContent() {
        // Wait for content to load
        let firstCell = app.cells.firstMatch
        let exists = firstCell.waitForExistence(timeout: 15)

        if exists {
            for _ in 0..<4 {
                app.swipeUp()
                sleep(1)
            }
            for _ in 0..<2 {
                app.swipeDown()
                sleep(1)
            }
        }

        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
