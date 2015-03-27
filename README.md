# SSRadioButtonsController
A Radio Button Controller class for iOS written in Swift
All you need to do is to create an SSRadioButtonController object and add your UIButtons to it. It will automatically handle selecting and deselecting without interfering with your own implementations. 

###Sample Code
A sample code would look like this

```
var radioButtonController = SSRadioButtonsController()
radioButtonController.setButtonsArray([button1!,button2!,button3!])
```

### Add or Remove buttons
You can add/remove buttons from controller by 

```
radioButtonController.addButton(button1!)
radioButtonController.removeButton(button3!)
```

### Get currently selected button
To get the currently selected button, you can use 

```
var currentButton = radioButtonController.selectedButton()
```