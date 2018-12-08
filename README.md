# blackout
Solidarity in opposing the Australian Assistance and Access Bill (#AABill)

## What is this?
A repo to provide easy-to-use solutions to blackout Australia, in solidarity
with Australians who oppose the Assistance and Access Bill.

## How is this repo organised?

Preferrably there should be one subdirectory per major (family of) OSes. Each
directory shall contain some easy-to-use setup and teardown scripts or
installer/uninstaller for the particular OS.

## How does this work?

For example, under GNU/Linux OSes, the goal of the main script shall be to
periodically download a blocklist, and update rules in a dedicated `BLACKOUT`
chain in `iptables`.

There shall also be scripts to:
- setup a dedicated `BLACKOUT` chain in the iptables filter table, and setup a
  privileged cron job;
- stop any running cron job, remove the cron job, and tear down the dedicated
  `BLACKOUT` chain.

## Caveat Emptor

This work is incomplete and TOTALLY untested. Use at your own risk. No
contributor to this repository will take responsibility for any damage or loss
caused by the use of this work.

## Notes

The major (families of) operating systems I want to have covered are:
- Windows
- GNU/Linux
- macOS
- BSD

Bonus
- mmmmaybe Android
- iOS (is it technically feasible?)
- other scriptable routers (e.g. RouterOS?)

Contributions are welcome via pull requests

## License

BSD 2-Clause "Simplified" License
