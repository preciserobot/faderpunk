# faderpubnk firmware

This is the firmware for a midi controller with faders and a button for each fader (function button). Each fader also has a corresponding trs jack that can be used as either input or output of CV, gate or trigger signals. The firmware allows to load "apps" into the fadepunk via a web UI. Each app can take one or more faders to function.

The configurator web app is located in configurator/.
The firmware source code is in the faderpunk/ directory, and the associated libfp/ library. The latter is not to be modified for any extensions of the firmware.

We want to extend the apps, located in faderpunk/src/apps. The rest of the repository should not be modified except if a new app has to registerd somewhere, or added to the configurator.

## Rationale for new app

The base app is the control.rs app. It allows to output a control voltage output by the fader. The button can serve multiple functions, but is usually used as a mute button. The app can also send the fader position as a midi CC message, while if the function button is set as fader, it switches the configured CC value from the fader position (or state) and zero (mute).

I use the faders with the control app to send midi CC to a mixer. There is a way to configure the function button to send a CC value to an alternate CC channel at maximum value. This is used as a cue function.

I'd like to change this functionality so that the button acts as a switch of the main CC number and the alternate one, setting either CC value to the fader positions value or zero and vice versa. This would fix the issue that in the current app, pressing the function button, the CC value is set to maximum on the alternate CC number, instead of the current fader position value, while the main CC number is set to zero (mute).

In my CUE channel (headphones) I volume match the different channels before putting them on the main output, therefore volume control when the CUE CC channel is selected (button not lit). At the same time switching to the CUE channel should mute the main channel. And wenn pressing again to set the control app back to the main CC, the main CC number should return to the fader value while the CUE cc number should be zero,
