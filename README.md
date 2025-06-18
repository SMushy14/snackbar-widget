# Snackbar Widget
**Snackbar widget - is an action widget that display a popping message at the bttom of the screen for few seconds without interfering with the workflow of the screen**

## How to Run the project
### 1. Clone the repository
<pre> https://github.com/SMushy14/snackbar-widget.git  </pre>
### 2. Navigate to the repository
<pre> cd snackbar_widget  </pre>
### 3. Select an emulator and make sure it's running
### 3. Run the app
<pre> flutter run  </pre>

## Attributes used for the Snackbar Widget
| Attribute         | Explanation                            |
|-------------------|----------------------------------------|
| `content:`        | This is main widget inside the Snackbar    |
| `Icon()`          | Adds an icon to the screen      |
| `backgroundColor:`| Adds a color to the background of the snackbar |     |
| `Row()`           | This is a layout widget that allows adding more than one widget to the snackbar because the content property of snackbar allows a single widget |
| `behavior:`       | Makes the snackbar property to be floating      |
| `shape:`          | Makes the shape of the snackbar to be a rectangle with rounded borders     |
| `duration:`       | Specifies the time that the snackbar should be displayed for|
| `action:`         | Inserts the Undo button    |

![Snackbar Image](assets/snackbar-01.png)
![](assets/snackbar-02.png)

## More Explanation
- We use the **ScaffoldMessenger.of(context).showSnackBar();** to fetch contents of the snackbar and display the snackbar
- The **ScaffoldMessenger.of(context).hideCurrentSnackBar();** hides the current visible snackbar before displaying the next to avoid the stacking up of snackbars whenever the snackbar is needed to be displayed.
- The Snackbar Widget respects the Safe Area on the device meaning that it will be displayed above the system navigation bar thus manually adjusting with the padding.
### Importance of snackbar
- Snackbar is used to display confirmation message example "*Message sent*"
- Used to allow undo actions example "Email deleted(*Undo*)"
- Used to display an action feedback example "*Product added to cart*"
- Used for error notifications example" *Connection lost...*"
