//
//  InsulinTypeChooserView.swift
//  MockKitUI
//
//  Created by Pete Schwamb on 12/30/20.
//  Copyright © 2020 LoopKit Authors. All rights reserved.
//

import SwiftUI
import LoopKit

public struct InsulinTypeChooser: View {
    
    @Binding private var insulinType: InsulinType?
    
    let supportedInsulinTypes: [InsulinType?]
    
    public init(insulinType: Binding<InsulinType?>, supportedInsulinTypes: [InsulinType], allowUnsetInsulinType: Bool = false) {
        if allowUnsetInsulinType {
            self.supportedInsulinTypes = [InsulinType?](supportedInsulinTypes) + [nil]
        } else {
            self.supportedInsulinTypes = supportedInsulinTypes
        }
        self._insulinType = insulinType
    }

    public var body: some View {
        ForEach(supportedInsulinTypes, id: \.self) { insulinType in
            if let insulinType = insulinType {
                HStack {
                    ZStack {
                        Image(frameworkImage: "vial_color")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color(frameworkColor: insulinType.brandName))
                        Image(frameworkImage: "vial")
                            .resizable()
                            .scaledToFit()
                    }
                    .padding([.trailing])
                    .frame(height: 70)
                    CheckmarkListItem(
                        title: Text(insulinType.title),
                        description: Text(insulinType.description),
                        isSelected: Binding(
                            get: { self.insulinType == insulinType },
                            set: { isSelected in
                                if isSelected {
                                    withAnimation {
                                        self.insulinType = insulinType
                                    }
                                }
                            }
                        )
                    )
                }
                .padding(.vertical, 4)
            } else {
                HStack {
                    CheckmarkListItem(
                        title: Text("Unset"),
                        description: Text("The currently selected fast acting insulin model will be used as a default."),
                        isSelected: Binding(
                            get: { self.insulinType == nil },
                            set: { isSelected in
                                if isSelected {
                                    withAnimation {
                                        self.insulinType = nil
                                    }
                                }
                            }
                        )
                    )
                }
                .padding(.vertical, 4)
            }
        }
    }
}

struct InsulinTypeChooser_Previews: PreviewProvider {
    static var previews: some View {
        InsulinTypeChooser(insulinType: .constant(.novolog), supportedInsulinTypes: InsulinType.allCases)
    }
}

extension InsulinType {
    var image: UIImage? {
        return UIImage(frameworkImage: "vial")?.withTintColor(.red)
    }
}
