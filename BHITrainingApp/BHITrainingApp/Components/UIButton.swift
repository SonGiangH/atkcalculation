//
//  UIButton.swift
//  BHITrainingApp
//
//  Created by Son Giang Hong on 5/3/2024.
//

import SwiftUI

enum UIButtonType {
    case primary, info, success, warning, danger, disabled
}

struct UIButton: View {
    // there are 3 props: onPress, title, disable
    var onPress: (() -> Void)?
    var title: String?
    var _disabled: Bool = false
    
    // constructor custom
    init(onPress: (() -> Void)?, title: String?, disabled: Bool = false) {
        self.onPress = onPress
        self.title = title
        self.disabled = disabled
    }
    
    // getter and setter
    var disabled: Bool {
        set(value) {
            _disabled = value
        }
        get {_disabled}
    }
    
    // other props: type of button: primary, alert, danger
    var buttonType: UIButtonType = .primary
    
    //calculated value
    var buttonColor: Color {
        switch(buttonType) {
            case .primary:
                return Color(hex: 0xf7f7f7)
            case .info:
                return Color(hex: 0x5bc0de)
            case .success:
                return Color(hex: 0x5cb85c)
            case .warning:
                return Color(hex: 0x0275d8)
            case .danger:
                return Color(hex: 0xd9534f)
            case .disabled:
                return Color.black.opacity(0.5)
        }
    }
    
    var body: some View {
        Button(action: self.onPress ?? {}) {
            Text(self.title ?? "")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight:50)
                .foregroundColor(.black)
                .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .background(_disabled ? Color.black.opacity(0.5) : buttonColor)
        }.disabled(disabled)
    }
}

#Preview {
    UIButton(onPress: {}, title: "haha", disabled: true)
}
