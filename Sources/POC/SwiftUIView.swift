//
//  SwiftUIView.swift
//  
//
//  Created by José leoncio Quispe rodriguez on 14/12/23.
//

import SwiftUI

public protocol SwiftUIDelegate: AnyObject {
    func didPerformAction()
}

public class ObservableObjectDelegate: ObservableObject {
    weak public var delegate: SwiftUIDelegate?
    
    public func performAction() {
        delegate?.didPerformAction()
    }
}

public struct SwiftUIView: View {
    
    public init() {
        
    }
    
    let cells: [IdentifiableCell] = [Type1Cell(), Type2Cell(), Type3Cell(), Type4Cell(), Type5Cell()]
    @ObservedObject var viewModel = InformationViewModel()
    
    @State var nextView: Bool = false
   
    @ObservedObject public var observableObject = ObservableObjectDelegate()
    
    
    public var body: some View {
        NavigationView {
            List(cells, id: \.id) { cell in
                cell.view().onTapGesture {
                    if let index = cells.firstIndex(where: { $0.id == cell.id }) {
                        print("Celda seleccionada en el índice: \(index)")
                        switch index {
                        case 0:
                            nextView = true
                            
                        case 1:
                            print("dev= 1")
                        case 2:
                            print("dev= 2")
                        default:
                            print("-")
                        }
                    }
                }
            }.listRowInsets(EdgeInsets())
                .background(
                    NavigationLink(
                        destination: EditInfo(),
                        isActive: $nextView,
                        label: {
                            EmptyView()
                        }
                    )
                )
                .navigationBarTitle("Datos personales", displayMode: .inline)
                .navigationBarItems(leading:
                                        Button(action: {
                    observableObject.performAction()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                }
                )
        }
    }
}

#if DEBUG
struct MySwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
#endif
