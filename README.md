# ViewLayout
A Struct to help you layout views with less code 
# Welcome To View Layout! 
View layout is an struct extension to UIView that allows you to create a flexible and easy to understand frame for new views! It uses an enum to calculate it's origin based on the view position you select and it makes laying out new views much easier and faster than setting up 10-20 lines of constraint code for each view. It works with the ViewPosition Enum and CGRect under the hood to position the view exactly how you want it. 
## Getting Started
All you have to do to obtain the power of ViewLayout and ViewPosition is add the ViewLayout file in the repository to your project

When you want to create view and set it's Frame with view layout, just initialize the ViewLayout object with your preferred attributes like so: 

```
let view1Layout = UIView.ViewLayout(withBounds: self.view, position: .topCenter, size: CGSize(width:200,height:200), padding: (0,-20)).makeInnerLayout()
```
Then, either initialize the view you want to layout and set the frame, or inject it during initialization

```
let view1 = UIView()
view1.frame = view1Layout
//or
let view1 = UIView(frame:view1Layout)
```
## Running the tests

To be added 

## Contributing
If you think you can improve this current tool (which I'm sure most could), change what is appropriate and send a pull request. Any ideas will be considered! 
