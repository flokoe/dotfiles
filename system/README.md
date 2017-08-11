# System files
On my personal notebook at work I use a really minimalistic Setup.
I only have a base installation of Debian Stretch withoud any pre installed desktop environment.
Therefore I have to configure most of the functionalty myself

Here I gather all my system configs to reuse them if I have to reinstall my setup.

I use Debian Stretch on a Lenovo Thinkpad t470s with docking station and two external monitors and all these files are really specific for my Setup, so I do not reccommend using these configs for your own setup.

### Again: I do no reccommend using my conf files. Only if you really know what you are doing and even then only with caution!

## How to use
Normally I have all configs in their correct absolute paths, so I just copy them to / (you need priviledged rights) for instance:
```
cd ~/dotfiles/system/
sudo cp -r etc/ /
```
If there are any special cases I will write further instructions in this README file.
## Further instructions
None
## Config Table
|File |Description|
|-----|-----      |
|/etc/systemd/logind.conf.d/00-flokoe-logind.conf|Overwrites logind settings for power management|
