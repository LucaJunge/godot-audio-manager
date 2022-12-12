# godot-audio-manager

A Godot add-on that handles playing sound for my personal projects.

## Installation

Move the addons/audio-manager folder into the addons folder of your project.

## Usage

It is useful to make the Audio Manager available as an Autoload, to use it anywhere in your scene tree.

You can then call AudioManager.play() with the source (either as a path starting with res:// or as an AudioStream)

```
AudioManager.play(source, volume)
```
