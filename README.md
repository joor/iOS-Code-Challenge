# iOS-Code-Challenge
Code challenge for iOS Developer Candidates

If we move on to an on-site interview, your completed project will be used as a starting point for pair-programming an additional feature with someone from the team.
This allows us to replicate a real-work scenario as much as possible, without spending time just to get the project started.


We've done our best to document the requirements and helper class `TwitterClient` as much as possible, but please feel free to reach out and ask questions if anything is unclear.


## Evaluation
We will be evaluating the code on:
- Code clarity/readability
- Architecture
  - Please architect this app in the way that you’d want to build at JOOR (6+ developers over 2+ years). 
  We understand that this may fall into over-architecting for the task at hand, 
  but the purpose is to understand how you draw the lines between different groups of responsibilities and how that translates into functional layers
- Unit test coverage and clarity


## Instructions
Cloning this project to begin, please build a simple Twitter client with two screens:
  - Log In
    - There should be fields to type in a username and a password
    - Upon tapping a "Log In" button, the code should eventually call `TwitterClient.logIn(username:, password:)` with the provided credentials; i.e. there may be intermediate objects and/or method calls in between tapping the button and calling `logIn(username:, password:)`
    - Once `TwitterClient.isLoggedIn.value` goes to `true`, the app should show the Tweet Feed screen
  - Tweet Feed
    - Show a list of tweets (Provided by `TwitterClient.shared.loadTimeline`)
      - Cells should include a title with the posting user’s handle and the content of the tweet
    - Navigation bar should have a "Log Out" button. On tapping this button:
      - `TwitterClient.shared.isLoggedIn.value` should be set to `false`
      - The Log In screen should be shown

### Additional Requirements: 
  - If `TwitterClient.isLoggedIn.value` is `true` on app launch, the app should go straight to the Tweet Feed screen

### Out of scope:
  - Any error handling for failed log in credentials. 
    If the credentials entered are incorrect, nothing should happen and the log in screen should remain displayed
  - Any UI tests


## Notes
- #### `TwitterClient`
We've provided a `TwitterClient` class to start you off. 
This class will help manage the logged in status, as well as the tweets to display.
Note that the `isLoggedIn` property is a ReactiveKit reactive `Property`. 
In order to listen for changes to this value, we use code like: 
```
isLoggedIn.observeNext { (isLoggedIn: Bool) -> Void in /* handle logged in status change */ }
```
- #### `TwitterClientSpec`
Included in the project is a test file to ensure that `TwitterClient` is acting the way we expect. 
If the tests are failing, then we've broken the project and please let us know.
The tests are written in a particular style, and use the `Quick` and `Nimble` frameworks; you are not expected to write tests in that particular style, nor are you expected to use `Quick` and `Nimble`.
Use whatever comes natural to you.

This class is meant to help you in lieu of using an actual Twitter API that takes some time to set up. 
If the class documentation provided is not adequate, please feel free to ask any questions about its use.

- ### Additional Frameworks
Feel free to use any frameworks that will help you, just please edit README's "Additional Frameworks Used" section below to note the ones you’ve used and what you’ve used them for


## Additional Frameworks Used
