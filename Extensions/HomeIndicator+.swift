//
//  HomeIndicator+.swift
//  TechUniFest
//
//  Created by Yu Takahashi on 10/2/24.
//

import SwiftUI

struct PrefersHomeIndicatorAutoHiddenPreferenceKey: PreferenceKey {
    typealias Value = Bool

    static let defaultValue: Value = false

    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue() || value
    }
}

extension View {
    // Controls the application's preferred home indicator auto-hiding when this view is shown.
    func prefersHomeIndicatorAutoHidden(_ value: Bool) -> some View {
        preference(key: PrefersHomeIndicatorAutoHiddenPreferenceKey.self, value: value)
    }
}
