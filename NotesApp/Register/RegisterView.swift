//
//  RegisterView.swift
//  NotasApp
//
//  Created by Marcos Vinícius Vieira on 05/01/25.
//

import SwiftUI

struct RegisterView: View {
    
    @State var email: String = ""
    @State var passoword: String = ""
    @State var passowordConfirm: String = ""
    @State var goNotes: Bool = false
    @State var isPresentedAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor.ignoresSafeArea(.all)
                VStack(spacing: 25.0) {
                    
                    Text("Register")
                        .font(.system(size: 55, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.top, 10)
                        .padding(.bottom, 50)
                    
                    Group {
                        TextField("", text: $email, prompt: Text("E-mail").foregroundStyle(.white))
                           
                            .keyboardType(.emailAddress)
                        
                        SecureField("", text: $passoword, prompt: Text("Password").foregroundStyle(.white))
                          
                        SecureField("", text: $passowordConfirm, prompt: Text("Confirm Password").foregroundStyle(.white))
                        
                    }
                    .frame(height: 40)
                    .padding(7)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 8).stroke(Color.pinkColor, lineWidth: 2)
                    })
                    .padding(7)
                    .foregroundStyle(.white)
                    .autocorrectionDisabled(true) // Remove autocorreção
                    .autocapitalization(.none) //Remove caracteres maíusculos
                    Spacer()
                    
                    Button {
                        if passoword.trimmingCharacters(in: .whitespacesAndNewlines) == passowordConfirm.trimmingCharacters(in: .whitespacesAndNewlines) {
                            goNotes.toggle()
                        } else {
                            //Alert
                        }
                        
                    } label: {
                        Text("Register")
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                            .background(isDisabledButton ? Color.pinkColor.opacity(0.6) : Color.pinkColor)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .disabled(isDisabledButton)
                 //   Spacer()
                    
                }
                .padding(.horizontal,20)
                .padding(.bottom, 50)
                }
            .navigationDestination(isPresented: $goNotes) {
                NotesView()
            }
            }
        }
    
    var isDisabledButton: Bool {
        return email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || passoword.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || passowordConfirm.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty //|| passoword.trimmingCharacters(in: .whitespacesAndNewlines) != passowordConfirm.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    }

#Preview {
    RegisterView()
}
