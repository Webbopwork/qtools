# QTools
QTools is a collection of scripts to speed up your dev process.

## Usage
To use a QTool with the `qtool` command set up, follow this format:
```
qtool {COMMAND NAME(same as directory in the repo)} {ALL COMMAND ARGUMENTS YOU WISH TO USE}
```
Examples:
```
qtool chkstat firefox
qtool chkstat qtool
qtool pcinfo
qtool flatlink steam
```

## Setup

To initialise, add this to your ~/.bashsrc
```
alias qtool_setup=". <(curl -s https://raw.githubusercontent.com/Webbopwork/qtools/refs/heads/main/qtool/setup.sh)"
```
or run this command in your terminal (adding this to ~/.bashsrc will initialise `qtool` without using `qtool_setup`)
```
. <(curl -s https://raw.githubusercontent.com/Webbopwork/qtools/refs/heads/main/qtool/setup.sh)
```
Alternatively you can download any script you wish and use it separately.
