# Initial scope of work

## _Dramatis personae_
znmeb - M. Edward (Ed) Borasky, developer, human
goose - The `goose` coding agent
gemma4:31b - the AI model for the first development phase
xen.assist - A composer's agentic assistant for xentonal music
XentonalAssistant - the R package being developed - where `xen.assist` lives

## The goal

The goal is an AI agent that assists composers who are writing xentonal music.
For the minimum viable product, the capabilities required are
- A chat interface in a terminal window.
- The composer can specify a musical scale.
- `xen.assist` can generate audio sample files of notes from that scale with composer-
specified pitch and duration. The sample files will be in WAV format with a composer-
specified waveform: sine, triangle, square or sawtooth.
- `xen.assist` can combine samples of individual notes into chord files.
- `xen.assist` can combine samples of chords into a chord progression.
- The composer can extract notes from a chord progression to produce a melody and
`xen.assist` can construct a WAV file with that melody and the chord progression.

`xen.assist` will be implemented in an R package `XentonalAssistant` that follows
all the guidelines in <https://r-pkgs.org/>, especially

- there must be unit tests with `testthat`,
- all CRAN checks in `devtools::check()` must pass, and
- there must be a `pkgdown` site for the package.

Sample dialogue:

Composer: I want to write a piece using Wendy Carlos' gamma scale. Can you list the
frequencies of the notes in that scale for three six starting from A110?
`xen.assist`: (lists the notes)

Composer: Please display the interval matrix for one period of the scale.
`xen.assist`: (displays interval matrix in Markdown table format)

Composer: Please list all the triads within three periods close to a 12-tone equal
tempered major chord and minor chord.
`xen.assist`: (lists them)

Composer: Please create a WAV file containing all those chords for two seconds
each, using a sawtooth waveform. Call it "carlos-gamma-triads.wav". The sample
rate should be 48000 samples per second and the width should be 24 bits.
`xen.assist`: (creates the WAV file).

## Initial resources provided

- Ubuntu 26.04, R and RStudio Server: I expect `goose` to use the command line, but
I will use RStudio to do project management, document editing, data frame display, etc.
- `~/Projects/XentonalAssistant`: This is where the package will be constructed. It
is set up as an RStudio project and currently has a skeleton `pkgdown` site in place.
- `~/Projects/eikosany` and `~/Projects/consonaR`: These are R packages I've written
that will be the base for the xentonal aspects of the composition process. I expect
source code and tests can be copied from them into XentonalAssistant as needed, rather
than calling them as tools. I want `XentonalAssistant` to be self-contained except for
R package dependencies from CRAN.
- `~/Projects/skills`: This is Posit's collection of Claude-style skills for use by
R and Python programmers. They are downloaded from `https://github.com/posit-dev/skills>.
- CRAN packages: There is a collection of CRAN AI packages at
<https://opensource.posit.co/software/?topics=Artificial%20Intelligence> that I am hoping
will suffice in building `xen.assist`. Posit have their own agent now, based on what they
learned building these packages. I won't be using it because it requires a paid subscription.
- Local model: I am exclusively using local models and that's a hard requirement. Ollama
is the model host. The intial development will be done on an NVIDIA GeForce RTX 3090 with
24 GB of VRAM. I'm currently using `gemma4:31b` but if there is a better model that will
fit I can switch easily.

## Coding agent recordkeeping

- All persistent state `goose` creates during the package development process must be kept in
ASCII text files in the directory `~/Projects/XentonalAssistant/inst/prompts`. Markdown,
YAML, JSON, TOML, etc. are all acceptable but the files must be ASCII only, have
filenames without spaces or special characters, and must ***not*** be "hidden" /
"dotfiles"! This applies to prompts, configuration files, skills, recipes, etc. If `goose`
requires files elsewhere or requires hidden files, copies of them must be placed
in this directory and a list of where the originals can be found must be provided.
- References / citations must be documented for all websites and other published material
used. There is a file `~/Projects/XenAssistant/inst/REFERENCES.bib` that I will augment with
those citations.
