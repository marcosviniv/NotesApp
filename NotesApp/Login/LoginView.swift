//
//  ContentView.swift
//  NotasApp
//
//  Created by Marcos Vinícius Vieira on 05/01/25.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var passoword: String = ""
    @State var goRegister: Bool = false
    @State var goNotes: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor.ignoresSafeArea(.all)
                VStack(spacing: 25.0) {
                    
                    Text("Login")
                        .font(.system(size: 55, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Group {
                        TextField("", text: $email, prompt: Text("E-mail").foregroundStyle(.white))
                            .keyboardType(.emailAddress)
                        
                        SecureField("", text: $passoword, prompt: Text("Password").foregroundStyle(.white))
                    }
                    .frame(height: 40)
                    .padding(7)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 8).stroke(Color.pinkColor, lineWidth: 2)
                    })
                    .padding(7)
                    .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Button {
                        goNotes.toggle()
                    } label: {
                        Text("Login")
                            .frame(width: 180, height: 45)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                            .background(Color.pinkColor)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    Spacer()
                    Button {
                        goRegister.toggle()
                    } label: {
                        Text("Don't have an account? Register")
                            .frame(height: 45)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                    }
                }
                .padding(.horizontal,20)
                .padding(.bottom, 50)
                }
            .navigationDestination(isPresented: $goRegister) {
                RegisterView()
            }
            .navigationDestination(isPresented: $goNotes) {
                NotesView()
            }
            }
        }
    }


#Preview {
    LoginView()
}
