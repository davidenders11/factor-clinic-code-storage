# General

- All commands of the form: `<noun> <verb> [-options [option-value]] [argument [argument...]]`

# Aliases/Commands

- Command Alias: to create a command for `breakpoint set --file foo.c --line 12` type `command alias bfl breakpoint set -f %1 -l %2`
- Breakpoint commands: to add a rule to breakpoint 1, enter `breakpoint command add 1.1`
- breakpoint modify -c "self == nil" -C bt --auto-continue 1 2 3
