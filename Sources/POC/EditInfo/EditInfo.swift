//
//  EditInfo.swift
//  UserProfile
//
//  Created by José leoncio Quispe rodriguez on 17/12/23.
//

import SwiftUI

public struct EditInfo: View {
    
    public init() {  }
    
    var data = InfoListData()
    @State private var selectedCell: Int?
    @State private var text: String = "ROSS"
    
    public var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Escribe tu nombre o apodos")
                    .bold()
                TextField("Ingrese su texto", text: $text)
                    .padding(.horizontal, 10)
                    .background(
                        Rectangle()
                            .frame(height: 0.8)
                            .foregroundColor(Color(hex: "#E0E0E2"))
                            .offset(y: 20)
                    )
            }.padding(20)
            
            VStack(alignment: .leading) {
                VStack {
                    Text("Elige una imagen de perfil")
                        .bold()
                }.padding(.horizontal, 20)
                
                VStack {
                    List {
                        ForEach(data.infoListData.indices, id: \.self) { index in
                            HStack(spacing: 10) {
                                VStack {
                                    ZStack {
                                        Circle()
                                            .fill(Color(hex:  "#EEF1F3"))
                                            .frame(width: 50, height: 50)
                                        
                                        if let imageName = data.infoListData[index].image,
                                           let image = UIImage(named: imageName) {
                                            Image(uiImage: image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .clipShape(Circle())
                                                .frame(width: 50, height: 50)
                                        } else {
                                            Text("A")
                                                .foregroundColor(Color(hex: "#4C4E50"))
                                                .font(.system(size: 20, weight: .bold))
                                        }
                                    }
                                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                }
                                
                                VStack(alignment: .leading, spacing: 15) {
                                    Text(data.infoListData[index].name)
                                        .bold()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text(data.infoListData[index].description)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(selectedCell == index ? Color.blue : Color(hex: "#E9E8ED"), lineWidth: 2)
                            )
                            .onTapGesture {
                                selectedCell = index
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                
                
            }
            .padding(.vertical, 25)
            
            
        }.navigationBarTitle("Nombre y imagen", displayMode: .inline)
            .frame(maxWidth: .infinity)
        
        
    }
    
    
}

#Preview {
    EditInfo()
}
