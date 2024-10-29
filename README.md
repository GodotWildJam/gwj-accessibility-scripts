# Godot Engine Accessibility Scripts
This repo is a culmination of the accessibility scripts created and provided by members of the Godot and Godot Wild Jam communities. For more information on what's needed, please check the [Roadmap](ROADMAP.md)


## Usage

Copy the contents of `src/options` into a folder in your project. Then, instantiate the custom nodes into an option menu scene. 

### Volume Sliders

For example, we could create a new scene for our menu with a root `Control` node. Then we could drag the `volume_slider.tscn` from the FileSystem dock to the `Control` node in the Scene dock. 

Alternatively, one can instantiate an `HSlider` or `VSlider` and then attach the `volume_slider.gd` script to the node.

After that, clicking on the new volume sider will open up its editable properties in the Inspector dock. Update these settings to the targetted audio bus for that volume slider.

### Rebindable Actions

The `rebindlable_action.tscn` works similarly, in that it will create a button, and have settings to bind it to a particular input action. 

> [!NOTE]  
> The examples are bound to Godot's built-in `ui*` actions by default, but it is recommended to create your own custom input actions to rebind, first.

 Similarly, instantiating a `Button` and attaching the `rebindable_action.gd` script to the node will get a similar outcome.

 After that, clicking on the new button will open up its editable properties in the Inspector dock. Update the action name to the one intended for rebinding.

> [!WARNING]  
> These buttons only allow one input per action. They are not recommended to use for rebinding the built-in `ui*` actions.
