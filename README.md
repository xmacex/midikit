# midikit

The vision is that by connecting MIDI devices to norns, their parameters become norns parameters too; a rhizome.

![](rhizome.png)

MIDI output from [mod matrix for the Matrix Mod](https://llllllll.co/t/mod-matrix-for-the-matrix-mod/57231). Can output either MIDI cc which is the primary use case, or MIDI notes. Modeled after sixolet's [crowkit](https://github.com/sixolet/crowkit/).

# Installation

Requires [*matrix* mod](https://llllllll.co/t/mod-matrix-for-the-matrix-mod/57231) to be installed and active.

After installation, enable the mod and restart.

# Usage

Look up the MIDI implementation chart of your gear, and try e.g. filter cutoff (cc 3 on OP-Z), sample starting point (cc 5 on OP-Z), effect sends (cc 13 and 14 on OP-Z). Set midikit parameters for your device, channel and cc. Then go to *SYSTEM > MOD > MATRIX* and aim either toolkit mod or Cyrene mod output to *value*.

You can also modulate the MIDI device number, channel and even the output mode, but it gets pretty confusing fast. Don't do it... maybe? ;)

Besides cc, you can also push notes from two or more sources for generative sequencing. MIDI notes with get stuck as no note off is sent, but so far I've used it with OP-Z sampler and have relied on trigger envelopes and on note-stealing.
