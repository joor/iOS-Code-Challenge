//
//  TwitterClient.swift
//  Code Challenge
//
//  Created by Austin Feight on 11/21/18.
//  Copyright © 2018 JOOR. All rights reserved.
//

import ReactiveKit

protocol TwitterClientType {
  var isLoggedIn: Property<Bool> { get }
  
  func logIn(username: String, password: String)
  func logOut()
  
  func loadTimeline() -> [Tweet]
}

final class TwitterClient: TwitterClientType {
  static let shared = TwitterClient()
  
  let isLoggedIn: Property<Bool>
  
  private static let isLoggedInKey = "isLoggedIn"
  private let bag = DisposeBag()
  
  private init()
  {
    isLoggedIn = Property(UserDefaults.standard.bool(forKey: TwitterClient.isLoggedInKey))
    isLoggedIn.observeNext { UserDefaults.standard.set($0, forKey: TwitterClient.isLoggedInKey) }
              .dispose(in: bag)
  }
}

// MARK: - Interface
extension TwitterClient {
  /**
   Attempts to log in the user.
   
   On success, the property `isLoggedIn.value` will be set to `true`
   
   On failure, nothing will happen
   
   - Parameter username: The username to log in with. Valid username is `"user"`
   - Parameter password: The password to log in with. Valid password is `"password"`
  */
  func logIn(username: String, password: String)
  {
    if users[username] == password {
      isLoggedIn.value = true
    }
  }
  
  /// Sets the `isLoggedIn.value` property to `false`
  func logOut()
  {
    isLoggedIn.value = false
  }
  
  /// Returns a list of tweets
  func loadTimeline() -> [Tweet]
  {
    return tweets
  }
}

private let users = ["user": "password"]

private let tweets = [
  Tweet(id: 1, content: "Oh brother...", user: "Isaac Casanova"),
  Tweet(id: 2, content: "No idea what this code is doing but LGTM 👍", user: "Austin Feight"),
  Tweet(id: 3, content: "You miss 100% of the shots you don't miss - Wayne Gretsky - Michael Scott", user: "Jordan Buzzell"),
  Tweet(id: 4, content: "I'm definitely not driving right now", user: "Dan Katz"),
  Tweet(id: 5, content: "I did some jawns", user: "Ethan Riback"),
  Tweet(id: 6, content: "It's short for Jebediah", user: "JBD"),
  Tweet(id: 7, content: "I feel bad for my dog. I'll be dating a girl for months and then she's just gone and he has no idea why", user: "Bryan Pan"),
  Tweet(id: 8, content: "1 S and 2 As god dammit", user: "Issac Casanova"),
  Tweet(id: 9, content: "Something about aliens", user: "Allen Xu"),
  Tweet(id: 10, content: "Send it", user: "Julia Fraenkel"),
  Tweet(id: 11, content: "Let's nerd out and talk about stuff", user: "Derek Parham"),
  Tweet(id: 12, content: "THIIIICCCCCCCC", user: "Jennifer Zhu"),
  Tweet(id: 13, content: "Next season's biggest trend is see-through rain coats", user: "Kristin Savilia"),
  Tweet(id: 14, content: "The team is alright", user: "Penny Xing"),
  Tweet(id: 15, content: "Upstream... Downstream...", user: "Chad Cohen"),
  Tweet(id: 16, content: "Imagine!", user: "Tenzing Dorjee"),
  Tweet(id: 17, content: "Fake it til you make it", user: "Jacqueline Wu"),
  Tweet(id: 18, content: "Not with that attitude", user: "Lawrence Li"),
  Tweet(id: 19, content: "Hold on to your butts!", user: "Roberto Pedroso"),
  Tweet(id: 20, content: "Call me PR papi", user: "James Cerrato"),
  Tweet(id: 21, content: "*tries coffee* Whoa; is this what being alive feels like?", user: "Dan Katz"),
  Tweet(id: 22, content: "The thing is: when you have a power drill, you win.", user: "Julia Fraenkel"),
]
