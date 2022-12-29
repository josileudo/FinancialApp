import SwiftUI

/**
 Demonstrates the new half/bottomsheet API capabilities in SwiftUI 4.
 Display medium and/or large resizable sheets, and even create sheets with a custom height.
 */
struct SheetsView: View {
  @State private var isShowingSheet: SheetType?
    
  var body: some View {
      if #available(iOS 16.0, *) {
          NavigationStack {
              List(SheetType.allCases) { type in
                  Button("Show \(type.title) Sheet") { self.isShowingSheet = type }
              }
              .navigationTitle("New Sheets")
          }
          .sheet(item: self.$isShowingSheet) { SheetView(sheetType: $0) }
      } else {
          // Fallback on earlier versions
      }
  }
}

// MARK: - SheetView
@available(iOS 16.0, *)
struct SheetView: View {
  let sheetType: SheetType
  
  @Environment(\.dismiss) private var dismiss
  
  @State private var currentDetent: PresentationDetent = Self.tinyDetent
  
  private static let tinyDetent = PresentationDetent.height(150)
  private static let threeQuartersDetent = PresentationDetent.fraction(0.75)

    @available(iOS 16.0, *)
    var body: some View {
      if #available(iOS 16.0, *) {
          NavigationStack {
              List {
                  Text("Showing \(self.sheetType.title) Sheet")
              }
              .navigationTitle(self.sheetType.title)
              .navigationBarTitleDisplayMode(.inline)
              .toolbar {
                  ToolbarItem(placement: .cancellationAction) {
                      Button("Cancel") { self.dismiss() }
                  }
              }
          }
          .presentationDetents(self.detents, selection: self.$currentDetent)
      } else {
          // Fallback on earlier versions
      }
  }
  
  var detents: Set<PresentationDetent> {
    switch self.sheetType {
    case .standard:
      return []
    case .medium:
      return [.medium]
    case .mediumResizable:
      return [.medium, .large]
    case .custom:
      return [Self.tinyDetent, .medium, Self.threeQuartersDetent, .large]
    }
  }
}

// MARK: - SheetType
enum SheetType: Identifiable, CaseIterable {
  var id: String { self.title }
  
  case standard, medium, mediumResizable, custom
  
  var title: String {
    switch self {
    case .standard:         return "Standard"
    case .medium:           return "Medium"
    case .mediumResizable:  return "Medium Resizable"
    case .custom:           return "Custom"
    }
  }
}
