//
//  String+HTML.swift
//  InterviewApp
//
//  Created by Alexey Bolvonovich on 3.11.21.
//

import Foundation

extension String {
    public var withoutHtml: String {
        guard let data = self.data(using: .utf8) else {
            return self
        }

        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return self
        }

        return attributedString.string
    }
}
