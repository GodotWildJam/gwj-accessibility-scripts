# Godot Engine Accessibility Scripts
This repo is a culmination of the accessibility scripts created and provided by members of the Godot and Godot Wild Jam communities. For more information on what's needed, please check the [Roadmap](ROADMAP.md)

These guidelines were inspired by the Game Accessibility Guidelines website: https://gameaccessibilityguidelines.com/full-list/

## Installation

### Godot Asset Library
This package is available as a plugin, meaning it can be added to an existing project. 

![Package Icon](/addons/gwj_accessibility_scripts/docs/gwj_mascot_80x80.png)  

When editing an existing project:

1.  Go to the `AssetLib` tab.
2.  Search for "GWJ Accessibility Scripts".
3.  Click on the result to open the plugin details.
4.  Click to Download.
5.  Check that contents are getting installed to `addons/` and `examples/` and there are no conflicts.
6.  Click to Install.


### GitHub

1.  Download the latest release version from [GitHub](https://github.com/GodotWildJam/gwj-accessibility-scripts/archive/refs/heads/main.zip).  
2.  Extract the contents of the archive.
3.  Move the `addons/gwj_accessibility_scripts` folder into your project's `addons/` folder.  
4.  Open/Reload the project.  

## Usage

Instantiate the custom nodes into an option menu scene. 

### Volume Sliders

For example, we could create a new scene for our menu with a root `Control` node. Then we could drag the `volume_slider.tscn` from the FileSystem dock to the `Control` node in the Scene dock. 

Alternatively, one can instantiate an `HSlider` or `VSlider` and then attach the `volume_slider.gd` script to the node.

After that, clicking on the new volume slider will open up its editable properties in the Inspector dock. Update these settings to the targetted audio bus for that volume slider.

### Setting Sliders

The setting slider is similar to the volume slider. However, these sliders only set the setting's value in the config file. It is up to the developer to apply the user's desired settings in the application.

Clicking on a slider will open up its editable properties in the Inspector dock. Update these settings to add a section and key name to your setting. Anything will do, and some examples are provided.

### Rebindable Actions

The `rebindlable_action.tscn` works similarly, in that it will create a button, and have settings to bind it to a particular input action. 

> [!NOTE]  
> The examples are bound to Godot's built-in `ui*` actions by default, but it is recommended to create your own custom input actions to rebind, first.

 Similarly, instantiating a `Button` and attaching the `rebindable_action.gd` script to the node will get a similar outcome.

 After that, clicking on the new button will open up its editable properties in the Inspector dock. Update the action name to the one intended for rebinding.

> [!WARNING]  
> These buttons only allow one input per action. They are not recommended to use for rebinding the built-in `ui*` actions.

## Links
[Game Accessibility Guidelines](https://gameaccessibilityguidelines.com/full-list/)  
[Godot Asset Library](https://godotengine.org/asset-library/asset/3718)  
[License](/LICENSE.txt)  
