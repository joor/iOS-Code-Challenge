//
//  TwitterClientSpec.swift
//  Code_Challenge
//
//  Created by Austin Feight on 11/25/18.
//  Copyright (c) 2018 JOOR. All rights reserved.
//

@testable import Code_Challenge
import Nimble
import Quick

class TwitterClientSpec: QuickSpec {}

// MARK: - Tests
extension TwitterClientSpec {
  override func spec() 
  {
    var subject: TwitterClient!
    beforeEach { subject = .shared }
    
    describe("logIn(username:, password:)") {
      context("when a valid login is entered") {
        beforeEach { subject.logIn(username: "user", password: "password") }
        
        it("sets isLoggedIn.value = `true`") {
          expect(subject.isLoggedIn.value).to(beTrue())
        }
      }
      
      context("when an invalid login is entered") {
        beforeEach { subject.logIn(username: "user", password: "password") }
        
        it("does nothing") {
          expect(subject.isLoggedIn.value).to(beTrue())
        }
      }
    }
    
    describe("logOut()") {
      beforeEach {
        subject.isLoggedIn.value = true
        subject.logOut()
      }
      
      it("sets isLoggedIn.value = false") {
        expect(subject.isLoggedIn.value).to(beFalse())
      }
    }
    
    describe("loadTimeline()") {
      var timeline: [Tweet]!
      beforeEach { timeline = subject.loadTimeline() }
      
      it("contains at least one tweet with content and an author") {
        expect(timeline).toNot(beEmpty())
        expect(timeline.first?.user).toNot(beEmpty())
        expect(timeline.first?.content).toNot(beEmpty())
      }
    }
  }
}
