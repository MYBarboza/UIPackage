//
//  InformationView.swift
//  UserProfile
//
//  Created by José leoncio Quispe rodriguez on 14/12/23.
//

import SwiftUI
import Combine

enum CellType {
    case type1, type2, type3, type4
}

// Protocolo para las celdas
protocol IdentifiableCell {
    var id: UUID { get }
    var cellType: CellType { get }
    func view() -> AnyView
}

// Implementación de celdas
struct Type1Cell: IdentifiableCell {
    let id = UUID()
    let cellType: CellType = .type1
    
    func view() -> AnyView {
        return AnyView(
            
            HStack {
                Image("emoji-unicorn")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 5)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Nombre de imagen").bold()
                    Text("ROSS")
                }.padding(.leading, 10)
                Spacer()
                Image( "angleRight2")
            }.padding(.vertical, 10)
        )
    }
}

struct Type2Cell: IdentifiableCell {
    let id = UUID()
    let cellType: CellType = .type2
    
    func view() -> AnyView {
        return AnyView(
            HStack {
                VStack(alignment: .leading, spacing: 15){
                    Text("Correo electronico").bold()
                    Text("No hay ninguno registrado")
                }.padding(.leading, 10)
                Spacer()
                Image( "angleRight2")
            }.padding(.vertical, 10)
        )
    }
}

struct Type3Cell: IdentifiableCell {
    let id = UUID()
    let cellType: CellType = .type3
    
    func view() -> AnyView {
        return AnyView(
            HStack {
                VStack(alignment: .leading, spacing: 15){
                    HStack {
                        Text("Número de celular").bold()
                        Image( "icon_success")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 15, height: 15)
                            .clipShape(Circle())
                            .offset(y: -2.0)
                        
                        
                        
                    }
                    Text("+51*** ***294")
                }.padding(.leading, 10)
                Spacer()
                Image( "angleRight2")
            }.padding(.vertical, 10)
        )
    }
}

struct Type4Cell: IdentifiableCell {
    let id = UUID()
    let cellType: CellType = .type4
    
    func view() -> AnyView {
        return AnyView(
            HStack {
                VStack(alignment: .leading, spacing: 15){
                    HStack {
                        Text("Información de contacto").bold()
                        Image( "iconInfo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 15, height: 15)
                            .clipShape(Circle())
                            .offset(y: -2.0)
                    }
                    Text("Mantén actualizada tu informacirón laboral, dirección de domicilio y celular de contacto.")
                    
                    HStack {
                        Text("Revisar mis datos").bold()
                            .foregroundColor(Color.gray)
                        
                        Spacer()
                        Image( "angleRight2")
                    }.padding(.vertical, 10)
                    
                }.padding(.leading, 10)
                
                
            }.padding(.vertical, 10)
        )
    }
}


struct Type5Cell: IdentifiableCell {
    let id = UUID()
    let cellType: CellType = .type4
    
    func view() -> AnyView {
        return AnyView(
            HStack(alignment: .center) {
                VStack {
                    Text("Eliminar usuario digital")
                        .bold()
                        .foregroundColor(Color.red)
                }.offset(y: 5)
            }.frame(maxWidth: .infinity)
                .padding(.vertical, 15)
            
        )
    }
}

//public struct InformationView: View {
//    
//   
//}
//
//#Preview {
//    InformationView()
//}
//
