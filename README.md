# SSRadioButtonsController
A Radio Button Controller class for iOS written in Swift. (Now ported to Swift2) 
All you need to do is to create an `SSRadioButtonController` object and add your `UIButton`s to it. It will automatically handle selecting and deselecting without interfering with your own implementations. 
If you want your buttons to have a radioButton circle next to them, use the custom class `SSRadioButton`. 

![Demo](https://github.com/shamasshahid/SSRadioButtonsController/blob/master/demoRadioButtons.gif?raw=true)

###Sample Code
Sample code would look like this

```
var radioButtonController = SSRadioButtonsController(buttons: button1, button2, button3)
```

### SSRadioButtonControllerDelegate
Implement the optional function `didSelectButton`of delegate to get selected button object. If `shouldLetDeSelect` is set to true, on deselecting a selected button the value passed in optional parameter is nil.

### Get currently selected button
To get the currently selected button, you can use 

```
var currentButton = radioButtonController.selectedButton()
```

### Add or Remove buttons
You can add/remove buttons from controller by 

```
radioButtonController.addButton(button1!)
radioButtonController.removeButton(button3!)
```
