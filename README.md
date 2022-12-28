# Nix flake example -- multiple dev shells

This repo holds a nix flake with multiple development shells, all targeting macOS non-ARM systems.

There are three language-specific shells:

- `python` includes a python interpreter, `poetry`, and `black`
- `javascript` includes a node interpreter, `prettier`, `yarn`, and `eslint`
- `java` includes `sbt` and `openjdk-11`

There's also an "omnishell" that includes all of the dependencies of the distinct shells.

The shells are presented in a [_nix flake_](https://nixos.wiki/wiki/Flakes).
To use any of them, you'll need to:

- install the nix package manager (this can be done safely and won't affect anything else in your system)
- enable flakes support by adding `experimental-features = nix-command flakes` to `$HOME/.config/nix/nix.conf`
- fire up one of the shells: `nix develop .#javascript` (or `.#python`, `.#java`, or `.#omnishell`)

I didn't mess with golang here because I don't know any of the needed tools, but if you need to work with
golang in nix, there's an [excellent series of blog posts](https://xeiaso.net/blog/nix-flakes-1-2022-02-21) on
golang with nix flakes. Really I think it's a great series for nix flakes in general as well, but it builds a
go project, and I wasn't interested in that part at the time I read it.

