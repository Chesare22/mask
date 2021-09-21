# Mask

Simple command-line application that calculates the subnet mask given a number. If the flag `--wildcard` (or `-w`) is passed, then it calculates the wildcard (inverse) of the mask.

## Examples

```powershell
mask 24
255.255.255.0
mask 24 --wildcard
0.0.0.255
mask 26
255.255.255.192
mask --wildcard 26
0.0.0.63
mask 10
255.192.0.0
mask -w 10
0.63.255.255
```

## Installation

### Prerequisites

Have [elixir](https://elixir-lang.org/install.html) installed. This will also install the tools `mix` and `escript`.

### Build

Go to the folder of the project and run the command:

```powershell
mix escript.build
```

This will generate a file called `mask`, without any extension.

### Run

You can run the application by running the file created in the build step:

```powershell
escript ./mask <int> [-w | --wildcard]
```

Where `<int>` is an integer between 0 and 32 to be converted as an `a.b.c.d` form, and the flag `--wildcard` (or `-w`) tells if it should calculate the wildcard instead of the mask.

### Add as an alias in your terminal

This step is optional and it depends on every terminal. This is to have the script available globally. In Powershell, you can do it by adding a function to your profile. The function is:

```powershell
function mask {
  escript "<path_to_mask>" $args
}
```

And you can open your `profile.ps1` file passing the variable `$profile` to your code editor. For example, to open the file in Visual Studio Code, you have to run:

```
code $profile
```

Just paste the function there and save the file.
