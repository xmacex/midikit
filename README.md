# midikit

The vision is that by connecting MIDI devices to norns, their parameters become norns parameters too. A rhizome.

So I want to modulate them like I can modulate norns onboard parameters with the mindblowing [mod matrix for the Matrix Mod](https://llllllll.co/t/mod-matrix-for-the-matrix-mod/57231).

MIDI output from norns Matrix mod. Can output MIDI cc which is the primary use case, and also MIDI notes. There is some confusion 😕 since *device*, *channel* and *cc* appear not only as parameters but also as modulation targets. Don't use them... (or do, if you want to get wild).

The latter will hang, but so far I've used it with OP-Z sampler and have counted on trigger envelopes and note-stealing.
