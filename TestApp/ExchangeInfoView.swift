//
//  ExchangeInfoView.swift
//  TestApp
//
//  Created by www.abcom.in on 05/03/24.
//

import SwiftUI

struct ExchangeInfoView: View {
    @Environment(\.dismiss) var dismissExchangeInfoView
    var body: some View {
        ZStack{
            // background img
            
            Image(.parchment)
                .resizable()
                .scaledToFill()
                .background(Color.brown)
                .ignoresSafeArea()
            VStack {
                
                Image(.icLogoLotr)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(Capsule())
                // heading
            
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(2.5)
                    .foregroundStyle(.black)
                    .padding(20)
        
                
                // Text
                CenterText(textString: "Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
            
                // G Piece
                PieceOrPennyInfoView(
                    leftImage: .goldpiece, rightImage: .goldpenny, centerText: "1 gold piece = 4 gold pennies"
                )
                // G Penny
                PieceOrPennyInfoView(
                    leftImage: .goldpenny, rightImage: .silverpiece, centerText: "1 gold penny = 4 silver pieces"
                )
                // S Piece
                PieceOrPennyInfoView(
                    leftImage: .silverpiece, rightImage: .silverpenny, centerText: "1 silver piece = 4 silver pennies"
                )
                // S Penny
                PieceOrPennyInfoView(
                    leftImage: .silverpenny, rightImage: .copperpenny, centerText: "1 silver penny = 100 copper pennies"
                )
                // button
                Button("Done") {
                    dismissExchangeInfoView()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
            }
            .foregroundColor(.black)
        }
    }
}

struct PieceOrPennyInfoView: View {
    var leftImage: ImageResource
    var rightImage: ImageResource
    var centerText: String
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            Text(centerText)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeInfoView()
}

struct CenterText: View {
    var textString: String
    var body: some View {
        Text(textString)
            .font(.title3)
            .padding(EdgeInsets(top: 0, leading: 120, bottom: 0, trailing: 120))
    }
}
