# Initial scope of work

## The goal

The goal is an AI agent that assists composers who are writing xentonal music.
For the minimum viable product, the capabilities required are
- A chat interface in a terminal window.
- The composer can specify a musical scale.
- The agent can generate audio sample files of notes from that scale with composer-
specified pitch and duration. The sample files will be in WAV format with a composer-
specified waveform: sine, triangle, square or sawtooth.
- The agent can combine samples of individual notes into chord files.
- The agent can combine samples of chords into a chord progression.
- The composer can extract notes from a chord progression to produce a melody and the
agent can construct a WAV file with that melody and the chord progression.

The agent will be implemented as an R package that follows all the guidelines
in <https://r-pkgs.org/>, especially

- there must be unit tests with `testthat`,
- all CRAN checks in `devtools::check()` must pass, and
- there must be a `pkgdown` site for the package.

Sample dialogue:

Composer: I want to write a piece using Wendy Carlos' gamma scale. Can you list the
frequencies of the notes in that scale for three six starting from A110?
Agent: (lists the notes)
Composer: Please display the interval matrix for one period of the scale.
Agent: (displays interval matrix in Markdown table format)
Composer: Please list all the triads within three periods close to a 12-tone equal
tempered major chord and minor chord.
Agent: (lists them)
Composer: Please create a WAV file containing all those chords for two seconds each using a
sawtooth waveform. Call it "carlos-gamma-triads.wav". The sample rate should be 48000 samples
per second and the width should be 24 bits.
Agent: (creates the WAV file).

## Initial resources provided

- R and RStudio Server: I expect the agent to use the command line, but I use RStudio
to do project management, document editing, data frame display, etc.
- `~/Projects/XentonalAssistant`: This is where the package will be constructed. It
is set up with an RStudio project and currently has a skeleton `pkgdown` site in place.
- `~/Projects/eikosany` and `~/Projects/consonaR`: These are R packages I've written
that will be the base for the xentonal aspects of the composition process. I expect
source code and tests can be copied from them into XentonalAssistant as needed, rather
than calling them as tools. I want `XentonalAssistant` to be self-contained except for
R package dependencies from CRAN.
- `~/Projects/skills`: This is Posit's collection of Claude-style skills for use by
R and Python programmers. They are downloaded from `https://github.com/posit-dev/skills>.
- CRAN packages: There is a collection of CRAN AI packages at
<https://opensource.posit.co/software/?topics=Artificial%20Intelligence> that I am hoping
will suffice in building the agent. Posit has their own agent now, based on what they
learned building these packages.
- Local model: I am exclusively using local models and that's a hard requirement. Ollama
is the model host. The intial development will be done on an NVIDIA GeForce RTX 3090 with
24 GB of VRAM. I'm currently using `gemma4:31b` but if there is a better model that will
fit I can switch easily.

## Recordkeeping

All persistent state you create during the package development process must be kept in
ASCII text files in the directory `~/Projects/XentonalAssistant/inst/prompts`. Markdown,
YAML, JSON, TOML, etc. are all acceptable but the files must be ASCII only, have
filenames without spaces or special characters, and must ***not*** be "hidden" /
"dotfiles"! This applies to prompts, configuration files, skills, recipes, etc. If your
coding requires files elsewhere or requires hidden files, copies of them must be placed
in this directory and a list of where the originals can be found must be provided.
