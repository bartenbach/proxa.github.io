---
title:  "Using CAC with Mac OS Catalina and Safari"
date:   2020-04-03 15:10:17 -0500
categories: career dod cac smartcard osx safari mac
---
After spending an unbelievable amount of time trying to get this working, I figured I'd throw together some steps to help anyone else out.

1. For Catalina, you need to uninstall all 3rd party CAC enablers.  You can do that by following [these instructions](http://www.militarycac.com/macuninstall.htm)
2. Apple also gave the [following guidance](https://support.apple.com/en-us/HT210541) which I followed.
3. I was never able to pair my smart card to the OS, until I found [this article](https://support.yubico.com/support/solutions/articles/15000006468-using-your-yubikey-as-a-smart-card-in-macos). The important command here was `sc_auth pairing_ui -s enable` which started pairing.  After this, I was able to login to the OS using my CAC.
4. Lastly, I blew away all certs in my keychain - this seems to play an important role.  You can find these by pressing command + space and launching "Keychain Access".  Under login > Certificates - I had a bunch of crap.  I blew away the entire folder, then from scratch, followed Step 5 from [these instructions](https://militarycac.com/macnotes.htm)

After that, nothing changed until I rebooted, at which point I was finally able to get a cert prompt and CAC in to DoD websites.

Hopefully this helps someone.
