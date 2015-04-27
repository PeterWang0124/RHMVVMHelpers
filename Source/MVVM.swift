//
//  MVVM.swift
//  CloudPassport
//
//  Created by Retso Huang on 12/24/14.
//  Copyright (c) 2014 Retso Huang. All rights reserved.
//

import Foundation

func uniq<S : SequenceType, T : Hashable where S.Generator.Element == T>(source: S) -> [T] {
  var buffer = [T]()
  var addedDict = [T: Bool]()
  for elem in source {
    if addedDict[elem] == nil {
      addedDict[elem] = true
      buffer.append(elem)
    }
  }
  return buffer
}

class Dynamic<T> {
  typealias Observer = T -> Void
  
  // MARK: - Variable
  private var observers = [Int: Observer]()
  
  var value: T {
    didSet {
      self.send()
    }
  }
  
  // MARK: - Binding
  func bind(functionName: String = __FUNCTION__, fileName: String = __FILE__, lineNumber: Int = __LINE__, observer: Observer) {
    let hashValue = "\(functionName)\(fileName)\(lineNumber)".hashValue
    if self.observers[hashValue] == nil {
      self.observers[hashValue] = observer
    }
  }
  
  func bindAndFire(functionName: String = __FUNCTION__, fileName: String = __FILE__, lineNumber: Int = __LINE__, observer: Observer) {
    self.bind(functionName: functionName, fileName: fileName, lineNumber: lineNumber, observer: observer)
    observer(value)
  }
  
  // MARK: - Private Function
  private func send() {
    for observerkey in self.observers.keys {
      if let observer = self.observers[observerkey] {
        observer(value)
      }
    }
  }
  
  // MARK: - Initializer
  init(_ v: T) {
    value = v
  }
  
}