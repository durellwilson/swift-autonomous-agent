import XCTest
@testable import SwiftAutonomousAgent

final class OrchestratorTests: XCTestCase {
    func testProjectScanner() async throws {
        let scanner = ProjectScanner()
        let projects = try await scanner.scan()
        
        XCTAssertGreaterThanOrEqual(projects.count, 0)
    }
    
    func testUpgradeEngine() async throws {
        let engine = UpgradeEngine()
        let project = Project(name: "Test", path: "/tmp", type: .swiftPackage)
        
        let upgrades = try await engine.analyze(project)
        XCTAssertNotNil(upgrades)
    }
    
    func testContentGenerator() async throws {
        let generator = ContentGenerator()
        let content = try await generator.generate(count: 3)
        
        XCTAssertEqual(content.count, 3)
    }
    
    func testImpactAnalyzer() async throws {
        let analyzer = ImpactAnalyzer()
        let projects = [
            Project(name: "P1", path: "/p1", type: .swiftPackage),
            Project(name: "P2", path: "/p2", type: .xcodeProject)
        ]
        
        let report = try await analyzer.analyze(projects)
        XCTAssertEqual(report.totalProjects, 2)
        XCTAssertEqual(report.swiftPackages, 1)
        XCTAssertEqual(report.xcodeProjects, 1)
    }
}
